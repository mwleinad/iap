{foreach from=$recordings item=item key=key}
    <tr>
        <td class="id text-center">{$item.recordingId}</td>
        <td class="text-center">{$item.title}</td>       
        <td class="text-center">{$item.date}</td>        
        <td class="text-center">
            <i id="{$item.recordingId}" class="fas fa-times-circle fa-2x text-danger pointer spanDelete" data-toggle="tooltip" data-placement="top" title="Eliminar"></i>
            <i id="{$item.recordingId}" class="fas fa-arrow-circle-right fa-2x text-success pointer spanEdit" data-toggle="tooltip" data-placement="top" title="Editar"></i>
        </td>
    </tr>
{foreachelse}
    <tr>
        <td colspan="4" class="text-center">No se encontró ningún registro.</td>
    </tr>				
{/foreach}
