<?

class Tracks {

  function calculateFields($language) {
    if ($language == 'pt' || $language == 'pt-br') {
      return 'cod, titulo, descr';
    } else {
      return 'cod, titulo_en as titulo, descr_en as descr';
    }
  }

  function find($db, $cod, $language) {
    $fields = Tracks::calculateFields($language);
  
    $sql = "
      select $fields
      from macrotemas
      where cod = $cod
    ";
    $rs = $db->conn->Execute($sql);
    $rsa = $rs->GetArray();
    return $rsa[0];
  }

  function findAll($db, $language) {
    $fields = Tracks::calculateFields($language);
  
    $rs = $db->conn->Execute("select $fields from macrotemas");
    return $rs->GetArray();
  }

  function findAllAssoc($db, $language) {
    $all = Tracks::findAll($db,$language);
    $assoc = array();
    foreach ($all as $track) {
      $parts = preg_split('/\s*\|\s*/', $track[titulo]);
      if (count($parts) > 1) {
        if (!$assoc[$parts[0]]) {
          $assoc[$parts[0]]= array();
        }
        $assoc[$parts[0]][$track['cod']] = $parts[1];
      } else {
        $assoc[$track['cod']] = $track['titulo'];
      }
    }
    return $assoc;
  }
  
  function getKeywords($db, $cod, $language) {
    $descr = ($language == 'pt' || $language == 'pt-br') ?
             'descr'
             :
             'descr_en as descr';

    $rs = $db->conn->execute(
      "select id, $descr, 0 as chosen from keywords where macrotema_id = $cod");
    return $rs->GetArray();
  }

}

?>
