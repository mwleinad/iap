<table class="table table-bordered table-striped table-sm">
    <thead>
		<tr class="text-center">
			<th>ID</th>
			<th>Clave</th>
			<th>Tipo</th>
			<th>Nombre</th>
			<th>Periodo</th>
			<th>Modalidad</th>
			<th>Grupo</th>
			<th>Materias</th>
		</tr>
    </thead>
    <tbody>
		<input type="hidden" value="0" id="recarga" name="recarga" />
		{foreach from=$subjects item=subject}
			<tr class="text-center">
				<td class="id">{$subject.courseId}</td>
				<td>{$subject.clave}</td>
				<td>{$subject.majorName}</td>
				<td>{$subject.name}</td>
				<td>{$subject.initialDate} | {$subject.finalDate}</td>
				<td>{if $subject.modality eq 'Local'}Escolar{else}{$subject.modality}{/if}</td>
				<td>{$subject.group}</td>
				<td>
					<a href="{$WEB_ROOT}/prog-materia/m/{$subject.courseId}" title="Materias">
						<i class="fas fa-briefcase fa-lg"></i>
					</a>
				</td>
			</tr>
		{foreachelse}
			<tr>
				<td colspan="7" class="text-center">No se encontró ningún registro.</td>
			</tr>
		{/foreach}
    </tbody>
</table>