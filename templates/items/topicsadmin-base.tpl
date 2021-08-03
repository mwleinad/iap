{foreach from=$forum item=topic}
	<tr>
    	<td class="id text-center">{$topic.subject|truncate:30:"..."}</td>
        <td class="break-line">{$topic.descripcion}</td>
        <td class="text-center">
			<a href="{$WEB_ROOT}/forumsub-modules-student/id/{$id}/topicId/{$topic.topicId}">
				<i class="fas fa-sign-in-alt fa-2x text-success spanEdit" id="e-{$position.positionId}" name="e-{$position.name}" title="Entrar al Foro"></i>
			</a>
		</td>
	</tr>
{foreachelse}
	<tr>
    	<td colspan="3" class="text-center">No se encontró ningún registro.</td>
	</tr>
{/foreach}