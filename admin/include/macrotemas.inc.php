<?php

class Macrotemas {
  function carregar($db) {
    $rs = $db->conn->Execute('select * from macrotemas order by cod');
    return $rs->GetArray();
  }

  function encontrar($db, $cod) {
    $rs = $db->conn->Execute("select * from macrotemas where cod = $cod");
    $rsa = $rs->GetArray();
    return $rsa[0];
  }

  function procurar($db, $query) {
    $rs = $db->conn->Execute("select * from macrotemas $query");
    $rsa = $rs->GetArray();
    return $rsa[0];
  }

  function adicionar($db, $fields) {
    $rs = $db->conn->Execute('select titulo,titulo_en,descr,descr_en,espacos from macrotemas where cod = -1');
 
    $sql = $db->conn->GetInsertSQL($rs,$fields);
    
    if ( $db->conn->Execute($sql)) {
      $cod = $db->last_insert_id();

      $position_rs = $db->conn->Execute('select max(position) + 1 as position from macrotemas');
      $position_rsa = $position_rs->GetArray();
      $position = $position_rsa[0]['position'];

      $db->conn->Execute("update macrotemas set position = $position where cod = $cod");

    } else {
      echo "Ocorreu um erro incluindo macrotema no banco.";
      exit;
    }
    header("Location: macrotemas");
  }

  function atualizar($db, $cod, $fields) {
    $rs = $db->conn->Execute("select titulo, titulo_en, descr, descr_en, espacos, position from macrotemas where cod = $cod");
    $sql = $db->conn->GetUpdateSQL($rs, $fields, false, true);
    $db->conn->Execute($sql);
  }

  function remover($db, $cod) {
    $db->conn->Execute("delete from macrotemas where cod = $cod");
  }

  function up($db, $cod) {
    $track = Macrotemas::encontrar($db, $cod);
    $position = $track['position'];
    $before = Macrotemas::procurar($db, "WHERE cod != $cod AND position <= $position ORDER by position DESC, cod DESC");
    if ($before) {
      Macrotemas::swap_positions($db, $track, $before);
    }
  }

  function down($db, $cod) {
    $track = Macrotemas::encontrar($db, $cod);
    $position = $track['position'];
    $after = Macrotemas::procurar($db, "WHERE cod != $cod AND position >= $position ORDER by position, cod");
    if ($after) {
      Macrotemas::swap_positions($db, $track, $after);
    }
  }

  function swap_positions($db, $one, $other) {
    Macrotemas::atualizar($db, $one['cod'], array(position => $other['position']));
    Macrotemas::atualizar($db, $other['cod'], array(position => $one['position']));
  }
}
?>
