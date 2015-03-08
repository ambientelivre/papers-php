{literal}
<script type='text/javascript'>

function toggle(id) {
  var theid = 'macrotema_' + id;
  container = document.getElementById(theid);
  children = container.getElementsByTagName('input');

  for (var i = 0; i < children.length; i++) {
    item = children[i];
    item.checked = !item.checked;
  }
}

</script>
{/literal}

<h2>Diferencia��o T�cnicas/N�o-t�cnicas</h2>

{foreach from=$macrotemas item=m}
<h3>{$m.titulo}</h3>
  <form action='tecnicas' method='POST'>
    <table class='formulario' id='macrotema_{$m.cod}'>
      <tr>
        <th>T�tulo</th>
        <th>
          T�cnica?
          <a href='javascript: toggle({$m.cod})'>Marcar/Desmarcar todas</a>
        </th>
      </tr>
      {foreach from=$propostas[$m.cod] item=p}
        <tr>
          <td><a href='proposta/{$p.cod}'>{$p.titulo}</a></td>
          <td>
            <input type='hidden' name='tecnica_era_{$p.cod}' value='{$p.tecnica}'/>
            <input type='checkbox' name='tecnica_{$p.cod}' {if $p.tecnica}checked{/if}/>
          </td>
        </tr>
      {/foreach}
      <tr>
        <th colspan='2'>
          <center>
          <input type='submit' name='submit' value='Salvar' />
          </center>
        </th>
      </tr>
    </table>
  </form>
{/foreach}
