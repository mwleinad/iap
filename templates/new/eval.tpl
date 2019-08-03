<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Evaluaciones
        </div>
        <div class="actions">
		<!--
			<a class="btn red" href="#" title="IMPRIMIR" onClick="onImprimirVal('{$mId}','admin')">
			Imprimir
			</a>
			-->
        </div>
    </div>
	
    <div class="portlet-body" style='text-align:justify'>
	
		
		<br>
		<br>
        <div id="tblContentActa">
		
			
				
						<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
							<thead>
								<tr>
									
									<th style="text-align:center"><b>Alumno</b></th>
									<th style="text-align:center"><b>Evaluacion </b></th>	 
								</tr>
							</thead>
							<tbody>
								{foreach from=$ls item=subject}
								<tr>
									
									<td align="center">{$subject.lastNamePaterno|upper} {$subject.lastNameMaterno|upper} {$subject.names|upper} </td>
									<td align="center">{if $subject.eval >= 1}<font color="green"> Contestada </font>{else}<font color="red"> No Contestada</font>{/if}</td>
									
								</tr>
								{/foreach}
							</tbody>
						</table>
				
           
		   
        </div>
    </div>
</div>
