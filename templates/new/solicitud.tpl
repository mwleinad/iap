<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Solicitudes</b> {$myModule.name|truncate:65:"..."} &raquo;
        </div>
        <div class="actions">

        </div>
    </div>
    <div class="portlet-body">
	{if $msj eq 'si'}
	<div class="alert alert-info alert-dismissable">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	  <strong></strong>La Solicitud ha sido enviada correctamente
	</div>
	{/if}
	<div id="msj">
	</div>

        {include file="boxes/status_no_ajax.tpl"}
		<form id='frmFiltro'>
			<div style="float:left">Alumno<br>
				<input type='text' name='alumnoId' class="form-control">
				<!--<select name='alumnoId' class="form-control" style="width:150px;" >
				<option></option>
				{foreach from=$registrosStudent item=item}
				<option value='{$item.userId}'>{$item.names} {$item.lastNamePaterno} {$item.lastNameMaterno}</option>
				{/foreach}
				</select>-->
			</div>
			<div style="float:left">Fecha Solicitud<br>
				<input type='text' name='fechaInicio' id='fecha_1'class="form-control" style="width:150px; float:left" onClick='cargaCalendario(1)'>
				<input type='text' name='fechaFin' id='fecha_2' class="form-control" style="width:150px;  float:left" onClick='cargaCalendario(2)'>
			</div>
			<div style="float:left">Tipo<br>
				<select name='tipo' class="form-control" style="width:150px; float:left">
				<option></option>
				{foreach from=$lstSolicitudes item=item}
				<option value='{$item.tiposolicitudId}'>{$item.nombre}</option>
				{/foreach}
				</select>
			</div>
			<div style="float:left">Estatus<br>
				<select name='estatus' class="form-control" style="width:150px;  float:left">
				<option></option>
				<option>pendiente</option>
				<option>en progreso</option>
				<option>autorizado</option>
				<option>completado</option>
				</select>
			</div>
		</form>
		<br>
		
		<button onClick='buscarSolicitud()' class="btn green submitForm">Buscar</button>
		<div id='loader'>
		</div>
		<div id='contenido'>
        {include file="{$DOC_ROOT}/templates/lists/new/solicitud.tpl"}
		</div>
    </div>
</div>