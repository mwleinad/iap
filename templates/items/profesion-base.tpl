{foreach from=$profesions item=position}
    <tr>
        <td class="id text-center">{$position.profesionId}</td>
        <td>{$position.profesionName|truncate:50:"..."}</td>
        <td class="text-center">
            <i id="{$position.profesionId}" name="{$position.profesionName}" class="fas fa-times-circle fa-2x text-danger pointer spanDelete" data-toggle="tooltip" data-placement="top" title="Eliminar"></i>
            <i id="{$position.profesionId}" name="{$position.profesionName}" class="fas fa-pen-square fa-2x text-success pointer spanEdit" data-toggle="tooltip" data-placement="top" title="Editar"></i>
        </td>
    </tr>
{foreachelse}
	<tr>
    	<td colspan="3" class="text-center">No se encontró ningún registro.</td>
	</tr>
{/foreach}