{foreach from=$majors item=item key=key}    
    <tr>
        <td class="text-center">{$item.majorId}</td>
        <td>{$item.name}</td>
        <td class="text-center">
            <i id="{$item.majorId}" class="fas fa-times-circle fa-2x text-danger pointer spanDelete" data-toggle="tooltip" data-placement="top" title="Eliminar"></i>
			<i id="{$item.majorId}" class="fas fa-pen-square fa-2x text-success pointer spanEdit" data-toggle="tooltip" data-placement="top" title="Editar"></i>
        </td>                        
   </tr>
{foreachelse}
    <tr>
        <td colspan="5" class="text-center">Ningún registro encontrado.</td>
    </tr>
{/foreach}
