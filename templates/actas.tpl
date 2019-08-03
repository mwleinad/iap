<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-user-plus "></i>
        </div>

    </div>
    <div class="portlet-body">
        <div id="tblContent">
			<div class="popupheader" style="z-index:70">
				<div class="ftitl">
				
               
		<form id="frmGral" onsubmit="return false;" method="POST">
			
			<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
			<thead>      
				  <tr>
						<th width="100">Apellido Paterno</th>
						<th width="100">Apellido Materno</th>
						<th width="150">Nombre</th>
						<th width="80">No. Control</th>
						<th width="20">Acciones</th>
					</tr>
			</thead>
			<tbody>
			   {foreach from=$students item=item key=key}
					<tr>
						<td align="center">{$item.lastNamePaterno|upper}</td>
						<td align="center">{$item.lastNameMaterno|upper}</td>
						 <td align="center">{$item.names|upper}</td>
						<td align="center">{$item.controlNumber}</td>
						<td align="center">
						
							<span style="cursor:pointer; " class="spanActive" onclick="descargarConstancias('{$item.userId}','1');" title="Constancia de estudios simple" >
							<i class="fa fa-folder-open" aria-hidden="true"></i>
							</span>
							<span style="cursor:pointer; " class="spanActive" onclick="descargarConstancias('{$item.userId}','2');" title="Constancia de terminacion con calificaciones" >
							<i class="fa fa-folder-open" aria-hidden="true"></i>
							</span>
							<span style="cursor:pointer" class="spanActive" onclick="descargarConstancias('{$item.userId}','4');" title="Boletas de Calificaciones" >
							<i class="fa fa-folder-open" aria-hidden="true"></i>
							</span>
							<span style="cursor:pointer" class="spanActive" onclick="descargarConstancias('{$item.userId}','6');" title="Constancia de terminacion sin calificaciones" >
							<i class="fa fa-folder-open" aria-hidden="true"></i>
							</span>
							<span style="cursor:pointer" class="spanActive" onclick="descargarConstancias('{$item.userId}','7');" title="Constancia tramite de titulación" >
							<i class="fa fa-folder-open" aria-hidden="true"></i>
							</span>
							<div id='load_{$item.userId}'></div>
						</td>	  
					</tr>
					<tr id="tr_{$item.userId}" style="display:none">
						<td id="td_{$item.userId}" colspan="5" style='background:#a1a1a142'>
							
						</td>
					</tr>
				{foreachelse}
					<tr>
						<td colspan="11" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
					</tr>				
				{/foreach}

			</tbody>
			</table>
			</form>
			
    </div>
    </div>
</div>
</div>
</div>