{foreach from=$positions item=position}
    <tr>
        <td class="id text-center">{$position.positionId}</td>
        <td class="text-center">{$position.clave}</td>
        <td>{$position.name|truncate:20:"..."}</td>
        <td id="etitl1" class="text-center">{$position.description|truncate:35:"..."}</td>
        <td class="text-center">
            <i id="{$position.positionId}" name="{$position.name}" class="fas fa-times-circle fa-2x text-danger pointer spanDelete" data-toggle="tooltip" data-placement="top" title="Eliminar"></i>
            <i id="{$position.positionId}" name="{$position.name}" class="fas fa-arrow-circle-right fa-2x text-success pointer spanEdit" data-toggle="tooltip" data-placement="top" title="Editar"></i>
        </td>
    </tr>
{foreachelse}
	<tr>
    	<td colspan="5" class="text-center">No se encontró ningún registro.</td>
	</tr>
{/foreach}