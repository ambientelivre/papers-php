<table class='formulario'>
  <tr>
    <th>Nome</th>
    <th>Ve�culo</th>
    <th>Cargo</th>
    <th>Registro Profissional</th>
    <th>Endere�o Profissional</th>
    <th>Pa�s</th>
    <th>Estado</th>
    <th>Cidade</th>
    <th>e-mail</th>
    <th>A��es</th>
  </tr>
  {section loop=$press name=p}
    <tr>
      <td>{$press[p].nome}</td>
      <td>{$press[p].veiculo}</td>
      <td>{$press[p].cargo}</td>
      <td>{$press[p].registro_profissional}</td>
      <td>{$press[p].endereco_profissional}</td>
      <td>{$press[p].pais}</td>
      <td>{$press[p].estado}</td>
      <td>{$press[p].cidade}</td>
      <td>{$press[p].email}</td>
      <td>(<a href="press?acao=aprovar&cod={$press[p].cod}">aprovar</a>) (<a href="press?acao=remover&cod={$press[p].cod}">remover</a>)</td>
    </tr>
  {/section}
</table>
