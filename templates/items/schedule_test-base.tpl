{foreach from=$__schedule_test item=item key=key}
	<tr>
		<td align="center" class="id">{$item.scheduletestId}</td>
		<td align="center">{if $item.typetest} {$item.typetest} {else} no hay Informacion de este examen en -Tipos de examen {/if}</td>
		<td align="center">{$item.datetest}</td>
		<td align="center">{$item.comments}</td>
		<td align="center">{$item.periodo}</td>
		<td align="center">
            <img src="images/icons/16/delete.png" class="spanDelete" id="{$item.scheduletestId}" title="Eliminar" />&nbsp;
          	<img src="images/icons/16/pencil.png" class="spanEdit" id="{$item.scheduletestId}" title="Editar" />
		</td>
	</tr>
{foreachelse}
<tr><td colspan="6" align="center">No se encontró ningún registro.</td></tr>
{/foreach}
