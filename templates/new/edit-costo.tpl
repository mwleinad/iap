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
		<input type="hidden" id="id" name="id" value="{$id}"/>
		<input type="hidden" id="type" name="type" value="saveAddMajor"/>
		<div class="form-body">
			<div class="form-group">
				<label class="col-md-3 control-label">Tarifa Mtro:</label>
				<div class="col-md-8">
					<input type="text"  id="tarifa" name="tarifaMtro" class="form-control" value="{$info.tarifaMtro}">

				</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-3 control-label">Tarifa Dr:</label>
				<div class="col-md-8">
					<input type="text"  id="tarifaDr" name="tarifaDr" class="form-control" value="{$info.tarifaDr}">

				</div>
			</div>


			<div class="form-group">
				<label class="col-md-3 control-label">Horas Materia:</label>
				<div class="col-md-8">
					<input type="text"  id="horas" name="horas" class="form-control" value="{$info.hora}">

				</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-3 control-label">Subtotal:</label>
				<div class="col-md-8">
					<input type="text"  id="subtotal" name="subtotal" class="form-control" value="{$info.subtotal}">

				</div>
			</div>
			
			
			
	</form>
	</div>
</div>
</div>
<div id='msjErr'>
</div>
<div class="form-actions">
<div class="row">
<div class="col-md-offset-3 col-md-9">
	<button  class="btn {$BUTTON_COLOR} submitForm" onClick="saveEditContrato()" >Guardar</button>
	<button type="button" class="btn default closeModal" onClick="closeModal()">Cancelar</button>
</div>
</div>
</div>

