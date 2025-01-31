<div class="card mb-4">
	<div class="card-header bg-primary text-white header_main">
		<div class="sub_header">
			<i class="fas fa-user-plus"></i> Ver curricula estudiante
		</div>
	</div>
	<div class="card-body">
		<div>
			<div class="row d-flex justify-content-center">
				<form id="form_curriculas" class="form" action="{$WEB_ROOT}/ajax/new/studentCurricula.php">
					<input type="hidden" id="userId" name="userId" value="{$student}">
					<input type="hidden" id="type" name="type" value="addStudentGroup">
					<div class="form-group">
						<label for="courseId"><span class="reqField">*</span> Selecciona Curricula:</label>
						<select name="courseId" id="courseId" class="form-control">
							{foreach from=$activeCourses item=item}
								<option value="{$item.courseId}">({$item.courseId}) - {$item.major_name}
									{$item.subject_name} {$item.group}</option>
							{/foreach}
						</select>
					</div>
					<div class="text-center">
						<button class="btn btn-success" type="submit">Agregar a grupo</button>
					</div>
				</form>
			</div>
			<div id="contentCurrent">
				<table class="table table-striped-columns mt-5">
					<thead class="thead-light">
						<tr>
							<th colspan="5" class="text-center bg-success text-uppercase text-white">Posgrados activos</th>
						</tr>
						<tr>
							<th>ID</th>
							<th>Currícula</th>
							<th>Grupo</th>
							<th>Fecha de inicio</th>
							<th>Fecha de finalización</th>
						<tr>
					</thead>
					<tbody>
						{foreach from=$activeCourseStudent item=item}
							<tr>
								<td>{$item.courseId}</td>
								<td>{$item.major_name} EN {$item.subject_name}</td>
								<td>{$item.group}</td>
								<td>{$item.initialDate}</td>
								<td>{$item.finalDate}</td>
							</tr>
						{/foreach}
					</tbody>
				</table>

				<table class="table table-striped-columns mt-5">
					<thead class="thead-light">
						<tr>
							<th colspan="5" class="text-center bg-info text-uppercase text-white">Posgrados finalizados</th>
						</tr>
						<tr>
							<th>ID</th>
							<th>Currícula</th>
							<th>Grupo</th>
							<th>Fecha de inicio</th>
							<th>Fecha de finalización</th>
						<tr>
					</thead>
					<tbody>
						{foreach from=$finishedCourseStudent item=item}
							<tr>
								<td>{$item.courseId}</td>
								<td>{$item.major_name} EN {$item.subject_name}</td>
								<td>{$item.group}</td>
								<td>{$item.initialDate}</td>
								<td>{$item.finalDate}</td>
							</tr>
						{/foreach}
					</tbody>
				</table>

				<table class="table table-striped-columns mt-5">
					<thead class="thead-light">
						<tr>
							<th colspan="5" class="text-center bg-danger text-uppercase text-white">Posgrados inactivos</th>
						</tr>
						<tr>
							<th>ID</th>
							<th>Currícula</th>
							<th>Grupo</th> 
						<tr>
					</thead>
					<tbody>
						{foreach from=$inactiveCourseStudent item=item}
							<tr>
								<td>{$item.courseId}</td>
								<td>{$item.major_name} EN {$item.subject_name}</td>
								<td>{$item.group}</td> 
							</tr>
						{/foreach}
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>