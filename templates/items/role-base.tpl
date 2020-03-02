{foreach from=$roles item=item key=key}
        <tr>
        <td align="center" class="id">{$item.roleId}</td>
        <td align="center">{$item.clave}</td>       
        <td align="center">{$item.name}</td>        
        <td id="etitl1">&nbsp;{$item.wrappedDescription}</td>        
        <td align="center">                        
            <img src="images/icons/16/delete.png" class="spanDelete" id="{$item.roleId}" title="Eliminar" />&nbsp;
          	<img src="images/icons/16/pencil.png" class="spanEdit" id="{$item.roleId}" title="Editar" />
        </td>
    </tr>
{foreachelse}
<tr><td colspan="5" align="center">No se encontró ningún registro.</td></tr>				
{/foreach}
