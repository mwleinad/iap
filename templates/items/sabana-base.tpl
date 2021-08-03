{foreach from=$marks item=item key=key}
<tr id="1">
	<td class="text-center">{$item.info.userId}</td>
	<td class="text-center">{$item.info.controlNumber}</td>
	<td class="text-center">{$item.info.lastNamePaterno} {$item.info.lastNameMaterno} {$item.info.names}</td>
	{foreach from=$addedModules item=modules} 
		<td>{$item.marks.{$modules.courseModuleId}}</td> 
	{/foreach}
	<td>{$item.marks.finalMark}</td> 
	<td class="text-center">
		<a href="{$WEB_ROOT}/certificado.php?id={$item.info.userId}&courseId={$id}" target="_blank" class="text-dark">
			<i class="fas fa-link"></i> Generar Certificado
		</a>
	</td>
</tr>
{foreachelse}
	<tr><td colspan="5" class="text-center">No se encontró ningún registro.</td></tr>
{/foreach}