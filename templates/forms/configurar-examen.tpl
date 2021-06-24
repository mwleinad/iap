<form id="addMajorForm" name="addMajorForm" method="post">
	<input type="hidden" id="type" name="type" value="saveAddMajor" />
	<input type="hidden" id="courseModuleId" name="courseModuleId" value="{$myModule.courseModuleId}" />
	<input type="hidden" id="activityId" name="activityId" value="{$activityId}" />
	<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
		<thead>
			<tr class="text-center">
				<th class="font-weight-bold">Titulo</th>
				<th class="font-weight-bold">Tiempo Limite <span class="text-danger">*</span></th>
				<th class="font-weight-bold">Numero de Preguntas <span class="text-danger">*</span></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="text-center font-weight-bold">{$activity.resumen}</td>
				<td>
					<input type="text" name="timeLimit" id="timeLimit" value="{$activity.timeLimit}" class="form-control" />
				</td>
				<td>
					<select name="noQuestions" id="noQuestions" class="form-control">
						<option value="4" {if $activity.noQuestions == 4} selected {/if}>4</option>
						<option value="5" {if $activity.noQuestions == 5} selected {/if}>5</option>
						<option value="10" {if $activity.noQuestions == 10} selected {/if}>10</option>
						<option value="20" {if $activity.noQuestions == 20} selected {/if}>20</option>
						<option value="25" {if $activity.noQuestions == 25} selected {/if}>25</option>
						<option value="50" {if $activity.noQuestions == 50} selected {/if}>50</option>
						<option value="100" {if $activity.noQuestions == 100} selected {/if}>100</option>
					</select>
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
				<td><span class="badge badge-dark">{$activity.noQuestions * 2}</span></td>
				<td><span class="badge badge-dark">{$activity.noQuestions}</span></td>
				<td><span class="badge badge-dark">{$ponderationPerQuestion}%</span></td>
			</tr>
		</tbody>
	</table>
	<div class="content-settings-row-register">
		<div id="tblContent2">{include file="lists/questions.tpl"}</div>
	</div>
</form>