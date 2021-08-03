<div class="card mb-4">
    <div class="card-header bg-primary text-white">
		<i class="far fa-folder-open"></i> Informe Final
    </div>
    <div class="card-body text-center">
		{if $info.rutaInforme eq ''}
			<form id="frmGral" name="frmGral" method="post" onsubmit="return false;">
				<input type="hidden" name="type" value="onSendContrato" />
				<input type="hidden" id="personalId" name="personalId" value="{$personalId}" />
				<input type="hidden" id="id" name="id" value="{$id}" />
				<span class="btn btn-outline-info btn-file">
					<input type="file" name="cedula" id="cedula" class="btn-file" onChange="onSendInforme({$id})">
					Subir Informe
				</span><br>
				<progress id="progress" value="0" min="0" max="100"></progress>
				<div id="porcentaje" >0%</div>
			</form>
		{else}
			<a type="button" target="_blank" href="{$WEB_ROOT}/docentes/informe/{$info.rutaInforme}" class="btn btn-info">
				Visualizar
			</a><br><br>
			<a type="button" href="javascript:void(0)" class="btn btn-danger" onClick="onDeleteInforme({$id})">
				Eliminar
			</a><br>
		{/if}
		<form id="frmGral" >
			<input type="hidden" name="mId" value="{$mId}">
		</form>
    </div>
</div>