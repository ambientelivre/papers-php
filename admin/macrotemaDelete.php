<?

include('include/mysql.inc.php');
include('include/basic.inc.php');
include('include/macrotemas.inc.php');

expires(0);
header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');

$mysql = new Mysql;
$cod = str_replace('/', '', $_SERVER['PATH_INFO']);
Macrotemas::remover($mysql, $cod);
header('Location: ../macrotemas');

?>
