<form action="diaSave" method="POST">

<table class='formulario' align='center'>
  <tr>
    <th>N�mero</th>
    <td>{if $dia.numero}<input type="hidden" name="numero" value="{$dia.numero}"/>{$dia.numero}{else}<input type="text" name="numero" size="4"/>{/if}</td>
  </tr>
  <tr>
    <th>Descri��o</th>
    <td><input type="text" name="descricao" value="{$dia.descricao}"/> </td>
  </tr>
  <tr>
    <th colspan='2'><input type="submit" value="Salvar"/></th>
  </tr>
</table>
</form>
