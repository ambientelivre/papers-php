<?php

include('include/mysql.inc.php');
include('include/basic.inc.php');
include('include/pessoas.inc.php');
include('include/propostas.inc.php');

require 'include/mysmarty.inc.php';
$smarty = new Smarty;
$smarty->compile_check = true;
# $smarty->debugging = true;

$smarty->config_load('papers.conf');

expires(0);
header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');

$mysql = new Mysql;

$cod = $_POST['cod_pessoa'];
if (!$cod) {
  $cod = Pessoas::incluirConvidado($mysql, $_POST['nome'], $_POST['email'], $_POST['biografia']);
}

$r['titulo'] = $_POST['titulo'];
$r['resumo'] = $_POST['resumo'];
$r['tema'] = $_POST['tema'];
$r['pessoa'] = $cod;
$r['publicoalvo'] = '';
$r['descricao'] = '';
$r['idioma'] = $_POST['idioma'];
$r['status'] = 'p';
$r['tipo'] = $_POST['tipo'];
$r['confirmada'] = null;
$r['nivel_envolvimento'] = $_POST['nivel_envolvimento'];
$r['nivel_proposta'] = $_POST['nivel_proposta'];

$codp = Propostas::incluirPalestraConvidada($mysql,$r);

header("Location: alocacao/$codp");


?>
