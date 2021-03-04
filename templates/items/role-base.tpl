{foreach from=$roles item=item key=key}
    <tr>
        <td class="id text-center">{$item.roleId}</td>
        <td class="text-center">{$item.clave}</td>       
        <td class="text-center">{$item.name}</td>        
        <td id="etitl1">{$item.wrappedDescription}</td>        
        <td class="text-center">
            <i id="{$item.roleId}" class="fas fa-times-circle fa-2x text-danger pointer spanDelete" data-toggle="tooltip" data-placement="top" title="Eliminar"></i>
            <i id="{$item.roleId}" class="fas fa-pen-square fa-2x text-success pointer spanEdit" data-toggle="tooltip" data-placement="top" title="Editar"></i>
        </td>
    </tr>
{foreachelse}
    <tr>
        <td colspan="5" class="text-center">No se encontró ningún registro.</td>
    </tr>				
{/foreach}
