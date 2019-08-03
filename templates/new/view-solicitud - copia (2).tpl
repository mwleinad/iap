<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorn"></i>Nueva Solicitud
        </div>
        <div class="actions">

        </div>
    </div>
    <div class="portlet-body">
	
		<div style="left:400px; position:relative">
		<div>Por Favor, Seleccione.</div>
		<select name='solicitudId' id='solicitudId' class="form-control" style='width:350px; float:left'>
			<option></option>
			{foreach from=$lstSol item=item}
			<option value='{$item.tiposolicitudId}'>{$item.nombre}</option>
			{/foreach}
		</select>
		<button onClick='addSolicitud()' class="btn {$BUTTON_COLOR} submitForm" >Solicitar</button>
		</div>
		<br>
		<br>
		<div id="msj">
		</div>
		<div id='container'>
        {include file="{$DOC_ROOT}/templates/lists/view-solicitud.tpl"}
		</div>
		*Las constancias las puedes recoger en original dentro de  la escuela.
    </div>
</div>