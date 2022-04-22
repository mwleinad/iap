<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="far fa-folder"></i> Documentos del Alumno
    </div>
    <div class="card-body">
		<div id="msj"></div>
		<div id="container">
			<form id="frmGral">
				<input type="hidden" name="docId" value="{$Info.catdocumentoalumnoId}" />
				<div class="row">
					<div class="col-md-12">
						<label for="nombre">Nombre</label>
						<input type="text" id="nombre" name="nombre" class="form-control" value="{$Info.nombre}" />
					</div>
				</div>	
				<div class="row">	
					<div class="col-md-12">
						<label for="description">Descripcion</label>
						<textarea id="description" name="descripcion" class="form-control">{$Info.descripcion}</textarea>
					</div>
				</div>
			</form>
		</div>
		<div id="msj_1"></div>
		<div class="row mt-3">
			<div class="col-md-12 text-center">
				<button onClick="onSave()" class="btn btn-primary">
					Guardar
				</button>
				<button type="button" class="btn btn-danger closeModal" onClick="btnClose()">Cancelar</button>
			</div>
		</div>
    </div>
</div>