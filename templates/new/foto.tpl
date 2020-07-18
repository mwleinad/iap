<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Fotografia</b> {$myModule.name|truncate:65:"..."} &raquo;
        </div>
        <div class="actions">
		
		
		</div>
    </div>
    <div class="portlet-body">
		<br>
		<br>

		<center>
	
		{if  $info.rutaFoto eq ''}
			<form class="form-horizontal" id="frmGral" name="frmGral" method="post" onsubmit="return false;">
				<input type="hidden" name='type' value="onSendINE">
				<input type="hidden" id="id" name="id" value="{$id}"/>
				<input type="hidden" id="tipo" name="tipo" value="{$id}" /> 
				<div style=''>
				<span class="btn btn-default btn-file">
				<input type="file" name='ine' id='ine' class="btn-file" onChange="onSendINE()">
				Subir Fotografia
				</span>
				</div>
				<progress id="progress" value="0" min="0" max="100"></progress>
				<div id="porcentaje" >0%</div>
			</form><!--
				<button class="btn green" type="button" onClick="onSendINE()">Guardar</button>-->
				<button type="button" class="btn default closeModal" onClick="closeModal()">Cancelar</button>
		{else}
				<a type="button" target='_blank' href='{$WEB_ROOT}/alumnos/{$info.rutaFoto}'  class="btn default blue" style="width:211px">Visualizar</a><br>
			<br>
			<a type="button" href="javascript:void(0)" class="btn default red" style="width:211px" onClick="onDeleteCarta('{$id}')">Eliminar</a><br>
		{/if}
		</center>
			
	
	<div id="load"></div>
		<div id="msj5"></div>
	
    </div>
</div>