<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-cash"></i>                 
        </span>
        Evaluación Docente
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>IAP Chiapas
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>

<div class="card mb-4">
    <div class="card-header bg-primary text-white text-center">
		<h3>Cuestionario de opinión estudiantil sobre el desempeño docente(COEDD)</h3>
		<p>
			<b>{$myModule.majorName}:</b> {$myModule.subjectName}<br>
			<b>MATERIA:</b> {$myModule.name}<br>
			<b>ASESOR:</b> {$docente.name} {$docente.lastname_materno} {$docente.lastname_paterno} 
		</p>
	</div>
    <div class="card-body">
		<p class="text-justify">
			El objetivo de este cuestionario es valorar la calidad de los procesos de enseñanza y aprendizaje desde el punto de vista de los estudiantes de posgrado. Se solicita tu opinión sobre el desempeño de Asesor. Las respuestas son anónimas y los resultados se comunican a los Asesores despues de que han entregado las calificaciones a la coordinación. Por favor conteste reflexivamente y con sinceridad.
		</p>
		<p class="text-justify">
			Seleccionar con una <input type="radio" checked name="check_{$itemPregunta.preguntaId}" id="check_{$itemPregunta.preguntaId}" value="{$item2}" class="option-input checkbox" /> el valor que consideres.
		</p>
		<div class="row d-flex justify-content-center">
			<div class="col-md-4">
				<ul class="list-group">
					<li class="list-group-item d-flex justify-content-between align-items-center">
						Deficiente <span class="badge badge-primary badge-pill">6</span>
					</li>
					<li class="list-group-item d-flex justify-content-between align-items-center">
						Apenas aceptable <span class="badge badge-primary badge-pill">7</span>
					</li>
					<li class="list-group-item d-flex justify-content-between align-items-center">
						Aceptable <span class="badge badge-primary badge-pill">8</span>
					</li>
					<li class="list-group-item d-flex justify-content-between align-items-center">
						Satisfactorio <span class="badge badge-primary badge-pill">9</span>
					</li>
					<li class="list-group-item d-flex justify-content-between align-items-center">
						Muy Satisfactorio <span class="badge badge-primary badge-pill">10</span>
					</li>
					
				</ul>
			</div>
		</div>
		<hr>
		<form id="frmGral">
			<input type="hidden" name="courseModuleId" value="{$myModule.courseModuleId}" />
			<input type="hidden" name="personalId" value="{$docente.personalId}" />
			<div id="container">
				{include file="{$DOC_ROOT}/templates/lists/test-docente.tpl"}
			</div>
			<div id="msj"></div>
		</form>
		<div class="row">
			<div class="col-md-12 text-center">
				<a href="javascript:void(0)" id="btnSaveEncuesta" onclick="SaveEncuesta()" class="btn btn-success submitForm">Enviar Evaluación</a>
			</div>
		</div>
    </div>
</div>