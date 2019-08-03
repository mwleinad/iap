<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorn"></i>Docente
        </div>
        <div class="actions">

        </div>
    </div>
    <div class="portlet-body">
	
		
	
		<div id="msj">
		</div>
		<div id='container'>
			<form  id='frmGral'>
					
					<table  >
						<tr>
							<td>Nombre</td><td>
								<input type="text" name="nombre" class='form-control' ></td>
						</tr>	
						<tr>	
							<td>Apellido Paterno</td>
							<td>
								<input type="text" name="paterno" class='form-control' ></td>
						</tr>
						<tr>
							
							<td>Apellido Materno</td><td>
								<input type="text" name="materno" class='form-control' ></td>
						</tr>
						<tr>
							<td>Correo Electronico</td><td>
								<input type="text" name="correo" class='form-control' ></td>
						</tr>
						<tr>
							<td>RFC</td><td>
								<input type="text" name="rfc" class='form-control' class='form-control'></td>
						</tr>
						<tr>
							<td>Usuario</td><td>
								<input type="text" name="usuario" id='fecha1' class='form-control' ></td>
						</tr>
						<tr>
							<td>Contraseña</td><td>
								<input type="text" name="pass" id='fecha1' class='form-control'></td>
						</tr>
					</table>
				</form>
		</div>
		
		<br>
		<br>
		
					<div id="msj_1">
					</div>
					<center>
					<button onClick='onSave()' class="btn {$BUTTON_COLOR}" >
					Guardar
					</button>
					<button type="button" class="btn default closeModal" onClick="cancelarSolicitud()">Cancelar</button>
					</center>
		
    </div>
</div>
