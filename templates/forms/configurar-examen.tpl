<form id="addMajorForm" name="addMajorForm" method="post">
	<input type="hidden" id="type" name="type" value="saveAddMajor"/>
	<input type="hidden" id="courseModuleId" name="courseModuleId" value="{$myModule.courseModuleId}"/>
	<input type="hidden" id="activityId" name="activityId" value="{$activityId}"/>
	<div class="content-in">
	<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
	<thead>
		<tr>
			<th style="width:400px">Titulo</th>
			<th>Respuesta para acreditar</th>
			<th>Numero de Preguntas</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><b>{$activity.resumen}</b> </td>
			<td><input type="text" name="timeLimit" id="timeLimit" value="{$activity.timeLimit}" style="width:150px" class="form-control" />
			<span class="reqField">*</span>
			</td>
			<td>
				<input type="number" name="noQuestions" id="noQuestions" class="form-control" style="width:150px">
				<!--<select  >
					<option value="4" {if $activity.noQuestions == 4} selected="selected" {/if}>4</option>
					<option value="5" {if $activity.noQuestions == 5} selected="selected" {/if}>5</option>
					<option value="10" {if $activity.noQuestions == 10} selected="selected" {/if}>10</option>
					<option value="20" {if $activity.noQuestions == 20} selected="selected" {/if}>20</option>
					<option value="25" {if $activity.noQuestions == 25} selected="selected" {/if}>25</option>
					<option value="50" {if $activity.noQuestions == 50} selected="selected" {/if}>50</option>
					<option value="100" {if $activity.noQuestions == 100} selected="selected" {/if}>100</option>
				</select>-->
				<span class="reqField">*</span>
			</td>
		</tr>
	</tbody>
	</table>
	<span class="reqField">*</span> Campo requerido<br>   
	
	<center>{if $countR >=1}La evalucion no se puede modificar porque, ya existen respuesta de alumnos{else}<input type="submit" id="addMajor" name="addMajor" value="Guardar" class="btn green"  />{/if}</center>
	<br>
	<br>
	<center><b>.:: Preguntas ::.</b></center>
	<!--<table>
		<tr>
			<td>Preguntas en Total: </td>
			<td><b>{$activity.noQuestions * 2}</b></td>
		</tr>
		<tr>
			<td>Preguntas de Examen: : </td>
			<td><b>{$activity.noQuestions}</b></td>
		</tr>
		<tr>
			<td>Ponderacion por Pregunta: </td>
			<td><b>{$ponderationPerQuestion}%</b></td>
		</tr>
	</table>-->
	<br>
	<br>
	<div class="content-settings-row-register" align="center">
		<div id="tblContent2">{include file="lists/questions.tpl"}</div>
	</div>      
	</div> 
</form>