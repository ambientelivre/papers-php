{if $insert}
<center>
<h2>Inserir palestra na grade:</h2>
<strong>{$proposta.titulo}</strong> <br/>
{$macrotema.titulo} <br/>
<b>N�vel:</b> {$proposta.nivel_proposta} <br/>
{$pessoa.nome} <em>({$proposta.nivel_envolvimento})</em> <br/>
{if $proposta.comentarios}
<span style='background: #ffff99;'>
  <strong>Coment�rio do autor:</strong>
  {$proposta.comentarios}
  <br/>
</span>
{/if}
{if $proposta.comadm}
<span style='background: #ff9999;'>
  <strong>Coment�rio administrativo:</strong>
  {$proposta.comadm}
  <br/>
</span>
{/if}
</center>
{/if}

<a name="toc"></a>
<ul>
{section loop=$dias name=d}
  <li><a href="{php}echo $_SERVER['REQUEST_URI']{/php}#dia{$dias[d].numero}">{$dias[d].descricao}</a></li>
{/section}
</ul>

{section loop=$dias name=d}
  <a name="dia{$dias[d].numero}"></a>
  <h2>{$dias[d].descricao} <span style='font-size: 10px;'>(<a href="#toc">voltar ao topo</a>)</span></h2>
    <table class='formulario grade' style='width: 100%;'>
      <tr>
        <th></th>
        {section loop=$salas name=s}
          <th>
            {$salas[s].descricao}
          </th>
        {/section}
      </tr>
      {section loop=$horarios name=h}
        <tr>
          <th>{$horarios[h].inicio}/{$horarios[h].final}</th>
          {section loop=$salas name=s}
            {assign var="dia" value=$dias[d].numero}
            {assign var="sala" value=$salas[s].numero}
            {assign var="horario" value=$horarios[h].numero}
            {assign var="celula" value=$grade[$dia][$sala][$horario]}
            <td bgcolor="{$celula.cor}"> 
              {if $celula}
                {if $admin && ! $celula.confirmada}
                  <div style='background: yellow; color: red; text-align: center;'>
                    <strong>
                      Aten��o! Esta palestra ainda n�o foi confirmada pelo palestrante.
                    </strong>
                  </div>
                {/if}
              <center>
                {if ! $urlEspacoVazio}
                <a href="{$urlBase}/{$celula.cod}">
                {/if}
                <strong>
                  {$celula.macrotema}
                </strong>
                <br/>
                <em>{$celula.titulo}</em>
                <br/>
                <b>N�vel:</b> <em>{$celula.nivel_proposta}</em>
                <br/><br/>
                {$celula.nome}<em>({$celula.nivel_envolvimento})</em>
                {section loop=$celula.copalestrantes name=cp}
                  <br/> {$celula.copalestrantes[cp].nome}
                {/section}
                {if count($celula.mesa)}
                  <br/>
                  <br/>
                  Coordena��o de mesa:
                  <ul style='padding-left: 20px;'>
                  {section loop=$celula.mesa name=m}
                    <li>{$celula.mesa[m].nome}</li>
                  {/section}
                  </ul>
                {/if}
                {if ! $urlEspacoVazio}
                </a>
                {/if}
                {if $admin}
                <hr/>
                <div>
                  <a href="alocacaoSave?acao=remover&celula={$dia},{$sala},{$horario}">Limpar espa�o</a>
                </div>
                {/if}
              </center>
              {else}
                {if $insert}
                  <a href="alocacaoSave?acao=incluir&celula={$dia},{$sala},{$horario}&proposta={$proposta.cod}">(Inserir aqui!)</a>
                {/if}
              {/if}
            </td>
          {/section}
        </tr>
      {/section}
    </table>
{/section}
