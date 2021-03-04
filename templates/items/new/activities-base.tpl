{foreach from=$actividades item=subject}
    <tr>
        <td class="id text-center">{$subject.activityId}</td>
        <td class="text-center">{$subject.activityType}</td>
        <td class="text-center">{$subject.initialDate|date_format:"%d-%m-%Y"} {$subject.horaInicial}</td>
        <td class="text-center">{$subject.finalDate|date_format:"%d-%m-%Y %H:%M:%S"}</td>
        <td class="text-center">{$subject.modality}</td>
        <td class="text-center">
            {if $subject.requiredActivity != 0}
                Id: {$subject.requiredActivity} Resumen: {$subject.requerida.resumen}
            {else}
                N/A
            {/if}  
        </td>
        <td class="text-center">{$subject.score}%</td>
        <td class="text-center">{$subject.resumen}</td>
        <td class="text-center">
            {if $subject.activityType == "Examen"}
                {if $majorModality == "Online"}
                    <a href="{$WEB_ROOT}/configuracion-examen/id/{$subject.activityId}" class="btn btn-info btn-sm">Configurar</a>
                {else}
                     <a href="{$WEB_ROOT}/configuracion-examen/id/{$subject.activityId}" class="btn btn-info btn-sm">Configurar</a>
                {/if}
            {else}
                N/A
            {/if}
        </td>
        <td class="text-center">
			{if $configMateria ne 'si'}
            <img src="{$WEB_ROOT}/images/icons/16/delete.png" class="spanDelete" data-id="{$subject.activityId}" id="d-{$subject.activityId}" name="d-{$subject.name}" title="Eliminar" />&nbsp;

            <a href="{$WEB_ROOT}/graybox.php?page=edit-activity&id={$subject.activityId}&auxTpl=admin&cId={$myModule.courseModuleId}" data-target="#ajax" data-toggle="modal">
                <img src="{$WEB_ROOT}/images/icons/16/pencil.png" class="spanEdit" id="d-{$subject.subjectId}" name="d-{$subject.name}" title="Editar" />
            </a>
			{else}	
				<a href="javascript:void(0)"  onClick="deleteAct('{$subject.activityConfigId}')">
				<img src="{$WEB_ROOT}/images/icons/16/delete.png"  title="Eliminar" />&nbsp;
				</a>
				<a href="{$WEB_ROOT}/graybox.php?page=add-activity-c&id={$subject.activityConfigId}&auxTpl=admin&cId={$courseModuleId}" data-target="#ajax" data-toggle="modal">
					<img src="{$WEB_ROOT}/images/icons/16/pencil.png" class="spanEdit" id="d-{$subject.subjectId}" name="d-{$subject.name}" title="Editar" />
				</a>
			{/if}
            {if $subject.score > 0}
                <!--<a href="{$WEB_ROOT}/graybox.php?page=score-activity&id={$subject.activityId}&auxTpl=admin&cId={$myModule.courseModuleId}" data-target="#ajax" data-toggle="modal">
                    <img src="{$WEB_ROOT}/images/icons/16/score.gif" class="spanEdit" id="d-{$subject.subjectId}" name="d-{$subject.name}" title="Calificar" />
                </a>-->
				{if $configMateria ne 'si'}
				<a href="{$WEB_ROOT}/score-activity-new&id={$subject.activityId}&auxTpl=admin&cId={$myModule.courseModuleId}" >
                    <img src="{$WEB_ROOT}/images/icons/16/score.gif" class="spanEdit" id="d-{$subject.subjectId}" name="d-{$subject.name}" title="Calificar" />
                </a>
				{/if}
            {/if}
        </td>
    </tr>
    {foreachelse}
    <tr>
        <td colspan="12" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
    </tr>
{/foreach}
