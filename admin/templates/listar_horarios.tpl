<ul>
  {section loop=$rs name=i}
    <li>
      <a href="horarios/{$rs[i].numero}">{$rs[i].numero}: {$rs[i].inicio} - {$rs[i].final}</a>
    </li>
  {/section}
</ul>
<a href="horarios/0" accesskey="I">Incluir hor�rio (alt+i)</a>
