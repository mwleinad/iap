<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="far fa-folder"></i> Agregar Documento
    </div>
    <div class="card-body">
		<form id="form_addDoc" method="post" action="{$WEB_ROOT}/ajax/new/personal.php" class="form">
			<input type="hidden" id="type" name="type" value="adjuntarDocDocente" />
			<input type="hidden" name="personalId" value="{$personalId}" />
			<input type="hidden" id="solicitudId" name="catId" value="{$catId}" />
			<div class="row">
				<div class="col-md-12">
					<label for="comprobante">Archivo:</label>
					<input type="file" id="comprobante" name="comprobante">
				</div>
			</div>
			<div class="col-md-12 text-center">
				<button type="submit" class="btn btn-primary" id="addMajor" name="addMajor">Enviar</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
			</div>
		</form> 
    </div>
</div>