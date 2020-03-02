<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Actualizar Contraseña</b> {$myModule.name|truncate:65:"..."} &raquo;
        </div>
        <div class="actions">
		
		
		</div>
    </div>
    <div class="portlet-body">
		<br>
		<br>

		<form id="frmPass" onsubmit="return false;">
			<table>
				<tr>
					<td>Contraseña Anterior</td>
					<td><input name='anterior' type="password" class="form-control" style="width:188px"></td>
				</tr>
				<tr>
					<td>Nueva Contraseña</td>
					<td><input name='nuevo' id='nuevo' type="password" class="form-control" style="width:188px">
					<!--<input type="checkbox" name="show" id="show" onClick="onVerPass()">-->
					</td>
				</tr>
					<tr>
					<td>Repite la nueva contraseña</td>
					<td><input name='repite' type="password" class="form-control" style="width:188px"></td>
				</tr>
			</table>
		</form>
		<center>
		<div id="res_"></div>
		<button class="btn green" type="button" onClick="onSavePass()">Actualizar</button>
		 <button type="button" class="btn default closeModal" onClick="closeModal()">Cancelar</button>
		</center>
		<br>
		<br>
	
	<div id="load"></div>
		<div id="msj5"></div>
	
    </div>
</div>