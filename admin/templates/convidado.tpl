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
    <th>T�tulo da palestra</th>
    <td><input type="text" name="titulo"/></td>
  </tr>
  <tr>
    <th>Tipo da palestra</th>
    <td>
      <select name='tipo'>
        <option value='c'>Convidado</option>
        <option value='p'>Patrocinador</option>
        <option value='v'>Venda (palestra comercial)</option>
      </select>
    </td>
  </tr>
  <tr>
    <th>Macro-tema</th>
      <td>
        <select name="tema">
          <option></option>
          {section loop=$macrotemas name=m}
            <option value='{$macrotemas[m].cod}'>{$macrotemas[m].titulo}</option>
          {/section}
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
