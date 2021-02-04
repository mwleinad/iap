{foreach from=$personals item=item key=key}
    <tr>
        <td class="id text-center">{$item.personalId}</td>       
        <td>{$item.lastname_paterno} {$item.lastname_materno} {$item.name}</td>
        <td class="text-center">{$item.position}</td>        
        <td>{$item.wrappedDescription}</td>
        <td class="text-center">
            <i id="{$item.personalId}" class="fas fa-times-circle fa-2x text-danger pointer spanDelete" data-toggle="tooltip" data-placement="top" title="Eliminar"></i>
            <i id="{$item.personalId}" class="fas fa-arrow-circle-right fa-2x text-success pointer spanEdit" data-toggle="tooltip" data-placement="top" title="Editar"></i>
			{if $item.firmaConstancia eq 'si'}
			    {*<img src="images/pointer.png?sd"   title="FIRMA CONSTANCIAS" />*}
                <i class="fas fa-file-signature text-info fa-2x" data-toggle="tooltip" data-placement="top" title="Firma Constancias"></i>
			{/if}
        </td>
    </tr>
{foreachelse}
    <tr><td colspan="5" class="text-center">No se encontró ningún registro.</td></tr>				
{/foreach}
