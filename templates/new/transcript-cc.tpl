<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Constancia de Estudios Con Calificaciones</b> {$myModule.name|truncate:65:"..."} &raquo;
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
		<div style='float:right !important'>
			<a class="btn blue"  href="{$WEB_ROOT}/graybox.php?page=solicitud-constancia&id=con" data-target="#ajax" data-toggle="modal" data-width="1000px">
                 Solicitar
			</a>
		</div>
        {include file="boxes/status_no_ajax.tpl"}
		<h3>Bancos Autorizados</h3>
		<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
			<thead>
			<tr>
				<th width="">Banco</th>
				<th width="">Numero de Cuenta</th>		 

			</tr>
			</thead>
			<tbody>
			{foreach from=$lstCuentas item=item}
			<tr>
				<td align="center">{$item.nombre}</td>
				<td align="center">{$item.numCuenta}</td>
			</tr>
			{/foreach}
			</tbody>
		</table>
		
		<h3>Solicitudes</h3>
        {include file="{$DOC_ROOT}/templates/lists/new/transcript-cc.tpl"}
    </div>
</div>