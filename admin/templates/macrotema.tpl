<form action="macrotemaSave" method="POST">
  <input type='hidden' name='cod' value="{$macrotema.cod}"/>
<table class='formulario' align='center'>
  <tr>
    <th>T&iacute;tulo:</th>
    <td><input type="text" name="titulo" value="{$macrotema.titulo}"/></td>
  </tr>
  <tr>
    <th>T&iacute;tulo em ingl&ecirc;s:</th>
    <td><input type="text" name="titulo_en" value="{$macrotema.titulo_en}"/></td>
  </tr>
  <tr>
    <th>Descri&ccedil;&atilde;o:</th>
    <td><input type="text" name="descr" value="{$macrotema.descr}"/></td>
  </tr>
  <tr>
    <th>Descri&ccedil;&atilde;o em ingl&ecirc;s:</th>
    <td><input type="text" name="descr_en" value="{$macrotema.descr_en}"/></td>
  </tr>
  <tr>
    <th>Espa&ccedil;os:</th>
    <td><input type="text" name="espacos" value="{$macrotema.espacos}"/></td>
  </tr>
  <tr>
    <td colspan='2'>
      <input type="submit"/>
    </td>
  </tr>
</table>
</form>

