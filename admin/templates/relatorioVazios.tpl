<h1><a name="inicio">Relat�rio de hor�rios vazios</a></h1>

<table align='center' class='formulario'>
  <tr>
    <th>Dia</th>
    <th>Sala</th>
    <th>Hor�rio</th>
  </tr>
{section loop=$vazios name=v}
  <tr>
    <td>{$vazios[v].dia}</td>
    <td>{$vazios[v].sala}</td>
    <td>{$vazios[v].horario}</td>
  </tr>
{/section}
</table>
