<input type="hidden" value="0" id="recarga" name="recarga">
{foreach from=$subjects item=subject}
    <tr>
        <td class="id text-center">{$subject.courseId}</td>
        <td class="text-center">{$subject.clave}</td>
        <td class="text-center">{$subject.majorName}</td>
        <td class="text-center">{$subject.name}</td>
		<td class="text-center">{$subject.group}</td>
        <td class="text-center">
            {if $subject.modality eq 'Local'}
                Presencial
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
            {if $subject.totalPeriods > 0}
                <a href="{$WEB_ROOT}/configurar-calendario/id/{$subject.courseId}" target="_blank" title="Configurar Calendario">
                    <i class="material-icons">calendar_today</i>
                </a>
            {/if}
        </td>
        <td class="text-center">
            {if $subject.totalPeriods > 0}
                <a href="{$WEB_ROOT}/becas-calendario/id/{$subject.courseId}" target="_blank" title="Configurar Becas">
                    <i class="material-icons">verified</i>
                </a>
            {/if}
		</td>
        <td class="text-center">
            {if $subject.totalPeriods > 0}
                <a href="{$WEB_ROOT}/pagos-calendario/id/{$subject.courseId}" target="_blank" title="Historial de Pagos">
                    <i class="material-icons">attach_money</i>
                </a>
            {/if}
		</td>
    </tr>
    {foreachelse}
    <tr>
        <td colspan="10" class="text-center">No se encontr&oacute; ning&uacute;n registro.</td>
    </tr>
{/foreach}
