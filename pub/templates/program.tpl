<h1>{$event.name} - Programa��o</h1>

<p>
Salas, dias e hor�rios est�o sujeitos a altera��es, de acordo com os crit�rios
da organiza��o do <em>{$event.name}</em>.
</p>

<p>
<strong>Veja tamb�m:</strong> uma vers�o sem decora��es,
<a href="programacao?print=1">para impress�o</a>.
</p>

<div id="legend">
{include file="legend.tpl"}
</div>

<div id="program">
{include file='grade.tpl'}
</div>

<div style='text-align: center; margin: 1em;'>
D�vidas? Escreva para <code>{mailto address=$event.contact_email encode="javascript"}</code>
</div>
