<div class="card mb-4">
    <div class="card-header bg-primary header_main">
        <div class="sub_header"><i class="fas fa-save"></i> <b>Actualizar Contraseña</b> {$myModule.name|truncate:65:"..."} &raquo;</div>
    </div>
    <div class="card-body">
		<form id="frmPass" onsubmit="return false;">
			<div class="row">
				<div class="form-group col-md-12">
					<label for="anterior">Contraseña Anterior</label>
					<input id="anterior" name="anterior" type="password" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="nuevo">Nueva Contraseña</label>
					<input name="nuevo" id="nuevo" type="password" class="form-control" />
				</div>
				<div class="form-group col-md-6">
					<label for="repite">Repite la nueva contraseña</label>
					<input id="repite" name="repite" type="password" class="form-control" />
				</div>
			</div>
		</form>
		<div class="row">
			<div class="col-md-12 text-center"><div id="res_"></div></div>
			<div class="col-md-12 text-center"><div id="load"></div></div>
			<div class="col-md-12 text-center"><div id="msj5"></div></div>
			<div class="col-md-12 mt-3 text-center">
				<button class="btn btn-success" type="button" onClick="onSavePass()">Actualizar</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
    </div>
</div>