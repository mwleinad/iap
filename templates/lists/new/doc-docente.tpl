<table class="table table-bordered table-striped">
	<thead>
    	<tr class="text-center">
			<th></th>	 
			<th>Documento</th>	 
			<th>Descripción</th>	 
			<th>Archivo</th>		 
			<th></th>		 
		</tr>
    </thead>
    <tbody>
    	{foreach from=$registros item=subject}
			<tr class="text-center">
				<td>
					{if $subject.existArchivo eq 'si'}
						<i class="fas fa-check-circle fa-lg text-success"></i>
					{else}
						<i class="fas fa-times-circle fa-lg text-danger"></i>
					{/if}
				</td>
				<td>{$subject.nombre}</td>
				<td>{$subject.descripcion}</td>
				<td>
					{if $subject.existArchivo eq 'si'}
						<a href="{$WEB_ROOT}/docentes/documentos/{$subject.ruta}" title="Descargar Documento" target="_blank">
							<i class="fas fa-file-download fa-lg"></i>
						</a>
					{/if}
				</td>
				<td>
					{if $cId ne 'admin'}
						{if $subject.existArchivo ne 'si'}
							<a href="{$WEB_ROOT}/graybox.php?page=add-docdocente&id={$subject.catalogodocumentoId}" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Subir Documento">
								<i class="fas fa-file-upload fa-lg"></i>
							</a>
						{else}
							<a href="javascript:void(0)" onClick="onDelete('{$subject.catalogodocumentoId}', '{$personalId}')"  title="Eliminar">
								<i class="fas fa-trash-alt fa-lg"></i>
							</a>
						{/if}					
					{else}
						{if $subject.existArchivo ne 'si'}
							<a href="#" onClick="loadTR('{$subject.catalogodocumentoId}')" title="Subir Documento">
								<i class="fas fa-file-upload fa-lg"></i>
							</a>
						{else}
							<a href="javascript:void(0)" onClick="onDeleteDoc('{$subject.catalogodocumentoId}', '{$personalId}')"  title="Eliminar">
								<i class="fas fa-trash-alt fa-lg"></i>
							</a>
						{/if}
					{/if}
				</td>
		 	</tr>
			{if $cId eq 'admin'}
				<tr class="text-center">
					<td colspan="5" id="tr_{$subject.catalogodocumentoId}" style="display:none">
						<form class="form-horizontal" id="frmDoc_{$subject.catalogodocumentoId}" method="post"> 
							<input type="hidden" id="cId" name="cId" value="admin" />
							<input type="hidden" id="type" name="type" value="adjuntarDocDocente" />
							<input type="hidden" name="personalId" value="{$personalId}" />
							<input type="hidden" id="solicitudId" name="catId" value="{$subject.catalogodocumentoId}" />
							<input type="file" name="comprobante" />
						</form>
						<progress id="progress_{$subject.catalogodocumentoId}" value="0" min="0" max="100"></progress>
						<div id="porcentaje_{$subject.catalogodocumentoId}">0%</div>
						<button class="btn btn-primary" id="addMajor" name="addMajor" onClick="enviarArchivo('{$subject.catalogodocumentoId}')">Guardar</button>
					</td>
				</tr>
			{/if}
		{/foreach}
	</tbody>
</table>