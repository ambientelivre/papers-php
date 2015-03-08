<?php

require 'include/mysmarty.inc.php';
$smarty = new Smarty;
$smarty->compile_check = true;

include('include/mysql.inc.php');
include('include/basic.inc.php');
include('include/macrotemas.inc.php');

expires(0);
$smarty->assign('linkup', 'macrotemas');

$cod = str_replace('/', '', $_SERVER['PATH_INFO']);

$mysql = new Mysql;

if ($cod) {
  $macrotema = Macrotemas::encontrar($mysql, $cod);
  $smarty->assign('macrotema', $macrotema);
}

$smarty->assign('central', 'macrotema.tpl');
$smarty->display('index.tpl');
?>
