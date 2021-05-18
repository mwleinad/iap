<form id="frmGral_5" class="mt-3">
	<input type="hidden" name="personalId" class="form-control" value="{$info.personalId}" />
	<div class="row">
		<div class="form-group col-md-6">
			<label for="user">Usuario</label>
			<input type="text" id="user" name="user" class="form-control" {if $cId eq 'si' or $Usertype eq 'Docente'} disabled {/if} value="{$info.username}" />
		</div>
		<div class="form-group col-md-6">
			<label for="pass1">Contraseña</label>
			<input type="password" name="pass" id="pass1" class="form-control" {if $cId eq 'si'} disabled {/if} value="{$info.passwd}" />
			<input type="text" style="display:none" name="pass" id="pass2" class="form-control" {if $cId eq 'si'} disabled {/if} value="{$info.passwd}" />
		</div>
	</div>
	<a href="javascript:void(0)" onClick="onVerPass()" class="btn btn-info btn-sm"><i class="far fa-eye fa-lg"></i></a>
</form>
<div class="row mt-3">
	<div class="col-md-12"><div id="msj_5"></div></div>
	<div class="col-md-12 text-center">
		{if $cId ne 'si'}
			<button onClick="guardarInformacion(5)" class="btn btn-primary">Guardar</button>
		{else}
			<button onClick="activaEdicion()" class="btn btn-warning">Activar Edicion</button>
		{/if}
		<div class="divControls" style="display:none">
			<button onClick="guardarInformacion(5)" class="btn btn-primary">Guardar</button>
		</div>
	</div>
</div>