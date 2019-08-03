<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorn"></i>Documentos del Docente
        </div>
        <div class="actions">

        </div>
    </div>
    <div class="portlet-body">
	
		
	
		<div id="msj">
		</div>
		<div id='container'>
			<form  id='frmGral'>
			<input type='hidden' name='docId' value='{$Info.catalogodocumentoId}'>
					<table  >
						<tr>
							<td>Nombre</td><td>
								<input type="text" name="nombre" class='form-control' value='{$Info.nombre}'></td>
						</tr>	
						<tr>	
							<td>Descripcion</td>
							<td>
								<textarea  name="descripcion" class='form-control' >{$Info.descripcion}</textarea>
							</td>
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
