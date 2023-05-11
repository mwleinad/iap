<input type="hidden" value="0" id="recarga" name="recarga">
{foreach from=$subjects item=subject}
    <tr>
        <td class="id text-center">{$subject.courseId}</td>
        <td class="text-center">{$subject.clave}</td>
        <td class="text-center">{$subject.majorName}</td>
        <td class="text-center break-line">{$subject.name}</td>
        <td class="text-center">{$subject.group}</td>
        <td class="text-center">
            {if $subject.modality eq 'Local'}
                Escolar
            {else}
                {$subject.modality}
            {/if}
        </td>
        <td class="text-center">
            {if $subject.initialDate != "0000-00-00"} 
                {$subject.initialDate|date_format:"%d-%m-%Y"}
            {else} 
                S/F 
            {/if}
        </td>
        <td class="text-center">
            {if $subject.finalDate != "0000-00-00"}
                {$subject.finalDate|date_format:"%d-%m-%Y"}
            {else} 
                S/F  
            {/if}  
        </td>
        <td class="text-center">
            <a href="{$WEB_ROOT}/configurar-calendario/id/{$subject.courseId}" target="_blank" title="Configurar Calendario">
                <i class="far fa-calendar-alt text-info fa-lg"></i>
            </a>
        </td>
        <td class="text-center">
            <a href="{$WEB_ROOT}/pagos-calendario/id/{$subject.courseId}" target="_blank" title="Historial de Pagos">
                <i class="fas fa-dollar-sign text-primary fa-lg"></i>
            </a>
        </td>
    </tr>
{foreachelse}
    <tr>
        <td colspan="11" class="text-center">No se encontró ningún registro.</td>
    </tr>
{/foreach}
