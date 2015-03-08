<?php

require_once 'include/config.inc.php';
require 'Smarty.class.php';

header('Content-Type: text/html; charset=iso-8859-1');

class MySmarty extends Smarty {

  function MySmarty() {
    global $papers;

    parent::Smarty();

    $this->compile_check = true;

    $this->assign('event', $papers['event']);
  }

  function fatal($msg = 'unamedFatalError') {
    $this->assign('message', $msg);
    $this->display('index.tpl');
    exit;
  }

}

?>
