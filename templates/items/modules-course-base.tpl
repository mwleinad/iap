{foreach from=$subjects item=subject}
    <tr>
        <td class="text-center">{$subject.semesterId}</td>
        <td>{$subject.name}</td>
        <td>{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
        <td>{$subject.finalDate|date_format:"%d-%m-%Y"}</td>
		{if $User.type == "student"}
			<td class="text-center">
				{$subject.totalScore}<br />
				<a href="javascript:void(0)" onclick="CalificacionesAct({$subject.courseModuleId});">
					Actividades
				</a><br />
			</td>
			<td class="text-center">
				{if  $timestamp < $subject.initialDateStamp}
					No Disponible {* no iniciada *}
				{else}
					{if $subject.finalDateStamp > 0 AND $timestamp > $subject.finalDateStamp}
						{* materia finalizada *}
						{if $subject.countEval >=1}
							{$subject.calificacionFinal}
						{else}
							Contestar Evaluación
						{/if}
					{elseif $subject.active == "no"}
						{* materia finalizada *}
						{if $subject.countEval >=1}
							{$subject.calificacionFinal}
						{else}
							Contestar Evaluación
						{/if}
					{elseif $subject.finalDateStamp <= 0 AND $initialDateStamp < $subject.daysToFinishStamp AND $timestamp > $subject.daysToFinishStamp}
						{* materia finalizada *}
						{if $subject.countEval >=1}
							{$subject.calificacionFinal}
						{else}
							Contestar Evaluación
						{/if}
					{else}
						Contestar Evaluación {* materia activa *}
					{/if}
				{/if}
			</td>
			<td>
				{if $subject.countEval >=1}
					Contestada
				{else}
					{if  $timestamp < $subject.initialDateStamp}
						No Disponible
					{else}
						{if $subject.finalDateStamp > 0 AND $timestamp > $subject.finalDateStamp}
							<a href="{$WEB_ROOT}/test-docente/id/{$subject.courseModuleId}">Disponible</a>
						{elseif $subject.active == "no"}
							<a href="{$WEB_ROOT}/test-docente/id/{$subject.courseModuleId}">Disponible</a>
						{elseif $subject.finalDateStamp <= 0 AND $initialDateStamp < $subject.daysToFinishStamp AND $timestamp > $subject.daysToFinishStamp}
							<a href="{$WEB_ROOT}/test-docente/id/{$subject.courseModuleId}">Disponible</a>
						{else}
							No Disponible
						{/if}
					{/if}
				{/if}
			</td>
		{/if}
        <td class="text-center">
			{if $User.type == "student"}
				{if  $timestamp < $subject.initialDateStamp}
					No Iniciado
				{else}
					{if $subject.finalDateStamp > 0 AND $timestamp > $subject.finalDateStamp}
						Finalizado
					{elseif $subject.active == "no"}
						Finalizado
					{elseif $subject.finalDateStamp <= 0 AND $initialDateStamp < $subject.daysToFinishStamp AND $timestamp > $subject.daysToFinishStamp}
						Finalizado
					{else}
						<br />
						<a href="{$WEB_ROOT}/view-modules-student/id/{$subject.courseModuleId}" title="Ver Modulo de Curso" target="_top">
							<i class="fas fa-sign-in-alt fa-2x text-dark"></i>
						</a>
					{/if}
				{/if}
			{else}
				<a href="{$WEB_ROOT}/edit-modules-course/id/{$subject.courseModuleId}" title="Ver Modulos de Curso"target="_top">
					<i class="fas fa-sign-in-alt fa-2x text-dark"></i>
				</a>
			{/if}
        </td>
    </tr>
	<tr>
		<td id="td_{$subject.courseModuleId}" colspan="10" style="display:none"></td>
	</tr>
{foreachelse}
	<tr>
    	<td colspan="12" class="text-center">No se encontró ningún registro.</td>
	</tr>
{/foreach}
