<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-user-plus"></i> Constancias
    </div>
    <div class="card-body">
        <div id="tblContent" class="table-responsive">
			<form id="frmGral" onsubmit="return false;" method="POST">
				<table class="table table-bordered table-striped">
					<thead>      
						<tr class="text-center">
							<th>Apellido Paterno</th>
							<th>Apellido Materno</th>
							<th>Nombre</th>
							<th>No. Control</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>
						{foreach from=$students item=item key=key}
							<tr class="text-center">
								<td>{$item.lastNamePaterno|upper}</td>
								<td>{$item.lastNameMaterno|upper}</td>
								<td>{$item.names|upper}</td>
								<td>{$item.controlNumber}</td>
								<td>
									<span class="spanActive pointer" onclick="descargarConstancias('{$item.userId}','1');" title="Constancia de estudios simple">
										<i class="fas fa-folder-open"></i>
									</span>
									<span class="spanActive pointer" onclick="descargarConstancias('{$item.userId}','2');" title="Constancia de terminacion con calificaciones">
										<i class="fas fa-folder-open"></i>
									</span>
									<span class="spanActive pointer" onclick="descargarConstancias('{$item.userId}','4');" title="Boletas de Calificaciones">
										<i class="fas fa-folder-open"></i>
									</span>
									<span class="spanActive pointer" onclick="descargarConstancias('{$item.userId}','6');" title="Constancia de terminacion sin calificaciones">
										<i class="fas fa-folder-open"></i>
									</span>
									<span class="spanActive pointer" onclick="descargarConstancias('{$item.userId}','7');" title="Constancia tramite de titulación">
										<i class="fas fa-folder-open"></i>
									</span>
									<div id='load_{$item.userId}'></div>
								</td>	  
							</tr>
							<tr id="tr_{$item.userId}" style="display:none" class="bg-secondary">
								<td id="td_{$item.userId}" colspan="5"></td>
							</tr>
						{foreachelse}
							<tr>
								<td colspan="5" class="text-center">No se encontró ningún registro.</td>
							</tr>				
						{/foreach}
					</tbody>
				</table>
			</form> 
        </div>
    </div>
</div>