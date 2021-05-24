<div class="card mb-4">
    <div class="card-header bg-primary text-white">
		<i class="fas fa-money-bill-wave"></i> Editar
    </div>
    <div class="card-body">
		<form id="frmGral" name="frmGral" method="post" onsubmit="return false;">
			<input type="hidden" id="auxTpl" name="auxTpl" value="{$auxTpl}" />
			<input type="hidden" id="id" name="id" value="{$id}" />
			<input type="hidden" id="type" name="type" value="saveAddMajor" />
			<div class="row">
				<div class="col-md-6">
					<label for="tarifa">Tarifa Mtro:</label>
					<input type="text" id="tarifa" name="tarifaMtro" class="form-control" value="{$info.tarifaMtro}" />
				</div>
				<div class="col-md-6">
					<label for="tarifaDr">Tarifa Dr:</label>
					<input type="text" id="tarifaDr" name="tarifaDr" class="form-control" value="{$info.tarifaDr}" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<label for="horas">Horas Materia:</label>
					<input type="text" id="horas" name="horas" class="form-control" value="{$info.hora}" />
				</div>
				<div class="col-md-6">
					<label for="subtotal">Subtotal:</label>
					<input type="text" id="subtotal" name="subtotal" class="form-control" value="{$info.subtotal}" />
				</div>
			</div>
		</form>
		<div class="row">
			<div class="col-md-12"><div id="msjErr"></div></div>
		</div>
		<div class="row mt-3">
			<div class="col-md-12 text-center">
				<button class="btn btn-primary submitForm" onClick="saveEditContrato()">Guardar</button>
				<button type="button" class="btn btn-danger closeModal" onClick="btnClose()">Cancelar</button>
			</div>
		</div>
    </div>
</div>