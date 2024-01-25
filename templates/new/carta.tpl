<div class="card mb-4">
	<div class="card-header bg-primary text-white">
		<i class="fas fa-clone"></i> Carta Descriptiva
	</div>
	<div class="card-body text-center">
		{if $info.rutaCarta eq ''}
			<form class="form" id="form_carta" method="post" action="{$WEB_ROOT}/ajax/new/modules.php">
				<input type="hidden" name='option' value="sendLetter" />
				<input type="hidden" id="personalId" name="personalId" value="{$personalId}" />
				<input type="hidden" id="id" name="id" value="{$id}" />
				<div class="col-md-6 mx-auto mb-3">
					<label class="w-100">Carta Descriptiva(PDF/DOC)</label>
					<input type="file" name="descriptiveLetter" class="form-control">
				</div>
				<div class="col-md-6 mx-auto mb-3 text-center">
					<button class="btn btn-outline-info" type="submit">Enviar</button>
				</div>
			</form>
		{else}
			<a type="button" target='_blank' href='{$WEB_ROOT}/docentes/carta/{$info.rutaCarta}' class="btn btn-info">
				Visualizar
			</a>
			<form class="form d-inline" id="form_carta" method="POST" action="{$WEB_ROOT}/ajax/new/modules.php">
				<input type="hidden" name="id" value="{$id}">
				<input type="hidden" name="option" value="deleteLetter">
				<button type="submit" class="btn btn-danger">
					Eliminar
				</button> 
			</form> 
		{/if}
		<form id="frmGral">
			<input type="hidden" name="mId" value="{$mId}" />
		</form>
	</div>
</div>