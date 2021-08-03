<h3 class="text-center">Filtros de Búsqueda</h3>
<form id="frmFiltro">
	<div class="row">
		<div class="col text-center">
			<label for="apPaterno">Ap. Paterno</label>
			<input type="text" name="apPaterno" id="apPaterno" class="form-control form-control-sm" />
		</div>
		<div class="col text-center">
			<label for="apMaterno">Ap. Materno</label>
			<input type="text" name="apMaterno" id="apMaterno" class="form-control form-control-sm" />
		</div>
		<div class="col text-center">
			<label for="nombre">Nombre</label>
			<input type="text" name="nombre" id="nombre" class="form-control form-control-sm" />
		</div>
		<div class="col text-center">
			<label for="noControl">No. Control</label>
			<input type="text" name="noControl" id="noControl" class="form-control form-control-sm" />
		</div>
		<div class="col text-center">
			<label for="vista">Estatus</label>
			<select id="vista" name="vista" class="form-control form-control-sm">
				<option value="">Todos </option>
				<option value="1">Alta </option>
				<option value="2">Baja </option>
			</select>
		</div>
	</div>
</form>
<div class="form-group text-center">
	<input type="submit" name="submit" value="Buscar" onclick="DoSearch()" class="btn btn-success btn-sm mt-2" />
</div>
<hr />