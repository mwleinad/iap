<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Documentos del Docente</b> {$myModule.name|truncate:65:"..."} &raquo;
        </div>
		
         <div class="actions">
		 
	
            <a  class="btn green" id="" href="{$WEB_ROOT}/graybox.php?page=add-cat-doc-docente-add" data-target="#ajax" data-toggle="modal" data-width="1000px" title='ADJUNTAR DOCUMENTO'>
                <i class="fa fa-plus"></i> Agregar
            </a>
        </div>
		<div class="actions">
            <!--<a href="javascript:;" class="btn green" id="btnAddMajor">
                <i class="fa fa-plus"></i> Sincronizar School Manager
            </a>-->
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
		<!--
		<form id='frmFiltro'>
			<div style="float:left">Alumno<br>
				<input type='text' name='alumnoId' class="form-control">
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
		
		<button onClick='buscarSolicitud()' class="btn green submitForm">Buscar</button>-->
		<div id='loader'>
		</div>
		<div id='contenido'>
        {include file="{$DOC_ROOT}/templates/lists/new/add-cat-doc-docente.tpl"}
		</div>
    </div>
</div>