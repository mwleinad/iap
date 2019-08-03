{foreach from=$schedules item=item key=key}
        <tr id="1">
        <td align="center" class="id">{$item.scheduleId}</td>       
        <td>{$item.name}</td>
        <td id="etitl1">{$item.wrappedDescription}</td>
        <td class="act">            
            <img src="{$WEB_ROOT}/images/b_dele.png" class="spanDelete" id="{$item.scheduleId}"/></span> <img src="{$WEB_ROOT}/images/b_edit.png" class="spanEdit" id="{$item.scheduleId}"/></a>
        </td>
    </tr>
{foreachelse}
<tr><td colspan="4" align="center">No se encontró ningún registro.</td></tr>
{/foreach}
