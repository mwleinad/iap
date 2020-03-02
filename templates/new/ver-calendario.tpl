<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Calendario de Pagos
        </div>
        <div class="actions">
			<a class="btn green" href="javascript:void(0)" onClick="verCalendario()">
				<i class="fa fa-plus"></i>Imprimir
			</a>
        </div>
    </div>
    <div class="portlet-body" style='width:100% !important'>
   
            {foreach from=$lstPagos key=key item=aux}
				<div style='float:left'><b>{$aux.periodo}</b>
					<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
					<thead>
					<tr>
						<th>Fecha de Pago</th>
						<th>Descripcion</th>
						<th>Beca</th>
						<th>Importe</th>
					</tr>
					</thead>
					{foreach from=$aux.pagos item=aux4}
						<tr>
						<td>{$aux4.inicioPago}</td> 
						<td>{$aux4.descripcion}</td> 
						<td>{$aux4.beca} %</td>
						<td>$ {$aux4.total|number_format:2:'.':','}</td>
						</tr>
					{/foreach}
					</table>
				</div>
				<div style='float:left; width:90px'>
				<font color='white'>____________</font>
				</div>
				{if ($key+1)==2 or ($key+1) == 4 or ($key+1) == 8}
					<div style='clear: both'></div>
					<br>
					<br>

				{/if}
			 {/foreach}
			
     <div style='clear: both'></div>
	 <div style='clear: both'></div>
    </div>
</div>

