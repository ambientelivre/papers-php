<?

require 'include/mysmarty.inc.php';
$smarty = new Smarty;
$smarty->compile_check = true;

include('include/mysql.inc.php');
include('include/basic.inc.php');
include('include/macrotemas.inc.php');

expires(0);

$smarty->assign('title', 'Macrotemas');

$smarty->assign('linkup', '.');

$mysql = new Mysql;

$macrotemas = Macrotemas::carregar($mysql);
$smarty->assign('macrotemas', $macrotemas);

$smarty->assign('central', 'macrotemas.tpl');

$smarty->display('index.tpl');
  
?>

