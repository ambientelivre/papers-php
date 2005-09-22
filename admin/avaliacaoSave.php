<?

  include('include/mysql.inc.php');
  include('include/basic.inc.php');

  expires(0);
  header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
  header('Content-Type: text/plain');
  
  $user = $_SERVER['PHP_AUTH_USER'];
  $proposta = $_POST['proposta'];
 
  // incluir o nome do avaliador entre os campos
  $campos = $_POST;
  $campos['avaliador'] = $user;

  $mysql = new Mysql;

  $sql = "select *
          from avaliacoes
          where proposta = $proposta
                and avaliador = '$user'";
  $rs = $mysql->conn->Execute($sql);
  $count = $rs->RecordCount();

  if ($count > 0) {
    // avalia��o j� existe. Atualizar.
    $sql = $mysql->conn->GetUpdateSQL($rs, $campos);
  } else {
    // avalia��o ainda n�o existe. Incluir.
    $sql = $mysql->conn->GetInsertSQL($rs, $campos);
  }

  // fazer a atualiza��o
  $mysql->conn->Execute($sql);
  
  // voltar para a lista de propostas para avaliar:
  header("Location: avaliacao");

?>
