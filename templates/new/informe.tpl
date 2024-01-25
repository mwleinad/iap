<div class="card mb-4">
	<div class="card-header bg-primary text-white">
		<i class="far fa-folder-open"></i> Informe Final
	</div>
	<div class="card-body text-center">
		{if $info.rutaInforme eq ''}
			<form class="form" action="{$WEB_ROOT}/ajax/new/modules.php" method="post" id="form_report">
				<input type="hidden" name="option" value="sendReport">
				<input type="hidden" name="personalId" value="{$infoP.personalId}" />
				<input type="hidden" name="id" value="{$id}" />
				<div class="col-md-6 mx-auto mb-3 text-center">
					<label class="w-100" for="report">Informe(PDF/DOC)</label>
					<input type="file" name='report' id='report' class="form-control" />
				</div>
				<div class="col-md-6 mx-auto mb-3 text-center">
					<button class="btn btn-outline-info btn-file" type="submit">Subir informe</button>
				</div>
			</form>
		{else}
			<a type="button" target="_blank" href="{$WEB_ROOT}/docentes/informe/{$info.rutaInforme}" class="btn btn-info">
				Visualizar
			</a>
			<form class="form d-inline" id="form_report" action="{$WEB_ROOT}/ajax/new/modules.php">
				<button type="submit" class="btn btn-danger" onClick="onDeleteInforme({$id})">
					Eliminar
				</button>
			</form>
		{/if}
		<form id="frmGral">
			<input type="hidden" name="mId" value="{$mId}">
		</form>
	</div>
</div>