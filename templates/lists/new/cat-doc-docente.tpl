<table class="table table-bordered table-striped">
	<thead>
    	<tr> 
			<th>Documento</th>
			<th>Descripcion</th>
			<th></th>
		</tr>
    </thead>
    <tbody>
    	{foreach from=$registros item=subject}
			<tr class="text-center">
				<td>{$subject.nombre}</td>
				<td>{$subject.descripcion}</td>
				<td>
					<a href="{$WEB_ROOT}/graybox.php?page=add-docdocente&id={$subject.catalogodocumentoId}" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Enviar Comprobante De Pago">
						<i class="fas fa-paper-plane fa-lg"></i>
					</a>
					<a href="#" onClick="loadTR('{$subject.catalogodocumentoId}')" title="Subir Documento">
						<i class="fas fa-trash-alt fa-lg"></i>
					</a>
				</td>
			</tr>
		 {/foreach}
	</tbody>
</table>