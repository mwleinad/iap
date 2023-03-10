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
						<th> Modulos </th>
					</tr>
				</thead>
				<tbody>
					{foreach from=$activeCourses item=subject}
						<tr>
							<td >{$subject.majorName}</td>
							<td >{$subject.name}</td>
							<td >{$subject.group}</td>
							<td >{$subject.modality}</td>
							<td >{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
							<td >{$subject.finalDate|date_format:"%d-%m-%Y"}</td>
							<td >{$subject.courseModule}</td>
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
						<th>Clave</th>
						<th>Tipo</th>
						<th>Nombre</th>
						<th>Grupo</th>
						<th>Modalidad</th>
						<th>Fecha Inicial</th>
						<th>Fecha Final</th>
						<th>Dias Activo</th>
						<th>Modulos</th>
					</tr>
				</thead>
				<tbody>
					{foreach from=$inactiveCourses item=subject}
						<tr>
							<td>{$subject.clave}</td>
							<td>{$subject.majorName}</td>
							<td>{$subject.name}</td>
							<td>{$subject.group}</td>
							<td>{$subject.modality}</td>
							<td>{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
							<td>{$subject.finalDate|date_format:"%d-%m-%Y"}</td>
							<td>{$subject.daysToFinish}</td>
							<td>{$subject.courseModule}</td>
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
						<th>Clave</th>
						<th>Tipo</th>
						<th>Nombre</th>
						<th>Grupo</th>
						<th>Modalidad</th>
						<th>Fecha Inicial</th>
						<th>Fecha Final</th>
						<th>Dias Activo</th>
						<th>Modulos</th>
						<th>Calificación</th>
					</tr>
				</thead>
				<tbody>
					{foreach from=$finishedCourses item=subject}
						<tr>
							<td>{$subject.clave}</td>
							<td>{$subject.majorName}</td>
							<td>{$subject.name}</td>
							<td>{$subject.group}</td>
							<td>{$subject.modality}</td>
							<td>{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
							<td>{$subject.finalDate|date_format:"%d-%m-%Y"}</td>
							<td>{$subject.daysToFinish}</td>
							<td>{$subject.courseModule}</td>
							<td>{$subject.mark}</td>
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
if($("#frmAddCurricula").find("#periodos").length > 0){
	$("#frmAddCurricula").find("#periodos").html("");
}
</script>