<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-chalkboard-teacher"></i> Docente
    </div>
    <div class="card-body">
        <div class="row">
			<div class="col-md-12"><div id="msj"></div></div>
		</div>
		<form id="frmGral">
			<div class="row">
				<div class="form-group col-md-4">
					<label for="nombre">Nombre</label>
					<input type="text" name="nombre" class="form-control" />
				</div>	
				<div class="form-group col-md-4">	
					<label for="paterno">Apellido Paterno</label>
					<input type="text" name="paterno" class="form-control" />
				</div>
				<div class="form-group col-md-4">
					<label for="materno">Apellido Materno</label>
					<input type="text" name="materno" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="correo">Correo Electronico</label>
					<input type="text" name="correo" class="form-control" />
				</div>
				<div class="form-group col-md-6">
					<label for="rfc">RFC</label>
					<input type="text" name="rfc" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="usuario">Usuario</label>
					<input type="text" name="usuario" id="fecha1" class="form-control" />
				</div>
				<div class="form-group col-md-6">
					<label for="pass">Contraseña</label>
					<input type="text" name="pass" id="pass" class="form-control" />
				</div>
			</div>
		</form>
		<div class="row">
			<div class="col-md-12"><div id="msj_1"></div></div>
			<div class="col-md-12 text-center">
				<button onClick="onSave()" class="btn btn-success" >Guardar</button>
				<button type="button" class="btn btn-danger closeModal" onClick="btnClose()">Cancelar</button>
			</div>
		</div>
    </div>
</div>