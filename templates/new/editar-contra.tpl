<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Editar
        </div>
        <div class="actions">
        </div>
    </div>
<div class="portlet-body">
      
		<form class="form-horizontal" id="frmGral" name="frmGral" method="post" onsubmit="return false;">
			<input type="hidden" id="auxTpl" name="auxTpl" value="{$auxTpl}"/>
			<input type="hidden" id="personalId" name="personalId" value="{$personalId}"/>
			<input type="hidden" id="id" name="id" value="{$id}"/>
			<input type="hidden" id="type" name="type" value="saveAddMajor"/>
			<div class="form-body">
			
			<div class="form-group">
					<label class="col-md-3 control-label">Fecha de Contrato:</label>
					<div class="col-md-8">
						<input type="text" name="fechaContrato" onClick="loadFecha(4)" id="fecha_4" class="form-control" 
						{if $myModule.fechaContrato eq '0000-00-00'} value="{$hoy}" {else} value="{$myModule.fechaContrato}" {/if} >
					</div>
				</div>
			
			{if $myModule.modality eq 'Online'}
				<div class="form-group">
					<label class="col-md-3 control-label">Fecha de Materia:</label>
					<div class="col-md-8">
						Inicio:<input type="text" name="fechaInicioMateria" onClick="loadFecha(3)" id="fecha_3" class="form-control" value="{$myModule.initialDate}">
						Fin:<input type="text" onClick="loadFecha(4)" id="fecha_4" name="fechaFinMateria" class="form-control" value="{$myModule.finalDate}">

					</div>
				</div>

			{else}
			
				<div class="form-group">
					<label class="col-md-3 control-label">Fecha de Materia:</label>
					<div class="col-md-8">
						<input type="text" id="fechaMateria" name="fechaMateria" class="form-control" value="{$myModule.fechaMateria}">

					</div>
				</div>
			{/if}
				
				
				<div class="form-group">
					<label class="col-md-3 control-label">No. de Contrato:</label>
					<div class="col-md-8">
						<input type="text" name="noContrato" class="form-control"  
						
						{if $myModule.noContrato eq ''} value="{$noContrato}" {else} value="{$myModule.noContrato}" {/if}>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">Subtotal:</label>
					<div class="col-md-8">
						<input type="text" name="subtotal" class="form-control"  value="{$myModule.subtotal}">
					</div>
				</div>
				<!--
				<div class="form-group">
					<label class="col-md-3 control-label">Habilitar:</label>
					<div class="col-md-8">

						<input type="checkbox"  name="habilitar" class="form-control" {if $myModule.habilitarDescargaContrato eq 'si'} checked {/if}>
					</div>
				</div>-->
		</form>
</div>
</div>
</div>
<div id='msjErr'>
</div>
<div class="form-actions">

<center>
	<button  class="btn {$BUTTON_COLOR} submitForm" onClick="saveEditContrato()">Guardar</button>
	<button type="button" class="btn default closeModal" onClick="closeModal()" >Cancelar</button>
</center>
</div>

