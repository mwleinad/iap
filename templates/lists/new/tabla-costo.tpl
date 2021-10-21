<table class="table table-bordered table-striped table-sm">
    <thead>
		<tr class="text-center">
			<th>ID</th>
			<th>Clave</th>
			<th>Tipo</th>
			<th>Nombre</th>
			<th>Modalidad</th>
			<th>Grupo</th>
			<th>Tarifa Mtro.</th>
			<th>Tarifa Dr.</th>
			<th>Horas Materia</th>
			<th>Acciones</th>
		</tr>
    </thead>
    <tbody>
		<input type="hidden" value="0" id="recarga" name="recarga" />
		{foreach from=$subjects item=subject}
			<tr class="text-center">
				<td class="id">{$subject.courseId}</td>
				<td>{$subject.clave}</td>
				<td>{$subject.majorName}</td>
				<td class="break-line">{$subject.name}</td>
				<td>{if $subject.modality eq 'Local'}Escolar{else}{$subject.modality}{/if}</td>
				<td>{$subject.group}</td>
				<td>{$subject.tarifaMtro}</td>
				<td>{$subject.tarifaDr}</td>
				<td>{$subject.hora}</td>
				<td>
					<a href="{$WEB_ROOT}/graybox.php?page=edit-costo&id={$subject.courseId}&cId=no" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Editar Información">
						<i class="fas fa-edit fa-lg"></i>
					</a>
				</td>
			</tr>
		{foreachelse}
			<tr>
				<td colspan="10" class="text-center">No se encontró ningún registro.</td>
			</tr>
		{/foreach}
    </tbody>
</table>