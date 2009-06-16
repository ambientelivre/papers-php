<center>
<h2>{$proposta.titulo}</h2>
</center>

<table align="center" class="programacao">
  <tr>
    <th>Autor(es)</th>
    <td>
      {$pessoa.nome} 
      {section loop=$copalestrantes name=cp}
        <br/> {$copalestrantes[cp].nome} 
      {/section}
    </td>
  </tr>
  <tr>
    <th>Coordena��o de mesa</th>
    <td>
      {section loop=$mesa name=m}
        {$mesa[m].nome} <code>&lt;{$mesa[m].email|replace:"@":" em "}&gt;</code>
        <br/>
      {/section}
    </td>
  </tr>
  <tr>
    <th>Macrotema</th>
    <td>{$macrotema.titulo}</td>
  </tr>
  <tr>
    <th>Hor�rio</th>
    <td>
      {section loop=$celulas name=c}
        {$celulas[c].dia},
        {$celulas[c].inicio}/{$celulas[c].final},
        {$celulas[c].sala}
        <br/>
      {/section}
    </td>
  </tr>
  <tr>
    <th colspan="2">
    Descri��o
    </th>
  </tr>
  <tr>
    <td colspan="2">
      <p>
      {$proposta.resumo|replace:"\r":""|replace:"\n\n":"</p><p>"}
      {if ! $proposta.resumo}
        {$proposta.descricao|replace:"\r":""|replace:"\n\n":"</p><p>"}
      {/if}
      </p>
    </td>
  </tr>
  <tr>
    <th colspan="2">
    Curr�culos
    </th>
  </tr>
  <tr>
    <td colspan="2">
      <strong>{$pessoa.nome}</strong> <br/>
      <p>
      {$pessoa.biografia|replace:"\r":""|replace:"\n\n":"</p><p>"}
      </p>
      {section loop=$copalestrantes name=cp}
        <strong>{$copalestrantes[cp].nome}</strong> <br/>
          {if $copalestrantes[cp].biografia}
            <p>
            {$copalestrantes[cp].biografia|replace:"\r":""|replace:"\n\n":"</p><p>"}
            </p>
          {else}
            <p>
              <em> Curr�culo n�o fornecido.</em>
              <br/>
              <small>
              (se voc� � {$copalestrantes[cp].nome}, utilize o
              <a href="../speaker">canto dos palestrantes</a> para informar o
              seu curr�culo.
              </small>
              </em>
            </p>
          {/if}
      {/section}
    </td>
  </tr>
</table>
