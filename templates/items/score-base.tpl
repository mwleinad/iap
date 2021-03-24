{foreach from=$theGroup item=item key=key}
<tr id="1">
    <td class="text-center">{$item.controlNumber}</td>
    <td>{$item.lastNamePaterno} {$item.lastNameMaterno} {$item.names}</td>
    <td class="text-center">
        {if $item.homework.path ne ''}
            {assign var="entrega" value="1"}
            <a href="{$WEB_ROOT}/download.php?file=homework/{$item.homework.path}">
                {if $item.homework.nombre}
                    {$item.homework.nombre}
                {else}
                    Tarea
                {/if}
            </a>
        {else}
            {assign var="entrega" value="0"}
            Sin Entregar
        {/if}
    </td>
    <td class="text-center">
        <input type="text" class="form-control" maxlength="5" size="5"  name="ponderation[{$item.alumnoId}]" name="ponderation[{$item.alumnoId}]" value="{$item.ponderation}" />
    </td>
    <td class="text-center">
        <textarea class="form-control" name="retro[{$item.alumnoId}]" name="retro[{$item.alumnoId}]" rows="8" style="width: 200px !important;">{$item.retro}</textarea>
    </td>
    <td>
        <div id="divRetro_" class="text-center">
            {if $item.fileRetro ne ""}
                <a href="{$WEB_ROOT}/file_retro/{$item.fileRetro}" target="_blank">
                    <i class="fas fa-folder-open fa-3x text-warning"></i>
                </a><br>
            {/if}
            <input type="file" name="fileRetro_{$item.alumnoId}" id="fileRetro_{$item.alumnoId}" onChange="upFile({$item.alumnoId})">
        </div>
    </td>
</tr>
{foreachelse}
	    <tr><td colspan="6" class="text-center">No se encontró ningún registro.</td></tr>
{/foreach}
