{foreach from=$theGroup item=item key=key}
    {$mostrar = 0}
    {if $periodoActual < $item.alta}
        {* No mostrar al menos que sea recursamiento *}
        {if $item.situation eq "Recursador"}
            {$mostrar = 1}
        {/if} 
    {else}
        {$mostrar = 1}
    {/if} 
    {if $mostrar == 1}
        <tr id="1">
            <td class="text-center">{$item.controlNumber}</td>
            <td class="text-capitalize" style="white-space:normal;">
                {if $item.situation eq 'Recursador'} <small class="text-danger">[Recursador]</small> {/if} {$item.lastNamePaterno} {$item.lastNameMaterno} {$item.names}
            </td>
            <td class="text-center" style="white-space:normal;" id='homework{$item.homework.homeworkId}'>
                {if $item.homework.path ne ''}
                    {assign var="entrega" value="1"}
                    <a href="{$WEB_ROOT}/download.php?file=homework/{$item.homework.path}">
                        {if $item.homework.nombre}
                            {$item.homework.nombre}
                        {else}
                            Tarea
                        {/if}
                    </a>
                    {if $actividad.activityType == "Tarea" && in_array($User['userId'],[1,149])} 
                        <br>
                        <br>
                        <button class="btn btn-danger p-3 ajax" title="Eliminar tarea" data-id="{$item.homework.homeworkId}" data-url="{$WEB_ROOT}/ajax/score-activity-new.php" data-option="deleteHomework">
                            <i class="fa fa-trash"></i>
                        </button> 
                    {/if}
                {else}
                    {assign var="entrega" value="0"}
                    Sin Entregar
                {/if}
            </td>
            <td class="text-center" id='test{$item.activityScoreId}'>
                <input type="text" class="form-control" maxlength="5" size="5"  name="ponderation[{$item.alumnoId}]" value="{$item.ponderation}" {(in_array($item.alumnoId,[4405, 4404, 4336, 4531, 4548, 4549, 4550, 4568, 4570, 4576, 3983])) ? 'disabled' : ''} />
                {if $actividad.activityType == "Examen" && $item.try > 0 && in_array($User['userId'],[1,149])} 
                    <button class="btn btn-danger p-3 ajax" title="Eliminar intento de examen" data-id="{$item.activityScoreId}" data-student="{$item.alumnoId}" data-url="{$WEB_ROOT}/ajax/score-activity-new.php" data-option="deleteScore">
                        <i class="fa fa-trash"></i>
                    </button>
                {/if} 
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
    {/if}
        
    

{foreachelse}
	    <tr><td colspan="6" class="text-center">No se encontró ningún registro.</td></tr>
{/foreach}
