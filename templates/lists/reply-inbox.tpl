<div class="col-md-12 text-center mb-4">
	<a class="btn btn-outline-primary submitForm" href="javascript:;" onClick="SaveMsj('{$infoC.courseModuleId}','activo','{$chatId}')" data-title="Trash">
		<i class="fas fa-reply"></i> Enviar
	</a>
	<a class="btn btn-outline-info" href="javascript:;" onClick="SaveMsj('{$infoC.courseModuleId}','borrador','{$chatId}')" data-title="Trash">
		<i class="fas fa-minus-circle"></i> Descartar
	</a>
	<a class="btn btn-outline-danger" href="javascript:;" onClick="SaveMsj('{$infoC.courseModuleId}','borrar','{$chatId}')" data-title="Trash">
		<i class="fas fa-trash-alt"></i> Borrar
	</a>
</div>
<div class="col-md-12 mb-3">
	<div class="table-responsive">
		<table class="table">
			<tr>
				<td>De:</td>
				<td><b>{$de}</b></td>
			</tr>
			<tr>
				<td>Para:</td>
				<td><b>{$para}</b></td>
			</tr>
			<tr>
				<td>Asunto:</td>
				<td>
					<input type="text" name="subject2" id="subject2" class="border border-top-0 border-left-0 border-right-0 border-info form-control" value="" placeholder="" />
				</td>
			</tr>
		</table>
	</div>
</div>
<div class="col-md-12 mb-4">
	<form id="frmGral" name="frmGral" method="POST"> 
		<input type="hidden" name="subject1" id="subject1" value="{$subject}" />
		<input type="hidden" name="chatId" id="chatId" value="{$infoC.chatId}" />
		<input type="hidden" name="yoId" id="yoId" value="{$infoC.yoId}" />
		<input type="hidden" name="type" id="type" />
		<textarea name="mensaje" id="mensaje" class="form-control">{if $chatId ne 0}<br><br><br><br><br><hr>{$dataEnviado}{/if}</textarea>
		<br>
		<span class="btn btn-outline-dark btn-file pointer">
			<i class="fas fa-plus-circle fa-lg"></i>
			<input type="file" name="archivos" id="archivos" class="btn-file" onChange="verArchivo()">
			Agregar Archivo
		</span>
		<div id="divFileAdjunto" style="display:none">Archivo Adjunto...</div>
	</form>
</div>
<div class="col-md-12 text-center">
	<a class="btn btn-outline-primary submitForm" href="javascript:;" onClick="SaveMsj('{$infoC.courseModuleId}','activo','{$chatId}')" data-title="Trash">
		<i class="fas fa-reply"></i> Enviar
	</a>
	<a class="btn btn-outline-info" href="javascript:;" onClick="SaveMsj('{$infoC.courseModuleId}','borrador','{$chatId}')" data-title="Trash">
		<i class="fas fa-minus-circle"></i> Descartar
	</a>
	<a class="btn btn-outline-danger" href="javascript:;" onClick="SaveMsj('{$infoC.courseModuleId}','borrar','{$chatId}')" data-title="Trash">
		<i class="fas fa-trash-alt"></i> Borrar
	</a>
</div>