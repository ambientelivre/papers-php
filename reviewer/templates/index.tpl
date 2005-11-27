{config_load file="$language.conf"}
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  {if $title}
    <title>{$title} - {$event.codename}</title>
  {else}
    <title>{#speaker#} - {$event.codename}</title>
  {/if}
  {php}
     $protocol = ($_SERVER['SERVER_PORT']==443)?('https://'):('http://');

     echo "<base href='" . $protocol
          . $_SERVER['HTTP_HOST']
          . preg_replace("/[^\/]+$/", "", $_SERVER['SCRIPT_NAME'])
          . "'/>\n";
  {/php}
  <link rel="stylesheet" href="css/styles.css" type="text/css">
  <link rel="top" href=".">
  {if $linkup}<link rel="up" href="{$linkup}">{/if}
  {if $linknext}<link rel="next" href="{$linknext}">{/if}
  {if $linkprevious}<link rel="previous" href="{$linkprevious}">{/if}
  <!-- $Id: /local/papers/speaker/templates/index.tpl 9363 2005-09-22T02:33:51.608056Z terceiro  $ -->
</head>

<body class='frivolo'>

<h1> <code>{$event.codename}</code>: {#reviewersPlace#}
</h1>

<div>
  {if $user}
  <strong>{$person.nome}</strong>
  |
  {/if}
  <a href='{change_language language=pt-br}'><img src='img/pt.png' alt='Portugu�s' border='0'/></a> |
  <a href='{change_language language=en}'><img src='img/en.png' alt='English' border='0'/></a> |
  <a href=".">{#start#}</a> |
  {if $user}
    <!-- <a href='proposals'>{#yourProposals#}</a> | -->
    <a href='personalInfo'>{#personalInfo#}</a> |
    <a href='logout'>Logout</a> |
  {/if}
</div>

{if $title}
<h2>{$title}</h2>
{/if}
{if $linkup}<hr/><a href="{$linkup}" accesskey="U">Um n�vel acima (alt+u)</a>{/if}
{if $linknext}<a href="{$linknext}" accesskey="N">Pr�ximo (alt+n)</a>{/if}
{if $linkprevious}<a href="{$linkprevious}" accesskey="P">Anterior (alt+p)</a>{/if}
<hr>

{if $message}
<div class='message'>
  {config_load file="messages.$language.conf" section="$message"}
  <span>{#messageTitle#}</span>
  {#messageText#}
</div>
{/if}

{if $content}
{include file="$content"}
{/if}

{include file="footer.$language.tpl"}

</body>
</html>
