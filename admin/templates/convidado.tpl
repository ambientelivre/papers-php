<form action="convidadoSave" method="POST">
<table class='formulario' align='center'>
  <tr>
    <th>Nome:</th>
    <td><input type="text" name="nome"/></td>
  </tr>
  <tr>
    <th>e-mail:</th>
    <td><input type="text" name="email"/></td>
  </tr>
  <tr>
    <th>mini-curr�culo:</th>
    <td><textarea name="biografia" cols='60' rows='10'></textarea></td>
  </tr>
  <tr>
    <th>T�tulo</th>
    <td><input type="text" name="titulo"/></td>
  </tr>
  <tr>
    <th>Macro-tema</th>
      <td>
        <select name="tema">
          <option></option>
          <option value="1">Desenvolvimento</option>
          <option value="2">Bancos de Dados</option>
          <option value="3">Desktop</option>
          <option value="4">Redes</option>
          <option value="5">Seguran�a</option>
          <option value="6">Cases</option>
          <option value="7">Comunidade</option>
          <option value="8">Software Livre em Governos</option>
          <option value="9">Pol�tica/Filosofia</option>
          <option value="10">Inclus�o Social/Digital</option>
        </select>
      </td>
  </tr>
  <tr>
    <th>Resumo (para programa��o, +/- 50 palavras)</th>
    <td><textarea name="resumo" cols='60' rows='10'></textarea></td>
  </tr>
  <tr>
    <th>Idioma:</th>
    <td>
      <select name="idioma">
        <option value="pt">Portugu�s</option>
        <option value="en">Ingl�s</option>
        <option value="es">Espanh�l</option>
      </select>
    </td>
  </tr>
  <tr>
    <td colspan='2'>
      <input type="submit"/>
    </td>
  </tr>
</table>
</form>
