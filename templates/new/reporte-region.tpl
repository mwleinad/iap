<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Reporte region</b> {$myModule.name|truncate:65:"..."} &raquo;
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
			
			
			<div style="float:left">Certificaciones<br>
				<select name='tipo' class="form-control" style="width:150px; float:left">
				<option></option>
				{foreach from=$lstSolicitudes item=item}
				<option value='{$item.subjectId}'>{$item.subjectId}</option>
				{/foreach}
				</select>
			</div>
			<div style="float:left">Grupo<br>
				<select name='estatus' class="form-control" style="width:150px;  float:left">
				<option></option>
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				</select>
			</div>
			<div style="float:left">Region<br>
				<select name='region' class="form-control" style="width:150px; float:left">
				<option></option>
				{foreach from=$lstR item=item}
				<option value='{$item.region}'>{$item.region}</option>
				{/foreach}
				</select>
			</div>
		</form>
		<br>
		
		<button onClick='buscarSolicitud()' class="btn green submitForm">Buscar</button>
		<div id='loader'>
		</div>
		<div id='contenido'>
        {include file="{$DOC_ROOT}/templates/lists/new/reporte-region.tpl"}
		</div>
    </div>
</div>