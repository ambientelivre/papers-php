<h2>Relat�rio: palestras aprovadas e n�o confirmadas</h2>

<table align='center' class='formulario'>
  <tr>
    <th>Pessoa</th>
    <th>Palestra</th>
  </tr>
{section loop=$propostas name=p}
  <tr>
    <td>{$propostas[p].nome}</td>
    <td>{$propostas[p].titulo}</td>
  </tr>
{/section}
</table>
