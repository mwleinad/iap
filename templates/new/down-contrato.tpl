<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Contratos
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body">
       
      
		
			
			
			<table align='center'>
				<tr>
					<td align='center'><b>Formato de Contrato</b></td>
					<td align='center'><b>Contrato firmado</b></td>
				</tr>
				<tr>
					<td>
						<center>

								{if $myModule.rutaContrato eq ''}
								
								<div id="divForm" >
							
									<form class="form-horizontal" id="frmGral" name="frmGral" method="post" onsubmit="return false;">
									<input type="hidden" name='type' value="onSendContrato">
									<input type="hidden" id="personalId" name="personalId" value="{$personalId}"/>
									<input type="hidden" id="id" name="id" value="{$id}" /> 
									<div style=''>
									<span class="btn btn-default btn-file">
									<input type="file" name='cedula' id='cedula' class="btn-file" onChange="onSendContrato()">
									Subir Contrato
									</span>
									</div>
									<progress id="progress_" value="0" min="0" max="100"></progress>
									<div id="porcentaje_" >0%</div>
									</form>
								</div>
								<br>
								{/if}
								{if $myModule.rutaContrato ne ''}
									<br>
									<br>
									<a type="button" target='_blank' href='{$WEB_ROOT}/docentes/contrato/{$myModule.rutaContrato}'  class="btn default blue" style="width:211px">Visualizar</a><br>
									<br>
									<a type="button" target='#' onClick="onDeleteContra('{$myModule.courseModuleId}','{$personalId}')"  class="btn default red" style="width:211px">Eliminar</a><br>
								{/if}
							</center>
									
					</td>
					<td>
						<center>

								{if $myModule.rutaContratoFirmado eq '' and $myModule.rutaContrato ne ''}
								<div id="divForm" >
									<form class="form-horizontal" id="frmGral_" name="frmGral_" method="post" onsubmit="return false;">
									<input type="hidden" name='type' value="onSendContratoFirmado">
									<input type="hidden" id="personalId" name="personalId" value="{$personalId}"/>
									<input type="hidden" id="id" name="id" value="{$id}" /> 
									<div style=''>
									<span class="btn btn-default btn-file">
									<input type="file" name='cedula' id='cedula' class="btn-file" onChange="onSendContratoFirmado()">
									Subir Contrato
									</span>
									</div>
									</form>
									<progress id="progress_1" value="0" min="0" max="100"></progress>
									<div id="porcentaje_1" >0%</div>
								</div>
								<br>
								{/if}
								{if $myModule.rutaContratoFirmado ne ''}
									<br>
									<br>
									<a type="button" target='_blank' href='{$WEB_ROOT}/docentes/contrato/{$myModule.rutaContratoFirmado}'  class="btn default blue" style="width:211px">Visualizar</a><br>
									<br>
									<a type="button" target='#' onClick="onDeleteContraF('{$myModule.courseModuleId}','{$personalId}')"  class="btn default red" style="width:211px">Eliminar</a><br>
								{/if}
							</center>
					</td>
				</tr>
			</table>
		
	</div>    
</div>
</div>
<div id='msjErr'>
</div>
<center>

	<button type="button" class="btn default closeModal" onClick ="closeModal()">Cancelar</button>

</center>

