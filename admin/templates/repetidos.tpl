<h2>Palestrantes com mais de uma palestra aprovada</h2>

<p>S�o consideradas todas as palestras aprovadas, inclusive aquelas onde o palestrante � <strong>copalestrante</strong>.</p>

<table  align="center" class="formulario">
    <tr>
      <th>Palestrante</th>
      <th>Quantidade</th>
    </tr>
  {section loop=$repetidos name=r}
    <tr>
      <td>{$repetidos[r].nome}</td>
      <td>{$repetidos[r].quant}</td>
    </tr>
  {/section}
</table>
