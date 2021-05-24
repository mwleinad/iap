<div class="card mb-4">
    <div class="card-header bg-primary text-white">
		<i class="fas fa-file-contract"></i> Contratos
    </div>
    <div class="card-body">
		<div class="row">
			<div class="col-md-12 table-responsive">
				<table class="table">
					<tr class="text-center">
						<td><b>Formato de Contrato</b></td>
						<td><b>Contrato firmado</b></td>
					</tr>
					<tr>
						<td class="text-center">
							{if $myModule.rutaContrato eq ''}
								<div id="divForm" class="mb-3">
									<form id="frmGral" name="frmGral" method="post" onsubmit="return false;">
										<input type="hidden" name="type" value="onSendContrato" />
										<input type="hidden" id="personalId" name="personalId" value="{$personalId}" />
										<input type="hidden" id="id" name="id" value="{$id}" />
										<div style="">
											<span class="btn btn-primary btn-file">
												<input type="file" name="cedula" id="cedula" class="btn-file" onChange="onSendContrato()">
												Subir Contrato
											</span>
										</div>
										<progress id="progress_" value="0" min="0" max="100"></progress>
										<div id="porcentaje_">0%</div>
									</form>
								</div>
							{/if}
							{if $myModule.rutaContrato ne ''}
								<a target="_blank" href="{$WEB_ROOT}/docentes/contrato/{$myModule.rutaContrato}" class="btn btn-info">
									Visualizar
								</a><br><br>
								<a target="#" onClick="onDeleteContra('{$myModule.courseModuleId}','{$personalId}')" class="btn btn-danger">
									Eliminar
								</a>
							{/if}		
						</td>
						<td class="text-center">
							{if $myModule.rutaContratoFirmado eq '' and $myModule.rutaContrato ne ''}
								<div id="divForm">
									<form id="frmGral_" name="frmGral_" method="post" onsubmit="return false;">
										<input type="hidden" name="type" value="onSendContratoFirmado" />
										<input type="hidden" id="personalId" name="personalId" value="{$personalId}" />
										<input type="hidden" id="id" name="id" value="{$id}" /> 
										<div style="">
											<span class="btn btn-primary btn-file">
												<input type="file" name="cedula" id="cedula" class="btn-file" onChange="onSendContratoFirmado()">
												Subir Contrato
											</span>
										</div>
									</form>
									<progress id="progress_1" value="0" min="0" max="100"></progress>
									<div id="porcentaje_1">0%</div>
								</div>
							{/if}
							{if $myModule.rutaContratoFirmado ne ''}
								<a target="_blank" href="{$WEB_ROOT}/docentes/contrato/{$myModule.rutaContratoFirmado}" class="btn btn-info">
									Visualizar
								</a><br><br>
								<a target="#" onClick="onDeleteContraF('{$myModule.courseModuleId}','{$personalId}')" class="btn btn-danger">
									Eliminar
								</a>
							{/if}
						</td>
					</tr>
				</table>
			</div>
			<div class="col-md-12"><div id="msjErr"></div></div>
			<div class="col-md-12 text-right">
				<button type="button" class="btn btn-danger closeModal" onClick ="btnClose()">Cancelar</button>
			</div>
		</div>
    </div>
</div>