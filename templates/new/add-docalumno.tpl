<div class="card mb-4">
	<div class="card-header bg-primary header_main">
		<div class="sub_header">
			<i class="far fa-folder"></i> Agregar Documento
		</div>
	</div>
	<div class="card-body">
		<form id="frmGral" method="post">
			<input type="hidden" id="type" name="type" value="adjuntarDocAlumno" />
			<input type="hidden" name="userId" value="{$userId}" />
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
				<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>