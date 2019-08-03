<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Confirma Baja</b> {$myModule.name|truncate:65:"..."} &raquo;
        </div>
        <div class="actions">

        </div>
    </div>
    <div class="portlet-body">
	<div id ="modal1" >
	</div>
	<br>
	<!--Es necesario descargar e imprimir el formato de reinscripción y llevarlo al área de control escolar para recabar las firmas correspondientes-->
	<form class="form-horizontal" id="addMajorForm" name="addMajorForm" method="post"  enctype="multipart/form-data">
		<input type="hidden" id="type" name="type" value="cancelar"/>
		<input type="hidden" id="solicitudId" name="solicitudId" value="{$id}"/>
			
	</form>
	<b>¿Realmente desea iniciar el proceso de baja?</b>
	<br>
	<br>
	
	<a href="{$WEB_ROOT}/unsubscribe/sId/{$id}"  class="btn {$BUTTON_COLOR} submitForm" >SI</a>
	<button type="button" class="btn default closeModal" onClick="cancelarSolicitud()">Cancelar Solicitud</button>
		
    </div>
</div>
