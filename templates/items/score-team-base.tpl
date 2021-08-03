{foreach from=$theGroup item=item key=key}
<tr id="1">
    <td class="text-center">{$item.teamId}</td>
    <td class="text-center">{$item.teamNumber}</td>
    <td class="text-center">
        {if $item.homework.path ne ''} 
            <a href="{$item.homework}" target="_blank">{$item.nombre}</a>
        {else}
            Sin Entregar
        {/if}
    </td>
    <td class="text-center">
        <input type="text" class="form-control" type="text" maxlength="5" size="5" name="ponderation[{$item.teamNumber}]" value="{$item.ponderation}" />
    </td>
    <td class="text-center">
        <textarea class="form-control" style="width: 200px;" rows="8" type="text" name="retro[{$item.teamNumber}]">{$item.retro}</textarea>
    </td>
    <td>
        <div id="divRetro_">
            {if $item.fileRetro ne ""}
                <a href="{$WEB_ROOT}/file_retro/{$item.fileRetro}" target="_blank">
                    <i class="fas fa-folder-open fa-3x text-warning"></i>
                </a>
            {/if}
            <input type="file" name="fileRetro_{$item.teamNumber}" id="fileRetro_{$item.teamNumber}" onChange="upFile({$item.teamNumber})">
        </div>
    </td>
</tr>
{foreachelse}
    <tr><td colspan="6" class="text-center">No se encontró ningún registro.</td></tr>
{/foreach}

        