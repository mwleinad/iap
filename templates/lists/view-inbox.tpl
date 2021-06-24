<div class="col-md-12 text-center mb-3">
	<a class="btn btn-outline-primary submitForm" href="{$WEB_ROOT}/reply-inbox/id/{$courseMId}/cId/{$chatId}&or={$or}" data-title="Trash">
		<i class="fas fa-reply"></i> Responder
	</a>
	<a class="btn btn-outline-info" href="javascript:;" onClick="SaveMsj('{$infoC.courseModuleId}','borrador','{$chatId}')" data-title="Trash">
		<i class="fas fa-minus-circle"></i> Descartar
	</a>
	<a class="btn btn-outline-danger" href="javascript:;" onClick="SaveMsj('{$infoC.courseModuleId}','borrar','{$chatId}')" data-title="Trash">
		<i class="fas fa-trash-alt"></i> Borrar
	</a>
</div>
<div class="col-md-12">
	<form id="frmGral" name="frmGral" method="POST"> 
		<input type="hidden" name="subject1" id="subject1" value="{$subject}" />
		<input type="hidden" name="chatId" id="chatId" value="{$infoC.chatId}" />
		<input type="hidden" name="yoId" id="yoId" value="{$infoC.yoId}" />
		<input type="hidden" name="type" id="type" />
		{if $infoC.rutaAdjunto ne ''}
			<a href="{$WEB_ROOT}/doc_inbox/{$infoC.rutaAdjunto}" target="blank_" class="text-info">
				<i class="fas fa-paperclip"></i> Archivo Adjunto
			</a>
			<br>
		{/if}
		{$dataEnviado}
	</form>
</div>
<script type="text/javascript">
	var editor = new Jodit('textarea', {
		language: "es",
		toolbarButtonSize: "small",
		autofocus: true,
		toolbarAdaptive: false
	});
	$('.modal').removeAttr('tabindex');
</script>