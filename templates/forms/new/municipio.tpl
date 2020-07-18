<select id="municipioId" name="municipioId"  style="width:150px" class="form-control" >
	<option value="0">Selecciona</option>
	  {foreach from=$lst item=pais}
	<option value="{$pais.municipioId}" {if $info.ciudad == $pais.municipioId} selected="selected" {/if}>{$pais.nombre} </option>
{/foreach}	
</select>