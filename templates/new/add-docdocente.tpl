<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="far fa-folder"></i> Agregar Documento
    </div>
    <div class="card-body">
		<form id="frmGral" method="post">
			<input type="hidden" id="type" name="type" value="adjuntarDocDocente" />
			<input type="hidden" name="personalId" value="{$personalId}" />
			<input type="hidden" id="solicitudId" name="catId" value="{$catId}" />
			<div class="row">
				<div class="col-md-12">
					<label for="comprobante">Archivo:</label>
					<input type="file" id="comprobante" name="comprobante">
				</div>
			</div>
		</form>
		<div class="row">
			<div class="col-md-12 text-center">
				<button class="btn btn-primary" id="addMajor" name="addMajor" onClick="enviarArchivo()">Enviar</button>
				<button type="button" class="btn btn-danger closeModal" onClick="btnClose()">Cancelar</button>
			</div>
		</div>
    </div>
</div>