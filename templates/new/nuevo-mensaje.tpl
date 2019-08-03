<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Nuevo Mensaje
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body">
        <div id="tblContent">
      
			<form class="form-horizontal" id="frmGral" name="frmGral" method="post" onsubmit="return false;">
				<input type="hidden" id="auxTpl" name="auxTpl" value="{$auxTpl}"/>
				<input type="hidden" id="id" name="id" value="{$id}"/>
				<input type="hidden" id="type" name="type" value="saveAddMajor"/>
				<div class="form-body">
					<div class="form-group">
						<label class="col-md-3 control-label">Para:</label>
						<div class="col-md-8">
							<select id="userId" name="userId" class="form-control">
								{foreach from=$actividades item=item}
									<option value="{$item.userId}">{$item.names} {$item.lastNamePaterno} {$item.lastNameMaterno}</option>
								{/foreach}
							</select>
						</div>
					</div>


					<div class="form-group">
						<label class="col-md-3 control-label">Mensaje:</label>
						<div class="col-md-8">
							<textarea class='form-control' name="mensaje"></textarea>
						</div>
					</div>
</form>
					



				</div>
			
        </div>
    </div>
</div>
<div class="form-actions">
						<div class="row">
							<div class="col-md-offset-3 col-md-9">
								
			
								<button  class="btn {$BUTTON_COLOR} submitForm" onClick="saveNew()">Guardar</button>
		
								<button type="button" class="btn default closeModal">Cancelar</button>
							</div>
						</div>
					</div>
