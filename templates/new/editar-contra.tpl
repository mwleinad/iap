<div class="card mb-4">
    <div class="card-header bg-primary text-white">
		<i class="fas fa-edit"></i> Editar
    </div>
    <div class="card-body">
		<form id="frmGral" name="frmGral" method="post" onsubmit="return false;">
			<input type="hidden" id="auxTpl" name="auxTpl" value="{$auxTpl}" />
			<input type="hidden" id="personalId" name="personalId" value="{$personalId}" />
			<input type="hidden" id="id" name="id" value="{$id}" />
			<input type="hidden" id="type" name="type" value="saveAddMajor" />
			<div class="row">
				<div class="form-group col-md-12">
					<label for="fecha_4">Fecha de Contrato:</label>
					<input type="text" name="fechaContrato" id="fecha_4" class="form-control i-calendar" {if $myModule.fechaContrato eq '00-00-0000'} value="{$hoy}" {else} value="{$myModule.fechaContrato}" {/if} />
				</div>
			</div>
			<span class="badge badge-dark my-3">Fecha de Materia</span>
			<div class="row">
				{if $myModule.modality eq 'Online'}
					<div class="form-group col-md-6">
						<label for="fecha_3">Inicio:</label>
						<input type="text" name="fechaInicioMateria" id="fecha_3" class="form-control i-calendar" value="{$myModule.initialDate}" />
					</div>
					<div class="form-group col-md-6">
						Fin:<input type="text" id="fecha_4" name="fechaFinMateria" class="form-control i-calendar" value="{$myModule.finalDate}" />
					</div>
				{else}
					<div class="form-group col-md-12">
						<label for="fechaMateria">Fecha de Materia:</label>
						<input type="text" id="fechaMateria" name="fechaMateria" class="form-control i-calendar" value="{$myModule.fechaMateria}" />
					</div>
				{/if}
			</div>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="noContrato">No. de Contrato:</label>
					<input type="text" id="noContrato" name="noContrato" class="form-control" {if $myModule.noContrato eq ''} value="{$noContrato}" {else} value="{$myModule.noContrato}" {/if} />
				</div>
				<div class="form-group col-md-6">
					<label for="subtotal">Subtotal:</label>
					<input type="text" id="subtotal" name="subtotal" class="form-control"  value="{$myModule.subtotal}" />
				</div>
			</div>
		</form>
		<div class="row">
			<div class="col-md-12"><div id="msjErr"></div></div>
			<div class="col-md-12 text-center">
				<button class="btn btn-primary submitForm" onClick="saveEditContrato()">Guardar</button>
				<button type="button" class="btn btn-danger closeModal" onClick="closeModal()">Cancelar</button>
			</div>
		</div>
    </div>
</div>
<script>
    flatpickr('.i-calendar', {
        dateFormat: "d-m-Y"
    });
</script>