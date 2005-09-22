<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-us" lang="en-us">
<head>
  <title>fisl6.0 - F�rum Internacional Software Livre</title><meta name="resource-type" content="document"/>
  <meta http-equiv="pragma" content="no-cache"/>
  <meta name="revisit-after" content="1"/>
  <meta name="classification" content="Internet"/>
  <meta name="description" content="6� F�rum Internacional Software Livre"/>
  <meta name="keywords" content="fisl software livre porto alegre brasil"/>
  <meta name="robots" content="ALL"/>
  <meta name="distribution" content="Global"/>
  <meta name="rating" content="General"/>
  <meta name="author" content="Projeto Software Livre Brasil"/>
  <meta name="language" content="pt-br"/>
  <meta name="doc-class" content="Completed"/>
  <meta name="doc-rights" content="Public"/>
  {php}
     $protocol = ($_SERVER['SERVER_PORT']==443)?('https://'):('http://');

     echo "<base href='" . $protocol
          . $_SERVER['HTTP_HOST']
          . preg_replace("/[^\/]+$/", "", $_SERVER['SCRIPT_NAME'])
          . "'/>\n";
  {/php}
    <link rel="stylesheet" type="text/css" href="print.css"/>
</head>
<body>

<h1>
6� F�rum Internacional  Software Livre <br/>
1, 2, 3 e 4 de Junho de 2005 <br/>
Porto Alegre/RS, Brasil <br/>
</h1>

<h1>Programa��o - <code>fisl6.0</code></h1>

<p>
Salas, dias e hor�rios est�o sujeitos a altera��es, de acordo com os crit�rios
da organiza��o do <code>fisl6.0</code>.
</p>

{section loop=$dias name=d}
  <a name="dia{$dias[d].numero}"></a>
  <h2>{$dias[d].descricao}</h2>
  {section loop=$horarios name=h}
    <h3>{$horarios[h].inicio}/{$horarios[h].final}</h3>
      {section loop=$salas name=s}
        {assign var="dia" value=$dias[d].numero}
        {assign var="sala" value=$salas[s].numero}
        {assign var="horario" value=$horarios[h].numero}
        {assign var="celula" value=$grade[$dia][$sala][$horario]}
        {if $celula}
          <strong><em>{$celula.titulo}</em></strong>
          <br/> {$celula.nome}
          {section loop=$celula.copalestrantes name=cp}
            <br/> {$celula.copalestrantes[cp].nome}
          {/section}
          {section loop=$celula.mesa name=m}
            <br/> {$celula.mesa[m].nome} (<em>Coordena��o de mesa</em>)
          {/section}
          <br/> <strong>Sala:</strong> {$salas[s].descricao}
          <br/> <strong>Macrotema:</strong>  {$celula.macrotema}
          <br/>
          <br/>
        {/if}
      {/section}
  {/section}
{/section}
</body>
</html>
