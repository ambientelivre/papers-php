<?

class Proposals {

  function load($db, $cod) {
    $sql = "
      select propostas.*
      from propostas
      join pessoas on pessoas.cod = propostas.pessoa
      where pessoas.cod = $cod
    ";
    $rs = $db->conn->Execute($sql);
    return $rs->GetArray();
  }
  
  function loadAccepted($db, $cod) {
    $sql = "
      select propostas.*
      from propostas
      join pessoas on pessoas.cod = propostas.pessoa
      where pessoas.cod = $cod
            and propostas.status in ('a','p','c')
    ";
    $rs = $db->conn->Execute($sql);
    return $rs->GetArray();
  }

  function find($db, $cod) {
    $sql = "
      select *
      from propostas
      where cod = $cod
    ";
    $rs = $db->conn->Execute($sql);
    $rsa =  $rs->GetArray();
    return $rsa[0];
  }

  function owns($person, $proposal) {
    return ($person['cod'] == $proposal['pessoa']);
  }

  function reviews($db, $cod) {
    $sql = "
      select *
      from avaliacoes
      where proposta = $cod
    ";
    $rs = $db->conn->Execute($sql);
    return $rs->GetArray();
  }

  function update($db, $cod, $fields) {
    $rs = $db->conn->Execute("select confirmada, autoriza_video, titulo, resumo from propostas where cod = $cod");
    $sql = $db->conn->GetUpdateSQL($rs, $fields, false, true);
    $db->conn->Execute($sql);
  }

  function create($db, $fields) {
    $rs = $db->conn->Execute("select cod,titulo,tema,idioma,publicoalvo,descricao,resumo,comentarios,ip,ip_proxy,browser,dthora,pessoa from propostas where cod = -1");
    $sql = $db->conn->GetInsertSQL($rs, $fields, false, true);
    $db->conn->Execute($sql);
  }

  function real_update($db, $cod, $fields) {
    $rs = $db->conn->Execute("select cod,titulo,tema,idioma,publicoalvo,descricao,resumo,comentarios from propostas where cod = $cod");
    $sql = $db->conn->GetUpdateSQL($rs, $fields, false, true);
    $db->conn->Execute($sql);
  }

  function remove($db, $cod) {
    $db->conn->Execute("delete from propostas where cod = $cod");
  }

}

?>
