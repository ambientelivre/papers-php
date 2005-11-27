<h2>Avalia��o de Proposta</h2>

<form action="reviewSave" method="POST">
<input type="hidden" name="proposta" value="{$proposta.cod}"/>
<table width="100%" class='formulario'>
  <tr>
    <th colspan="2">Proposta</th>
  </tr>
  <tr>
    <th>Autores</th>
    <td>
      <ul>
          <li><a href="speaker/{$proposta.cod_pessoa}">{$proposta.nome}</a></li>
        {section loop=$copalestrantes name=cp}
          <li><a href="speaker/{$copalestrantes[cp].cod}">{$copalestrantes[cp].nome}</a></li>
        {/section}
      </ul>
    </td>
  </tr>
  <tr>
    <th>T�tulo</th>
    <td><a href="proposal/{$proposta.cod}">{$proposta.titulo}</a></td>
  </tr>
  <tr>
    <th>Macro-tema</th>
    <td><a href="tracks">{$proposta.macrotema}</a></td>
  </tr>
  <tr>
    <th colspan="2">Avalia��o</th>
  </tr>
  <tr>
    <th>Grau de confian�a</th>
    <td>
      Indique o grau de confian�a da sua avalia��o com rela��o a essa proposta: <br/><br/>
      <input type="radio" name="confianca" value="1" {if $avaliacao.confianca == 1 || !$avaliacao.confianca}checked="on"{/if}/> 
      n�o conhe�o bem o assunto, sou generalista. <br/>
      <input type="radio" name="confianca" value="1.5" {if $avaliacao.confianca == 1.5}checked="on"{/if}/> 
      n�o sou expert, mas sinto-me confort�vel com o assunto. <br/>
      <input type="radio" name="confianca" value="2" {if $avaliacao.confianca == 2}checked="on"{/if}/> 
      sou expert, conhe�o bastante o assunto. <br/>
    </td>
  </tr>
  <tr>
    <th>Relev�ncia</th>
    <td>
      Indique a relev�ncia da proposta para o evento: <br/><br/>
      <input type="radio" name="relevancia" value="1" {if $avaliacao.relevancia == 1 || !$avaliacao.relevancia}checked="on"{/if}/> Nenhuma
      <input type="radio" name="relevancia" value="2" {if $avaliacao.relevancia == 2}checked="on"{/if}/> Pouca
      <input type="radio" name="relevancia" value="3" {if $avaliacao.relevancia == 3}checked="on"{/if}/> Alguma
      <input type="radio" name="relevancia" value="4" {if $avaliacao.relevancia == 4}checked="on"{/if}/> Muita
      <input type="radio" name="relevancia" value="5" {if $avaliacao.relevancia == 5}checked="on"{/if}/> Extrema
    </td>
  </tr>
  <tr>
    <th>Qualidade t�cnica</th>
    <td>
      Indique a qualidade t�cnica da proposta (a partir do resumo): <br/><br/>
      <input type="radio" name="qualidade" value="1" {if $avaliacao.qualidade == 1 || !$avaliacao.qualidade}checked="on"{/if}/> Nenhuma
      <input type="radio" name="qualidade" value="2" {if $avaliacao.qualidade == 2}checked="on"{/if}/> Pouca
      <input type="radio" name="qualidade" value="3" {if $avaliacao.qualidade == 3}checked="on"{/if}/> Alguma
      <input type="radio" name="qualidade" value="4" {if $avaliacao.qualidade == 4}checked="on"{/if}/> Muita
      <input type="radio" name="qualidade" value="5" {if $avaliacao.qualidade == 5}checked="on"{/if}/> Extrema
    </td>
  </tr>
  <tr>
    <th>Experi�ncia do autor</th>
    <td>
      Indique a experi�ncia demonstrada pelo autor no assunto  proposta (a partir do curr�culo do autor): <br/><br/>
      <input type="radio" name="experiencia" value="1" {if $avaliacao.experiencia == 1 || !$avaliacao.experiencia}checked="on"{/if}/> Nenhuma
      <input type="radio" name="experiencia" value="2" {if $avaliacao.experiencia == 2}checked="on"{/if}/> Pouca
      <input type="radio" name="experiencia" value="3" {if $avaliacao.experiencia == 3}checked="on"{/if}/> Alguma
      <input type="radio" name="experiencia" value="4" {if $avaliacao.experiencia == 4}checked="on"{/if}/> Muita
      <input type="radio" name="experiencia" value="5" {if $avaliacao.experiencia == 5}checked="on"{/if}/> Extrema
    </td>
  </tr>
  <tr>
    <th>Recomenda��o Geral</th>
    <td>
      Indique a sua avalia��o geral sobre a proposta:: <br/><br/>
      <input type="radio" name="recomendacao" value="1" {if $avaliacao.recomendacao == 1 || !$avaliacao.recomendacao}checked="on"{/if}/>
      Rejei��o forte - Tenho argumentos fortes para rejeitar o trabalho.
      <br/>
      <input type="radio" name="recomendacao" value="1.5" {if $avaliacao.recomendacao == 1.5}checked="on"{/if}/>
      Rejei��o fraca - N�o tenho argumentos fortes para rejeitar o trabalho;
      tenho mais argumentos para rejeitar o trabalho do que para aceitar.
      <br/>
      <input type="radio" name="recomendacao" value="1.75" {if $avaliacao.recomendacao == 1.75}checked="on"{/if}/>
      Aceita��o fraca - N�o tenho argumentos fortes para aceitar o trabalho;
      tenho mais argumentos para aceitar o trabalho do que para rejeitar.
      <br/>
      <input type="radio" name="recomendacao" value="2" {if $avaliacao.recomendacao == 2}checked="on"{/if}/>
      Aceita��o forte - Tenho argumentos fortes para aceitar o  trabalho.
    </td>
  </tr>
  <tr>
    <th>Coment�rios ao autor</th>
    <td>
      <textarea cols="60" rows="3" name="comentarios_autor">{$avaliacao.comentarios_autor}</textarea>
      </td>
  </tr>
  <tr>
    <th>Coment�rios � organiza��o</th>
    <td>
      <textarea cols="60" rows="3" name="comentarios_comite">{$avaliacao.comentarios_comite}</textarea>
    </td>
  </tr>
  <tr>
    <th colspan="2"><input type="submit" value="Salvar"/></th>
  </tr>
</table>
</form>
