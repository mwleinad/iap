<div class="card mb-4">
	<div class="card-header bg-primary text-white">
		<i class="far fa-object-group"></i> Encuadre
	</div>
	<div class="card-body text-center">
		{if $info.rutaEncuadre eq ''}
			<form class="form" id="form_encuadre" method="POST" action="{$WEB_ROOT}/ajax/new/modules.php">
				<input type="hidden" name="option" value="sendFraming">
				<input type="hidden" id="personalId" name="personalId" value="{$infoP.personalId}" />
				<input type="hidden" id="id" name="id" value="{$id}" />
				<div class="col-md-6 mx-auto mb-3 text-center">
					<label class="w-100">Encuadre(PDF/DOC)</label>
					<input type="file" name='framing' id='framing' class="form-control" />
				</div>
				<div class="col-md-6 mx-auto mb-3 text-center">
					<button class="btn btn-outline-info btn-file" type="submit">Subir encuadre</button>
				</div>
			</form>
		{else}
			<a type="button" target="_blank" href="{$WEB_ROOT}/docentes/encuadre/{$info.rutaEncuadre}" class="btn btn-info">
				Visualizar
			</a> 
			<form class="form d-inline" id="form_encuadre" method="post" action="{$WEB_ROOT}/ajax/new/modules.php">
				<input type="hidden" name="option" value="deleteFraming">
				<input type="hidden" id="id" name="id" value="{$id}" />
				<button type="submit" class="btn btn-danger">
					Eliminar
				</button>
			</form>
		{/if}
		<form id="frmGral">
			<input type="hidden" name="mId" value="{$mId}">
		</form>
	</div>
</div>