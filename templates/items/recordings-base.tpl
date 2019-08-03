{foreach from=$recordings item=item key=key}
        <tr>
        <td align="center" class="id">{$item.recordingId}</td>
        <td align="center">{$item.title}</td>       
        <td align="center">{$item.date}</td>        
        <td align="center">                        
            <img src="images/icons/16/delete.png" class="spanDelete" id="{$item.recordingId}" title="Eliminar" />&nbsp;
          	<img src="images/icons/16/pencil.png" class="spanEdit" id="{$item.recordingId}" title="Editar" />
        </td>
    </tr>
{foreachelse}
<tr><td colspan="5" align="center">No se encontró ningún registro.</td></tr>
{/foreach}
