<h2>Submiss�es de propostas</h2>

<p>
As submiss�es est�o abertas at� o dia <u>{$submissionLastDay|date_format}</u>.
Voc� pode <a href='submit'>submeter uma proposta de palestra</a>.
</p>

{if count($proposals)}
{include file="proposals.tpl"}
{/if}
