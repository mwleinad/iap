<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-file-upload"></i> Acta de Calificaciones
    </div>
    <div class="card-body">
		<div id="msj"></div>
		{include file="boxes/status_no_ajax.tpl"}
		<div id="loader"></div>
		<div id="contenido">
			<form class="form-horizontal" id="frmDoc_" method="post"  >
				<div class="row">
					<div class="col-md-12 text-center">
						<input type="hidden" id="type" name="type" value="adjuntarActa" />
						<input type="hidden" name="id" value="{$id}" />
						<input type="hidden" name="cmId" value="{$cmId}" />
						<input type="file" name="archivos" />
					</div>
				</div>
			</form>
			<div class="row">
				<div class="col-md-12 text-center">
					<progress id="progress_" value="0" min="0" max="100"></progress>
					<div id="porcentaje_" >0%</div>
				</div>
				<div class="col-md-12 text-center">
					<button  class="btn btn-outline-info" id="addMajor" name="addMajor" onClick="enviarArchivoActa()">Guardar</button>
				</div>
			</div>
		</div>
    </div>
</div>