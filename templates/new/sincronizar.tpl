<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Sincronizar</b> {$myModule.name|truncate:65:"..."} &raquo;
        </div>
		
         <div class="actions">
		 
	
        </div>
		<div class="actions">
            <!--<a href="javascript:;" class="btn {$BUTTON_COLOR}" id="btnAddMajor">
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
		
		<form id='frmFiltro'>
				<center>
				<b>Tipo de Actualizacion</b><br>
				<select class='form-control' style='width:180px' name='tipo'>
					<option value='1'>Alumnos y Pagos</option>
					<option value='2'>Porcentaje de Becas a Alumnos existentes</option>
				</select>
				</center>
			
			<!--
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
			</div>-->
		</form>

		
		<center>
		<a  class="btn {$BUTTON_COLOR}" onClick="sincronizarDB()">
			<i class="fa fa-plus"></i> Sincronizar
		</a>
		</center>
		<div id='loader'>
		</div>
		<div id='contenido'>
        {include file="{$DOC_ROOT}/templates/lists/new/sincronizar.tpl"}
		</div>
    </div>
</div>