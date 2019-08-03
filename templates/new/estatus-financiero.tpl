<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Estatus financiero
        </div>
        <div class="actions">
			<a class="btn {$BUTTON_COLOR}" href="javascript:void(0)" onClick="verCalendario()">
				<i class="fa fa-plus"></i>Imprimir
			</a>
        </div>
    </div>
    <div class="portlet-body" style='width:100% !important'>
	<center>
	<b>{$infoCar.nombrenivel|upper}</b><br>
	{$infoCar.ciclo}<br>
	Cuatrimestre
	</center><br>
	<br>
	<br>
   
            {foreach from=$lstPagos key=key item=aux}
				<div style='float:left'><b>Grupo:</b>{$aux.gradogrupo|upper}&nbsp;&nbsp;&nbsp; <b>Periodo:</b>{$aux.periodo|upper}
					<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
					<thead>
					<tr>
						<th>Fecha de Pago</th>
						<th>Descripcion</th>
						
						<th>Importe</th>
						<th>Beca</th>
						<th>Total a Pagar</th>
						<th>Abono</th>
						<th>Saldo</th>
					</tr>
					</thead>
					{foreach from=$aux.pagos item=aux4}
						<tr>
						<td>{$aux4.inicioPago}</td> 
						<td> {$aux4.descripcion} </td> 
						<td>$ {$aux4.importe|number_format:2:'.':','}</td>
						<td>{if $aux4.claveconcepto ne 9 and $aux4.claveconcepto ne 12} {$aux4.beca} % {/if}</td>
						<td>$ {$aux4.totalPagar|number_format:2:'.':','}</td>
						<td>$ {$aux4.abono|number_format:2:'.':','}</td>
						<td>{if ($aux4.totalPagar - $aux4.abono) > 0} {$acumulado  = ($aux4.totalPagar - $aux4.abono)+$acumulado} <font color='red'>$ {$acumulado|number_format:2:'.':','} </font>{else}$  {$aux4.totalPagar - $aux4.abono|number_format:2:'.':','}{/if}</td>
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

