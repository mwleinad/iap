<form id="addMajorForm" name="addMajorForm" method="post">
	<input type="hidden" id="type" name="type" value="saveAddMajor" />
	<input type="hidden" id="courseModuleId" name="courseModuleId" value="{$myModule.courseModuleId}" />
	<input type="hidden" id="activityId" name="activityId" value="{$activityId}" />
	<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
		<thead>
		<tr>
			<tr class="text-center">
				<th class="font-weight-bold">Titulo</th>
				<th class="font-weight-bold">Tiempo Limite(minutos) <span class="text-danger">*</span></th>
				<th class="font-weight-bold">Numero de Preguntas para el examen <span class="text-danger">*</span></th>
				<th class="font-weight-bold">Numero Total de Preguntas<span class="text-danger">*</span></th>
			</tr>
			{* <tr>
				<td colspan="4" style="padding: 0;">
					<div class="alert alert-info my-0">
						Nota: si el total de preguntas es mayor al número de preguntas, el sistema tomará aleatoriamente las preguntas de éstas.
						En caso contrario, dejar los dos campos con las misma cantidad. 
					</div>
				</td>
			</tr> *}
		</thead>
		<tbody>
			<tr>
				<td class="text-center font-weight-bold">{$activity.resumen}</td>
				<td>
					<input type="text" name="timeLimit" id="timeLimit" value="{$activity.timeLimit}" class="form-control" />
				</td>
				<td>
					<input type="number" name="noQuestions" id="noQuestions" class="form-control" value="10">
				</td>
				<td>
					<input type="number" name="noQuestionTotals" id="noQuestionTotals" class="form-control" value="10">
				</td>
			</tr>
		</tbody>
	</table>
	<p><span class="reqField text-danger">*</span> Campo requerido</p>
	<div class="col-md-12 text-center">
		<input type="submit" id="addMajor" name="addMajor" value="Guardar" class="btn btn-success" />
	</div>
	<div class="col-md-12 text-center mt-5">
		<span class="badge badge-primary font-weight-bold" style="font-size: 11pt;">
			<i class="far fa-hand-point-down"></i> Preguntas <i class="far fa-hand-point-down"></i>
		</span>
	</div>
	<table class="table mt-5 mb-3">
		<thead>
			<tr class="text-center">
				<th class="font-weight-bold">Preguntas en Total:</th>
				<th class="font-weight-bold">Preguntas de Examen:</th>
				<th class="font-weight-bold">Ponderacion por Pregunta:</th>
			</tr>
		</thead
		<tbody>
			<tr class="text-center">
				<td><span class="badge badge-dark">{$activity.noQuestionTotals}</span></td>
				<td><span class="badge badge-dark">{$activity.noQuestions}</span></td>
				<td><span class="badge badge-dark">{$ponderationPerQuestion}%</span></td>
			</tr>
		</tbody>
	</table>
	<div class="content-settings-row-register">
		<div id="tblContent2">{include file="lists/questions.tpl"}</div>
	</div>
</form>