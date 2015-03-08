<table class='formulario'>
  <tr>
    <th>Título</th>
    <th>Ações</th>
  </tr>
  {section loop=$macrotemas name=m}
  <tr>
    <td>
      <a href="macrotema/{$macrotemas[m].cod}">{$macrotemas[m].titulo}</a>
    </td>
    <td>
      <a href="macrotema/{$macrotemas[m].cod}">Editar</a>
      &nbsp;&nbsp;
      <a href="macrotemaDelete/{$macrotemas[m].cod}" onclick="javascript: return confirm('Tem certeza que deseja excluir esse item?')">Excluir</a>
      &nbsp;&nbsp;
      <a href="macrotemaUp/{$macrotemas[m].cod}">Mover para cima</a>
      &nbsp;&nbsp;
      <a href="macrotemaDown/{$macrotemas[m].cod}">Mover para baixo</a>
    </td>
  </tr>
  {/section}
</table>

<p>
<a href="macrotema">Novo macrotema</a>
</p>
