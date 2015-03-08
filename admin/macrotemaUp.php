<?

include('include/mysql.inc.php');
include('include/basic.inc.php');
include('include/macrotemas.inc.php');

expires(0);
header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');

$mysql = new Mysql;

$cod = str_replace('/', '', $_SERVER['PATH_INFO']);

if (basename($_SERVER['SCRIPT_FILENAME']) == 'macrotemaUp.php') {
  Macrotemas::up($mysql, $cod);
} else {
  Macrotemas::down($mysql, $cod);
}

header('Location: ../macrotemas');

?>

