<h1><a name="inicio">Relat�rio de Conflito de hor�rios</a></h1>

<table align='center' class='formulario'>
  <tr>
    <th>Pessoa</th>
    <th>Dia</th>
    <th>Hor�rio</th>
    <th>N�mero de espa�os</th>
  </tr>
{section loop=$conflitos name=c}
  <tr>
    <td>{$conflitos[c].nome}</td>
    <td>{$conflitos[c].dia}</td>
    <td>{$conflitos[c].horario}</td>
    <td>{$conflitos[c].count}</td>
  </tr>
{/section}
</table>
