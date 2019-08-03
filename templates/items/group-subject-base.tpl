{foreach from=$gposubjects item=item key=key}
        <tr id="1">
        <td align="center" class="id">{$item.gposubId}</td>    
        <td>{$item.subject}</td>
        <td id="etitl1"></td>      
        <td class="act">            
            <img src="{$WEB_ROOT}/images/b_dele.png" class="spanDelete" id="{$item.gposubId}"/></span> <img src="{$WEB_ROOT}/images/b_edit.png" class="spanEdit" id="{$item.gposubId}"/></a>
        </td>
    </tr>
{foreachelse}
<tr><td colspan="4" align="center">No se encontró ningún registro.</td></tr>
{/foreach}