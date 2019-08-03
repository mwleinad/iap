{foreach from=$codes item=item key=key}
        <tr>
        <td align="center" class="id">{$item.codeId}</td>
        <td align="center">{$item.clave}</td>       
        <td>&nbsp;{$item.name}</td>                     
        <td align="center">                        
            <img src="images/icons/16/delete.png" class="spanDelete" id="{$item.codeId}" title="Eliminar" />&nbsp;
          	<img src="images/icons/16/pencil.png" class="spanEdit" id="{$item.codeId}" title="Editar" />
        </td>
    </tr>
{foreachelse}
<tr><td colspan="4" align="center">No se encontró ningún registro.</td></tr>
{/foreach}
