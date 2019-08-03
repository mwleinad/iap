{foreach from=$specialities item=item key=key}
        <tr>
        <td align="center" align="center">{$item.specialityId}</td>       
        <td align="center">{$item.clave}</td>
        <td>&nbsp;&nbsp;{$item.name}</td>
        <td align="center">                        
            <img src="images/icons/16/delete.png" class="spanDelete" id="{$item.specialityId}" title="Eliminar" />&nbsp;
          	<img src="images/icons/16/pencil.png" class="spanEdit" id="{$item.specialityId}" title="Editar" />
        </td>
    </tr>
{foreachelse}
<tr><td colspan="4" align="center">No se encontró ningún registro.</td></tr>
{/foreach}
