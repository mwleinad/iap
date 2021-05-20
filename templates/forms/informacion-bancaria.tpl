<a href="{$WEB_ROOT}/ajax/carta-pago.php?Id={$info.personalId}" target="_blank" class="btn btn-danger">Carta de Pago</a>
<form id="frmGral_3">
	<input type="hidden" name="personalId" class="form-control" value="{$info.personalId}" />
	<p class="text-justify">
		Favor de completar todos los campos, si no cuenta con información en alguno de ellos colocar las siglas N/D, una vez completado todos los campos se le habilitará el botón 'Descargar' para que pueda imprimir la 'Carta de Autorización de pago' y lo pueda firmar, este archivo deberá escanearlo y subirlo en la sección de 'DOCUMENTOS DEL DOCENTE'.
	</p>
	<div class="row">
		<div class="form-group col-md-6">
			<label for="banco">Institución Bancaria</label>
			<input type="text" id="banco" name="banco" class="form-control" {if $cId eq 'si'} disabled {/if} value="{$infoBasic.infoBanco.0.nombreBanco}" />
		</div>
		<div class="form-group col-md-6">
			<label for="ncuenta">No. Cuenta</label>
			<input type="text" id="ncuenta" name="ncuenta" class="form-control" {if $cId eq 'si'} disabled {/if} value="{$infoBasic.infoBanco.0.numCuenta}" />
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-12">
			<label for="clabeInter">CLABE Interbancaria</label>
			<input type="text" id="clabeInter" name="clabeInter" class="form-control" {if $cId eq 'si'} disabled {/if} value="{$infoBasic.infoBanco.0.claveInterbancaria}" />
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-6">
			<label for="sucursal">Sucursal</label>
			<input type="text" id="sucursal" name="sucursal" class="form-control" {if $cId eq 'si'} disabled {/if} value="{$infoBasic.infoBanco.0.sucursal}" />
		</div>
		<div class="form-group col-md-6">
			<label for="nplaza">Numero de Plaza</label>
			<input type="text" id="nplaza" name="nplaza" class="form-control" {if $cId eq 'si'} disabled {/if} value="{$infoBasic.infoBanco.0.numeroPlaza}" />
		</div>
	</div>
	<div class="row mb-3">
		<div class="form-group col-md-6">
			<label for="lugar">Lugar</label>
			<input type="text" id="lugar" name="lugar" class="form-control" {if $cId eq 'si'} disabled {/if} value="{$infoBasic.infoBanco.0.lugar}" />
		</div>
		<div class="form-group col-md-6">
			<label for="correoNoti">Correo Electrónico para notificación de pago</label>
			<input type="text" id="correoNoti" name="correoNoti" class="form-control" {if $cId eq 'si'} disabled {/if} value="{$infoBasic.infoBanco.0.correo}" />
		</div>
	</div>
	<h3>Tipo de Contrato</h3>
	<div class="row">
		<div class="col-md-12">
			<div class="form-check-inline">
				<label class="form-check-label">
					<input type="radio" class="form-control" name="tipoContrato" value="fisica" {if $info.tipoContrato eq 'fisica'} checked {/if} /> Personal Física
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label">
					<input type="radio" class="form-control" name="tipoContrato" value="moral" {if $info.tipoContrato eq 'moral'} checked {/if} /> Personal Moral
				</label>
			</div>
		</div>
	</div>
</form>
<div class="row mt-4">
	<div class="col-md-12"><div id="msj_3"></div></div>
	<div class="col-md-12 text-center">
		{if $cId ne 'si'}
			<button onClick="guardarInformacion(3)" class="btn btn-primary">Guardar</button>
		{else}
			<button onClick="activaEdicion()" class="btn btn-warning">Activar Edición</button>
		{/if}
		<div class="divControls mt-3" style="display:none">
			<button onClick="guardarInformacion(3)" class="btn btn-primary">Guardar</button>
		</div>
	</div>
</div>