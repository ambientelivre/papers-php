<ul>
  {section loop=$mesa name=m}
    <li>
      <a href="proponente/{$mesa[m].cod}">{$mesa[m].nome}</a>
      (<a href="mesa/{$proposta.cod},{$mesa[m].cod}?acao=remover">remover</a>)
    </li>
  {/section}
</ul>

<div>
<a href="mesa/{$proposta.cod}?acao=adicionar">Adicionar coordenador de mesa <strong>n�o cadastrado</strong> ainda</a>
|
<a href="mesa/{$proposta.cod}?acao=escolher">Adicionar coordenador de mesa <strong>j� cadastrado</strong></a>

</div>
