<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-file-upload"></i> Plan de Estudios
    </div>
    <div class="card-body">
		<div id="msj"></div>
		<div id="loader"></div>
		<div id="contenido">
			<form class="form" method="post" id="form_plan" action="{$WEB_ROOT}/ajax/new/personal.php">
				<div class="row">
					<div class="col-md-12 text-center">
						<input type="hidden" id="type" name="type" value="adjuntarPlan" />
						<input type="hidden" name="id" value="{$id}" />
						<input type="hidden" name="cmId" value="{$cmId}" />
						<label class="w-100">Archivo PDF</label>
						<input type="file" name="comprobante" class="form-control" />
					</div>
				</div> 
				<div class="col-md-12 text-center mt-3">
					<button class="btn btn-outline-info" type="submit">Guardar</button>
				</div>
			</div>
		</div>
    </div>
</div>