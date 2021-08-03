{foreach from=$resources item=subject}
<tr class="text-center">
	<td class="break-line">{$subject.name}</td>
	<td class="break-line">{$subject.description}</td>
	<td>
		{if $configMateria eq 'si'}
			<a href="{$WEB_ROOT}/download.php?file=resources/config/{$subject.path}"><i class="fas fa-download fa-lg text-info"></i></a>
		{else}
			<a href="{$WEB_ROOT}/download.php?file=resources/{$subject.path}"><i class="fas fa-download fa-lg text-info"></i></a>
		{/if}
	</td>
	{if $User.type ne 'student'}
		<td>
			{if $page != "resources-modules-student"}
				{if $configMateria eq 'si'}
					<a href="javascript:void(0)" onClick="deleteResource('{$subject.resourceConfigId}')">
						<i class="fas fa-times-circle fa-2x text-danger" data-toggle="tooltip" data-placement="top" title="Eliminar"></i>
					</a>
					<a href="{$WEB_ROOT}/graybox.php?page=add-resource-c&id={$subject.resourceConfigId}&auxTpl=admin&cId={$courseModuleId}" data-target="#ajax" data-toggle="modal">
						<i class="fas fa-pen-square fa-2x text-success" data-toggle="tooltip" data-placement="top" title="Editar"></i>
					</a>
				{else}
					<a href="javascript:void(0)" onClick="DeleteResource({$subject.resourceId})" title="Eliminar">
						<i class="fas fa-times-circle fa-2x text-danger spanDeleteResource" id="d-{$subject.resourceId}" name="d-{$subject.name}" data-toggle="tooltip" data-placement="top" title="Eliminar"></i>
					</a>
					<a href="{$WEB_ROOT}/graybox.php?page=edit-resource&id={$subject.resourceId}&auxTpl=admin&cId={$myModule.courseModuleId}" data-target="#ajax" data-toggle="modal">
						<i class="fas fa-pen-square fa-2x text-success spanEdit" id="d-{$subject.subjectId}" name="d-{$subject.name}" data-toggle="tooltip" data-placement="top" title="Editar"></i>
					</a>
				{/if}
			{/if}
		</td>
	{/if}
</tr>
{foreachelse}
	<tr>
    	<td colspan="4" class="text-center">No se encontró ningún registro.</td>
    </tr>
{/foreach}
