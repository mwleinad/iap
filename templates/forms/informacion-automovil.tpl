<form id="frmGral_4">
	<input type="hidden" name="personalId" class="form-control" value="{$info.personalId}" />
	<p class="text-justify">
		Si usted impartirá clases presenciales y llevará su automóvil al IAP-Chiapas los dias de clase, le pedimos de favor llenar la siguiente información para poder apartarle un cajón el dia de sus clases.
	</p>
	<div class="row">
		<div class="form-group col-md-12">
			<label for="modeloAuto">Modelo automóvil</label>
			<input type="text" id="modeloAuto" name="modeloAuto" class="form-control" {if $cId eq 'si'} disabled {/if} value="{$infoBasic.infoAuto.0.modelo}" />
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-6">
			<label for="colorAuto">Color automóvil</label>
			<input type="text" id="colorAuto" name="colorAuto" class="form-control" {if $cId eq 'si'} disabled {/if} value="{$infoBasic.infoAuto.0.color}" />
		</div>
		<div class="form-group col-md-6">
			<label for="placasAuto">Placas automóvil</label>
			<input type="text" id="placasAuto" name="placasAuto" class="form-control" {if $cId eq 'si'} disabled {/if} value="{$infoBasic.infoAuto.0.placas}" />
		</div>
	</div>
</form>
<div class="row">
	<div class="col-md-12"><div id="msj_4"></div></div>
	<div class="col-md-12 text-center">
		{if $cId ne 'si'}
			<button onClick="guardarInformacion(4)" class="btn btn-primary">Guardar</button>
		{else}
			<button onClick="activaEdicion()" class="btn btn-warning">Activar Edición</button>
		{/if}
		<div class="divControls mt-3" style="display:none">
			<button onClick="guardarInformacion(4)" class="btn btn-primary">Guardar</button>
		</div>
	</div>
</div>