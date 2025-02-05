<div class="card mb-4">
	<div class="card-header bg-primary text-white header_main">
		<div class="sub_header">
			<i class="fas fa-user-plus"></i> Ver curricula estudiante
		</div>
	</div>
	<div class="card-body">
		<div class="row d-flex justify-content-center">
			<div class="col-md-12">
				<form id="form_curriculas" class="form row" action="{$WEB_ROOT}/ajax/new/studentCurricula.php">
					<input type="hidden" id="userId" name="userId" value="{$student}">
					<input type="hidden" id="type" name="type" value="addStudentGroup">
					<div class="form-group col-12">
						<label for="courseId"><span class="reqField">*</span> Selecciona el Posgrado:</label>
						<select name="courseId" id="courseId" class="form-control">
							{foreach from=$activeCourses item=item}
								<option value="{$item.courseId}">({$item.courseId}) - {$item.major_name}
									{$item.subject_name} {$item.group}</option>
							{/foreach}
						</select>
					</div>
					<div id="sectionForm"></div>
					<div class="text-center col-md-6 mx-auto">
						<button class="btn btn-success" type="submit">Agregar a grupo</button>
					</div>
				</form>
			</div>
		</div>
		<div id="contentCurrent">
			{include file="items/new/student-curricula.tpl"}
		</div>
	</div>
</div>