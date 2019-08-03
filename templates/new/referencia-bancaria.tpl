<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Referencia Bancaria</b> {$myModule.name|truncate:65:"..."} &raquo;
        </div>
        <div class="actions">
		
			{if $infoStudent.referenciaBancaria ne  ''}
			 <a href="javascript:void(0)" onClick="printReferencia()" class="btn {$BUTTON_COLOR} submitForm">Imprimir</a>
			 {/if}
		</div>
    </div>
    <div class="portlet-body">
	
	
	{if $countSol >= 1}
		<br>

		<div style='text-align:justify'>
		A efectos de poder identificar los pagos que realice a este Instituto durante su permanencia como alumno de posgrado, 
		se presenta a usted; la siguiente información:
		</div>
		<br>
		<br>
		<center>
		PORCENTAJE DE BECA AUTORIZADO:<b> {$infoPor.becaporcentaje} % </b><br>
		BANCO: <b>BBVABANCOMER</b><br>
		N° DE REFERENCIA PERSONAL:<b> {$infoStudent.referenciaBancaria} </b>
		</center>
		
		<br>
		<br>
		<b>Referencia Bancaria:</b>
		
		<br>
		<br>
		
		<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
			<thead>
			<tr>
				<th align="center" style="text-align:center" >Metodo de Pago</th>
				<th align="center" style="text-align:center">Datos Bancarios Requeridos</th>		 

			</tr>
			</thead>
			<tbody>
			<tr>
				<td align="center">En ventanilla</td>
				<td align="center">Con número de Convenio: 1234005</td>
			</tr>
			<tr>
				<td align="center">Por transferencia de un banco distinto a BBVA Bancomer</td>
				<td align="center">Con número de clabe interbancaria:012100001895258585</td>
			</tr>
			<tr>
				<td align="center">Por transferencia con cuenta BBVA Bancomer</td>
				<td align="center">Con número de Cuenta: 0189525858</td>
			</tr>
			</tbody>
		</table>
		<br>
		<br>
		<b>Nota Aclaratoria:</b>
		<br>
		<br>
		<div style='text-align:justify'>
		<b>*</b> En todos los casos deberá anotar el número de referencia personal y en el concepto, de preferencia el nombre del alumno; a menos de que el pago sea distinto a la colegiatura, deberá anotar como concepto el servicio que como alumno requiera (ejemplo: constancias, examen extraordinario, etc.).
		<br>
		<br>
		<b>*</b> En caso de dudas o aclaraciones al respecto, deberá comunicarse a los teléfonos (961) 125 15 08 al 10, ext. 116.
		</div>
	{else}
		<br>
		<br>
		<br>
		<br>
		<br>
		<center> 
		<b>Tus datos de referencia bancaria no existen. Favor de solicitarlos dando clic al siguiente botón</b>
		<br>
		<br>
		<button onClick="solicitarReferencia({$courseId})" class="btn {$BUTTON_COLOR} submitForm">Solicitar datos de referencia bancaria</button>
		
		</center>	
		<br>
		<br>
		<br>
		<br>
		<br>
	{/if}
	<div id="load"></div>
		<div id="msj5"></div>
	
    </div>
</div>