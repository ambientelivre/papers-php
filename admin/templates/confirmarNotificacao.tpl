<h1>Notifica��o em massa</h1>

<p>
Selecione o grupo de proposstas a serem notificadas.
</p>
<ul>
  <li>
    <strong>Aceitas:</strong>
    Os autores de propostas aceitas.
  </li>
  <li>
    <strong>Recusadas:</strong>
    Os autores de propostas recusadas. Para
    <em>avis�-los para esperar mais um pouco ;-)</em>
    ou 
    <em>para avis�-los que j� era</em>
    .
  </li>
  <li>
    <strong>Aceitas e N�o confirmadas:</strong>
    Para <em>Notifica��o de prorroga��o de prazo para confirma��o</em> ou para
    <em>informar que est�o sendo consideradas com desist�ncia</em>.
  </li>
</ul>

<p>
<strong>
Certifique-se de que o processo de avalia��o tenha terminado, ou voc� ter�
problemas s�rios! :-)
</strong>
</p>

<center>
<form action="" method="POST">
  <table>
    <tr>
      <td>
        <input type='radio' name='tipo' value='aceitas' checked/> Aceitas <br/>
      </td>
    </tr>
    <tr>
      <td>
        <input type='radio' name='tipo' value='recusadas'/> Recusadas <br/>
      </td>
    </tr>
    <tr>
      <td>
        <input type='radio' name='tipo' value='nao_confirmadas'/> Aceitas e N�o confirmadas <br/>
      </td>
    </tr>
    <tr>
      <tr>
        <td>
          <strong>Mensagem a ser enviada.</strong> As seguinte vari�veis ser�o substitu�das no texto:
          <ul>
             <li><code>$nome</code>: nome do proponente</li>
             <li><code>$titulo</code>: t�tulo da proposta</li>
             <li><code>$cod</code>: c�digo da proposta</li>
          </ul>
          <textarea name="texto" rows='20' cols='80'></textarea>
        </td>
      </tr>
    </tr>
    <tr>
      <td align='center'>
        <input type="hidden" name="confirm" value="1"/>
        <input type="submit" value="Enviar!"/>
      </td>
    </tr>
  </table>
</form>
</center>

