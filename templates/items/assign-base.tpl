{foreach from=$assignments item=item key=key}
        <tr id="1">
        <td align="center" class="id">{$item.groupId}</td>       
        <td>{$item.clave}</td>
        <td>{$item.name}</td>
        <td>{$item.semester}</td>
        <td>{$item.speciality}</td>
        <td>{$item.speciality}</td>
        <td align="center">
        <a href="{$WEB_ROOT}/group-subject/idgpo/{$item.groupId}">
        <img src="{$WEB_ROOT}/images/icons/view.png" border="0" />
        </a>
        </td>
        <td class="act">            
            <img src="{$WEB_ROOT}/images/b_dele.png" class="spanDelete" id="{$item.groupId}"/></span> <img src="{$WEB_ROOT}/images/b_edit.png" class="spanEdit" id="{$item.groupId}"/></a>
        </td>
    </tr>
{foreachelse}
<tr><td colspan="8" align="center">No se encontró ningún registro.</td></tr>
{/foreach}
