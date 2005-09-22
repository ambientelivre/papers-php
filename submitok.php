<?

header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
header('Pragma: no-cache');

include('adodb.inc.php');

$lang = (preg_match('/pt/', $_SERVER["HTTP_ACCEPT_LANGUAGE"]))?('pt'):('en');

$conn = &ADONewConnection("mysql");
$conn->debug = 0;
include("conf.inc");
$conn->PConnect("localhost", $myUsername, $myPassword, $myDatabase);

$user = $_GET['user'];

$sql = "SELECT nome, email FROM pessoas
        WHERE cod = $user";
$rs = $conn->Execute($sql);

$nome  = $rs->fields['nome'];
$email = $rs->fields['email'];

?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title></title>
</head>

<body>

<?if ($lang == 'pt'):?>

<h1>F�rum Internacional Software Livre</h1>

<h2>Chamada de trabalhos</h2>

<?else:?>

<h1>International Free Software Forum</h1>

<h2>Call for papers</h2>

<?endif?>

<hr>

<?if ($lang == 'pt'):?>

<p>Caro(a) <?=$nome?>,

<p>Enviamos agora um e-mail para <?=$email?>, com os dados de sua inscri��o.

<p>Se voc� deseja inscrever outro trabalho, retorne � <a
href="./">p�gina inicial</a> e preencha o
formul�rio novamente. Lembre-se de que voc� n�o precisa preencher seus dados
pessoais outra vez. Apenas informe o e-mail e senha para valida��o.

<p>Agradecemos o interesse em participar do 6o F�rum Internacional Software
Livre.

<?else:?>

<p>Dear <?=$nome?>,

<p>We just sent an e-mail to <?=$email?>, with your subscription data.

<p>If you want to submit another work, just go back to the <a
href="./">home page</a> and fill out the form
again. Remember that you don't need to fill out your personal data any more.
Just inform your e-mail and password for validation.

<p>Thank you for the interest in attending to the 6th International Free
Software Forum.

<?endif?>

<hr>

</body>
</html>
