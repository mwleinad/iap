<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Referencia Bancaria</b> {$myModule.name|truncate:65:"..."} &raquo;
        </div>
        <div class="actions">

        </div>
    </div>
    <div class="portlet-body">
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
        {**include file="{$DOC_ROOT}/templates/lists/new/bank-reference.tpl"**}
    </div>
</div>