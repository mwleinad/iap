<div class="card mb-4">
    <div class="card-header bg-primary text-white">
		<i class="fas fa-id-card"></i> Cédula Contrato
    </div>
    <div class="card-body">
		<div class="row">
			<div class="col-md-12 mb-3 text-center">
				<button type="button" class="btn btn-primary" onClick="onDownLoadCedula({$id})">
					<i class="fas fa-file-download"></i> Descargar
				</button>
			</div>
			<div class="col-md-12 mb-3 text-center">
				<button type="button" class="btn btn-warning" onClick="onOpenLoad()">
					<i class="fas fa-file-upload"></i> Subir
				</button>
			</div>
			<div id="divForm" style="display:none" class="col-md-12 mb-3 text-center">
				<form id="frmGral" name="frmGral" method="post" onsubmit="return false;">
					<input type="hidden" name="type" value="onSendDoc" />
					<input type="hidden" id="personalId" name="personalId" value="{$personalId}" />
					<input type="hidden" id="id" name="id" value="{$id}" />
					<input type="file" name="cedula" id="cedula" />
				</form>
				<button type="button" class="btn btn-primary mt-2" onClick="onSendDoc()">Enviar</button>
			</div>
			{if $myModule.rutaCedula ne ''}
				<div class="col-md-12 mb-3 text-center">
					<a type="button" target="_blank" href="{$WEB_ROOT}/docentes/cedula/{$myModule.rutaCedula}" class="btn btn-info">
						<i class="far fa-eye"></i> Visualizar
					</a>
				</div>
			{/if}
			<div class="col-md-12 text-center"><div id="msjErr"></div></div>
			<div class="col-md-12 mb-3 text-center">
				<button type="button" class="btn btn-danger closeModal" onClick="btnClose()">Cancelar</button>
			</div>
		</div>
    </div>
</div>