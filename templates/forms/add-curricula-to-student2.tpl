<script language="JavaScript">
	var nav4 = window.Event ? true : false;
	function habilitar() {
		if(editSubjectForm.tipo_beca.value=="Ninguno")
			editSubjectForm.por_beca.disabled = true;
		else
			editSubjectForm.por_beca.disabled = false;
	}
	function IsNumber(evt) {
		var key = nav4 ? evt.which : evt.keyCode;
		return (key <= 13 || (key >= 48 && key <= 57) || key == 46);
	}
</script>

<div class="row d-flex justify-content-center">
	<form id="frmAddCurricula" name="frmAddCurricula" method="post" onsubmit="return false">
		<input type="hidden" id="userId" name="userId" value="{$id}"/>
		<input type="hidden" id="type" name="type" value="addCurriculaStudent"/>
		<div class="form-group">
			<label for="courseId"><span class="reqField">*</span> Selecciona Curricula:</label>
			<select name="courseId" id="courseId" class="form-control">
				<option value=""></option>
				{foreach from=$activeCourses item=curso}
					<option value="{$curso.courseId}">({$curso.courseId}) - {$curso.major_name}
					{$curso.subject_name} {$curso.group}</option>
				{/foreach}  
			</select>
		</div>
		{if $auxTpl ne 1}
			{if $positionId==1}	  
				<div class="form-group">
					<label for="tipo_beca">Tipo de beca:</label>
					<select name="tipo_beca" id="tipo_beca" onChange='habilitar()'>
						<option value="Ninguno">Ninguno</option>
						<option value="Particular">Particular</option>
						<option value="Escolar">Escolar</option>
						<option value="Prodim">PRODIM</option>
					</select>                    
				</div>
				<div class="form-group">
					<label for="por_beca">Porcentaje de beca :</label>
					<input type="text" name="por_beca" id="por_beca" value="0" onkeypress="return IsNumber(event);" placeholder="%" />
				</div>
			{/if}
		{/if}
	</form>
</div>
<div class="row">
	<div class="form-group col-md-12 text-center">
		<button type="button" class="btn btn-danger" data-dismiss="modal">Salir</button>
		<button  class="btn btn-success submitForm" onClick="addModuls()">Asignar Curricula</button>
	</div>	
</div>
<div class="row">
	<div id="tblContentGray" class="col-md-12">
		{include file="{$DOC_ROOT}/templates/lists/curriculas.tpl"}	  
	</div>
</div> 