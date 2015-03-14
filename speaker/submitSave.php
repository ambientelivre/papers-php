<?php

require_once 'include/auth.inc.php';
require_once 'include/basic.inc.php';
require_once 'include/mysql.inc.php';
require_once 'include/persons.inc.php';
require_once 'include/pathinfo.inc.php';
require_once 'include/event_dates.inc.php';
require_once 'include/proposals.inc.php';
require_once 'include/tracks.inc.php';
require_once 'include/config.inc.php';
require_once 'include/mail.inc.php';

$mysql = new Mysql;
$person = Persons::find($mysql, $user);
$new_proposal = false;

if ($PERIOD_SUBMISSION) {

  $fields = $_POST;
 
  // existing proposals can't be updated
  if ( $field['cod'] && !$papers['event']['allow_submission_update'] ) {
    $smarty->fatal('updateNotAllowed');
  }

  $error = null;

  if ($event['agreement'] &&  !$fields['accept']) {
    $error = 'youMustAcceptTheTerms';
  }

  $mandatoryMissing = false;
  foreach (array('titulo','tema','nivel_proposta','idioma','descricao','resumo','publicoalvo') as $f) {
    if (! $fields[$f]) {
      $error = 'mandatoryFieldsMissing';
    }
  }

  // TODO: check the types of uploaded files against
  // $papers['event']['file_upload_accepted_extensions']

  $cod = $fields['cod'];

  if ($error) {
    $smarty->assign('message', $error);
    $smarty->assign('proposal', $fields);
    $smarty->assign('content', 'submit.tpl');
    $smarty->assign('tracks', Tracks::findAllAssoc($mysql, $language));
    $smarty->assign('proposal_level', array('','Iniciante','Avancado'));
    if ($cod) {
      $speakers = Proposals::findSpeakers($mysql, $cod);
      $smarty->assign('speakers', $speakers);
      $smarty->assign('speakers_count', count($speakers));
    } else {
      $person['main'] = 1;
      $speakers = array ($person);
      // TODO: check for speakers data from $_POST and add them to $speakers
      $smarty->assign('speakers', $speakers);
      $smarty->assign('speakers_count', count($speakers));
      
      // check for already filled keyword data
      if ($fields['tema']) {
        $keywords = Tracks::getKeywords($mysql, $fields['tema'], $language);
        foreach ($keywords as $index => $k) {
          if ($fields[ 'keyword_' . $k['id'] ] ) {
            $keywords[$index]['chosen'] = true;
          }
        }
        $smarty->assign('keywords', $keywords);
      }
    }
    $smarty->display('index.tpl');
    return;
  }

  // maximum number of authors per submission
  $max_authors = $papers['event']['max_authors'];
  if (! $max_authors) {
    $max_authors = 15; // SMELL: bad assumption
  }

  $proposal = null;

  if ($cod) {
    // existing proposal

    // check ownership
    $proposal = Proposals::find($mysql,$cod);
    if (!Proposals::owns($person,$proposal, $mysql)) {
      $smarty->fatal('onlyProposalOwnerCanUpdate');
    }
    
    unset($fields['cod']);
    Proposals::real_update($mysql, $cod, $fields);

    // removing authors:
    for($i = 1; $i <= $max_authors; $i++) {
      if ($_POST["speaker${i}_remove"]) {
        $person_cod = $_POST["speaker${i}_cod"];
        Proposals::removeSpeaker($mysql, $cod, $person_cod);
      }
    }
    
  } else {

    $new_proposal = true;
 
    // new proposal
    $fields['pessoa'] =  $person['cod'];

    $fields['ip']       = $_SERVER['REMOTE_ADDR'];
    $fields['ip_proxy'] = $_SERVER['HTTP_X_FORWARDED_FOR'];
    $fields['browser']  = $_SERVER["HTTP_USER_AGENT"];
    $fields['dthora']   = time();
    
    Proposals::create($mysql, $fields);

    $cod = $mysql->last_insert_id();
    
  }

  // add all the authors to the database (if needed) and as coauthors of the
  // proposal
  for($i = 1; $i <= $max_authors; $i++) {
    $nome = $_POST['speaker' . $i . '_nome'];
    $email = $_POST['speaker' . $i . '_email'];
    $cpf = $_POST['speaker' . $i . '_cpf'];
    if ( $email ) {
      $speaker = array (
        'nome' => $nome,
        'email' => $email,
        'cpf' => $cpf,
      );

      $stored = Persons::find($mysql, $speaker['email']);
      if (! $stored) {
        Persons::create($mysql, $speaker);
        $person_cod = $mysql->last_insert_id();
      } else {
        $person_cod = $stored['cod'];
      }
      Proposals::addSpeaker($mysql, $cod, $person_cod);
    }
  }

  // handle keywords:
  foreach ($_POST as $key => $value) {
    if (preg_match ('/^had_keyword_([0-9]+)$/', $key, $matches)) {
      $keyword = $matches[1];
      // if keyword was previously checked and isn't anymore,
      // we have to remove it.
      if (! $_POST['keyword_' . $keyword]) {
        Proposals::removeKeyword($mysql, $cod, $keyword);
      }
    }
    if (preg_match ('/^keyword_([0-9]+)$/', $key, $matches)) {
      $keyword = $matches[1];
      // if keyword is checked now and wasn't before, we have to add it
      if (! $_POST['had_keyword_' . $keyword]) {
        Proposals::addKeyword($mysql, $cod, $keyword);
      }
    }
  }

  // handle uploaded file:
  if ($papers['event']['file_upload_on_submission']) {
    
    if ($_FILES['proposal_file']['name']) {
      $filename = basename($_FILES['proposal_file']['name']);
      preg_match('/\.([^\.]*)$/', $filename, $matches);
      $extension = $matches[1];

      // check if the proponent can still upload files
      $files = Proposals::getFiles($cod);
      $max = $papers['event']['maximum_uploaded_files'];
      if ($max && count($files) >= $max) {
        // maximum number of files reached. Check if we are replacing a file.
        if (! preg_grep("/\.$extension$/", $files)) {
          // not replacing
          $smarty->fatal('maximumNumberOfUploadedFiles');
        }
      }
      
      $destination =
        papers_expand_path($papers['event']['file_upload_directory']) .
        "/$cod.$extension"; 
      copy($_FILES['proposal_file']['tmp_name'], $destination);
    }
  }

  // confirm the submission by e-mail
  if ($papers['event']['submission_confirmation_by_email']) {
    // only notify on proposal creation
    if ($new_proposal) {

      $proposal = Proposals::find($mysql, $cod);
      if (! $proposal) {
        echo "bizarre error: proposal not found (cod = $cod)!";
        exit;
      }
      
      // TODO: calculate $from and form headers
      $headers = 'From: ' . $papers['event']['contact_email'] . "\r\n";
      $headers .= 'Content-Type: text/plain; charset=iso-8859-1' . "\r\n";

      // those who will receive the e-mail
      $speakers = Proposals::findSpeakers($mysql, $cod);

      // send e-mail for each one of them
      foreach ($speakers as $s) {
        $msgfmt = new MySmarty;
        
        $msgfmt->assign('person', $s);
        $msgfmt->assign('proposal', $proposal);

        $msgfmt->config_load("$language.conf");
        $subject = $msgfmt->get_config_vars('submissionConfirmation') . " ($cod)";
        $subject = encodeMimeSubject($subject);
        
        $message = $msgfmt->fetch("submission_confirmation.$language.tpl");

        // send the damn email
        mail($s['email'], $subject, $message, $headers);
      }
      
    }
  }

} else {
  $smarty->fatal('notInSubmissionPeriod');
  return;
}

if ($papers['event']['submission_confirmation_on_web_interface']) {

  // show a popup telling the user that his/her submission was succesfull.
  $smarty->assign('content', 'submission_confirmation_on_web_interface.tpl');
  $smarty->display('index.tpl');

} else {
  header('Location: .');
  //echo 'bli'; exit;
}

?>
