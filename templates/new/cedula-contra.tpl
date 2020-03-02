<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Cedula Contrato
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body">
       
      
		
			
			<center>
				<button type="button" class="btn default green" style="width:211px" onClick="onDownLoadCedula({$id})">Descargar</button>
				<br>
				<br>
				<button type="button" class="btn default yellow" style="width:211px" onClick="onOpenLoad()">Subir</button>
				<div id="divForm" style="display:none">
					<br>
					<br>
					<form class="form-horizontal" id="frmGral" name="frmGral" method="post" onsubmit="return false;">
					<input type="hidden" name='type' value="onSendDoc">
					<input type="hidden" id="personalId" name="personalId" value="{$personalId}"/>
					<input type="hidden" id="id" name="id" value="{$id}"/>
					<input type="file" name='cedula' id='cedula'>
					</form>
					<button type="button" class="btn default " style="width:211px" onClick="onSendDoc()">Enviar</button>
				</div>
				<br>
				<br>
				{if $myModule.rutaCedula ne ''} 
				<a type="button" target='_blank' href='{$WEB_ROOT}/docentes/cedula/{$myModule.rutaCedula}' class="btn default blue" style="width:211px">Visualizar</a><br>
				{/if}
			</center>
			
		
	</div>    
</div>
</div>
<div id='msjErr'>
</div>
<center>

	<button type="button" class="btn default closeModal" onClick="closeModal()">Cancelar</button>

</center>

