<div class="card mb-4">
	<div class="card-header bg-primary text-white">
		<i class="fas fa-chart-line"></i> Currícula Activa
	</div>
	<div class="card-body">
		<div class="table-resposive">
			<table class="table table-hover table-light">
				<thead>
					<tr class="uppercase">
						<th> Tipo </th>
						<th> Nombre </th>
						<th> Grupo </th>
						<th> Modalidad </th>
						<th> Fecha Inicial </th>
						<th> Fecha Final </th>
					</tr>
				</thead>
				<tbody>
					{foreach from=$activeCourseStudent item=subject}
						<tr>
							<td>{$subject.major_name}</td>
							<td>{$subject.subject_name}</td>
							<td>{$subject.group}</td>
							<td>{$subject.modality}</td>
							<td>{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
							<td>{$subject.finalDate|date_format:"%d-%m-%Y"}</td>
						</tr>
					{foreachelse}
						<tr>
							<td colspan="7" class="text-center">No se encontró ningún registro.</td>
						</tr>
					{/foreach}
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="card mb-4">
	<div class="card-header bg-danger text-white">
		<i class="fas fa-times-circle"></i> Currícula Inactiva
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-hover table-light">
				<thead>
					<tr class="uppercase">
						<th>Tipo</th>
						<th>Nombre</th>
						<th>Grupo</th>
						<th>Modalidad</th>
						<th>Fecha Inicial</th>
						<th>Fecha Final</th>
					</tr>
				</thead>
				<tbody>
					{foreach from=$inactiveCourseStudent item=subject}
						<tr>
							<td>{$subject.major_name}</td>
							<td>{$subject.subject_name}</td>
							<td>{$subject.group}</td>
							<td>{$subject.modality}</td>
							<td>{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
							<td>{$subject.finalDate|date_format:"%d-%m-%Y"}</td>
						</tr>
					{foreachelse}
						<tr>
							<td colspan="9" class="text-center">No se encontró ningún registro.</td>
						</tr>
					{/foreach}
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="card mb-4">
	<div class="card-header bg-success text-white">
		<i class="fas fa-check-circle"></i> Currícula Finalizada
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-hover table-light">
				<thead>
					<tr class="uppercase">
						<th>Tipo</th>
						<th>Nombre</th>
						<th>Grupo</th>
						<th>Modalidad</th>
						<th>Fecha Inicial</th>
						<th>Fecha Final</th>
					</tr>
				</thead>
				<tbody>
					{foreach from=$finishedCourseStudent item=subject}
						<tr>
							<td>{$subject.major_name}</td>
							<td>{$subject.subject_name}</td>
							<td>{$subject.group}</td>
							<td>{$subject.modality}</td>
							<td>{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
							<td>{$subject.finalDate|date_format:"%d-%m-%Y"}</td>
						</tr>
					{foreachelse}
						<tr>
							<td colspan="10" class="text-center">No se encontró ningún registro.</td>
						</tr>
					{/foreach}
				</tbody>
			</table>
		</div>
	</div>
</div>

<script>
	if ($("#frmAddCurricula").find("#periodos").length > 0) {
		$("#frmAddCurricula").find("#periodos").html("");
	}
</script>