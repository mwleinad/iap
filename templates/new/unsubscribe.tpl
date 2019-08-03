<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Tramite de Baja</b> {$myModule.name|truncate:65:"..."} &raquo;
        </div>
        <div class="actions">

        </div>
    </div>
    <div class="portlet-body">
		
		<!--<div style='float:right !important'>
		<a class="btn blue"  href="{$WEB_ROOT}/graybox.php?page=add-baja" data-target="#ajax" data-toggle="modal" data-width="1000px">
		Iniciar Proceso
		</a>
		</div>-->
	
		<div style='clear: both'></div>
		<div>
		<br>
		<br>
		<br>
		
		{if $infoBaja.solicitudId eq ''}
			<form id='frmGral'>
			<b>Tipo de Baja</b>
			<select name='tipobaja' id='tipobaja' class="form-control">
				<option value=''></option>
				<option value='temporal'>Temporal</option>
				<option value='definitiva'>Definitiva</option>
			</select>
			<b>Motivo</b>
			<textarea name='motivo' id='motivo' class="form-control"></textarea>
			</form>
			<div id='res_8'></div>
			<center>
				<a class="btn red"  href="#" onClick="saveBaja()">
				Dar de Baja
				</a>
			</center>
			<!--1. Descarga y Firma La Solicitud de baja <br>
			2. Adjunta La Solicitud de baja Firmada<br>
			<div style='clear: both'></div>
			<br>
			<br>
			<br>
			<a class="btn red"  href="#" onClick="descargarSolicitud()">
			Descargar Solicitud
			</a>
			<a class="btn blue"  href="{$WEB_ROOT}/graybox.php?page=solicitud-constancia&id=baja" data-target="#ajax" data-toggle="modal" data-width="1000px">
			Adjuntar Solicitud
			</a>
			-->
		{else}
		<b>Favor de descargar el formato, imprimirlo y llevarlo firmado a Control Escolar para finalizar con su proceso
		</b>
		<br>
		<br>
			<center>
			<a class="btn red"  href="javascript:void(0)" onClick="descargarSolicitud('{$info.courseId}','{$info.userId}','{$info.solicitudId}')">
			Descargar Solicitud
			</a>
			</center>
		{/if}
		
		{if $infoBaja.solicitudId eq ''}
			<h4>Para iniciar el Tramite de Baja debes presionar el botón Iniciar Proceso y complementar el formulario, al presionar el botón aceptar se genera un archivo en pdf
			que deberas descargar y firmar, para despues adjuntarlo escaneado en esta sección.</h4>
		{/if}	
		</div>
        {include file="boxes/status_no_ajax.tpl"}
        {**include file="{$DOC_ROOT}/templates/lists/new/bank-reference.tpl"**}
    </div>
</div>