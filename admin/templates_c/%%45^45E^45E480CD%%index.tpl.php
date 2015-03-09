<?php /* Smarty version 2.6.26, created on 2015-03-08 21:12:41
         compiled from index.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'config_load', 'index.tpl', 1, false),)), $this); ?>
<?php echo smarty_function_config_load(array('file' => "papers.conf"), $this);?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <?php if ($this->_tpl_vars['title']): ?>
    <title><?php echo $this->_tpl_vars['title']; ?>
 - papers</title>
  <?php else: ?>
    <title>papers</title>
  <?php endif; ?>
  <?php 
     $protocol = ($_SERVER['SERVER_PORT']==443)?('https://'):('http://');

     echo "<base href='" . $protocol
          . $_SERVER['HTTP_HOST']
          . preg_replace("/[^\/]+$/", "", $_SERVER['SCRIPT_NAME'])
          . "'/>\n";
   ?>
  <link rel="stylesheet" href="css/styles.css" type="text/css">
  <link rel="top" href=".">
  <?php if ($this->_tpl_vars['linkup']): ?><link rel="up" href="<?php echo $this->_tpl_vars['linkup']; ?>
"><?php endif; ?>
  <?php if ($this->_tpl_vars['linknext']): ?><link rel="next" href="<?php echo $this->_tpl_vars['linknext']; ?>
"><?php endif; ?>
  <?php if ($this->_tpl_vars['linkprevious']): ?><link rel="previous" href="<?php echo $this->_tpl_vars['linkprevious']; ?>
"><?php endif; ?>
  <!-- $Id$ -->
</head>

<body>

<h1>papers - admin</h1>

<?php if ($this->_tpl_vars['title']): ?>
<h2><?php echo $this->_tpl_vars['title']; ?>
</h2>
<?php else: ?>
<h2>Sistema de administração</h2>
<?php endif; ?>
<?php if ($this->_tpl_vars['linkup']): ?><hr/><a href="<?php echo $this->_tpl_vars['linkup']; ?>
" accesskey="U">Um nível acima (alt+u)</a><?php endif; ?>
<?php if ($this->_tpl_vars['linknext']): ?><a href="<?php echo $this->_tpl_vars['linknext']; ?>
" accesskey="N">Próximo (alt+n)</a><?php endif; ?>
<?php if ($this->_tpl_vars['linkprevious']): ?><a href="<?php echo $this->_tpl_vars['linkprevious']; ?>
" accesskey="P">Anterior (alt+p)</a><?php endif; ?>
<hr>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['central']), 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<hr>

<div align="right" class="cl">
Copyright &copy; 2003, 2004 <a href="http://www.propus.com.br/">Propus</a>.
<br/>
Copyright &copy; 2005, 2006 <a href="http://associacao.softwarelivre.org/">Associação Software Livre.Org</a>.
<br/>
Copyright &copy; 2006, 2009, 2012 <a href="http://www.colivre.coop.br/">Colivre</a>.
<br/>
</div>

  <script type='text/javascript' src='js/jquery-1.7.1.min.js'></script>
  <script type='text/javascript' src='js/default.js'></script>
</body>
</html>