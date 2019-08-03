<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorn"></i>Evaluación Docente
        </div>
        <div class="actions">

        </div>
    </div>
    <div class="portlet-body">
		<center>
			<h3>Cuestionario de opinión estudiantil sobre el desempeño docente(COEDD)</h3>
		</center>
		<br>
		<br>
		<b>{$myModule.majorName}: {$myModule.subjectName}</b><br>
		<b>MATERIA: {$myModule.name}</b><br>
		<b>Asesor:{$docente.name}  {$docente.lastname_materno}  {$docente.lastname_paterno}  </b> 
 		<br>

		<br>
		<br>
			<div style='text-align:justify; padding: 20px!important;'>
			El objetivo de este cuestionario es valorar la calidad de los procesos de enseñanza y aprendizaje desde el punto de vista
			de los estudiantes de posgrado. Se solicita tu opinión sobre el desempeño de Asesor. Las respuestas son anónimas y los resultados
			se comunican a los Asesores despues de que han entregado las calificaciones a la coordinación. Por favor conteste reflexivamente
			y con sinceridad.
			<br>
			Seleccionar con una <input type='radio' checked name='check_{$itemPregunta.preguntaId}' id='check_{$itemPregunta.preguntaId}' value='{$item2}' class="option-input checkbox" /> el valor que consideres.
			</div>
			<div style=' padding: 20px!important; width:40%'>
			<table width="80% !important" class="tblGral table table-bordered table-striped table-condensed flip-content">
				<tr><td><b>(6)</b> Deficiente</td></tr>
				<tr><td><b>(7)</b> Apenas aceptable</td></tr>
				<tr><td><b>(8)</b> Aceptable</td></tr>
				<tr><td><b>(9)</b> Satisfactorio</td></tr>
				<tr><td><b>(10)</b> Muy Satisfactorio</td></tr>
			</table>
			
			
			
			
			
			</div>
			<div style='clear:both'></div>
		<br>
		<br>
		<br>
		
		<form id='frmGral'>
			<input type='hidden' name='courseModuleId' value='{$myModule.courseModuleId}'>
			<input type='hidden' name='personalId' value='{$docente.personalId}'>
			<div id='container'>
			{include file="{$DOC_ROOT}/templates/lists/test-docente.tpl"}
			</div>
			<div id="msj">
			</div>
		</form>
		<center>
			
			<a href="javascript:void(0)" id="btnSaveEncuesta" onclick="SaveEncuesta()" class="btn {$BUTTON_COLOR} submitForm">Enviar Evaluación</a>
		</center>
		
    </div>
</div>