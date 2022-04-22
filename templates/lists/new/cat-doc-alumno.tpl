<table class="table table-bordered table-striped table-sm">
	<thead>
    	<tr class="text-center"> 
			<th class="font-weight-bold break-line">Documento</th>
			<th class="font-weight-bold break-line">Descripcion</th>
			<th></th>
		</tr>
    </thead>
    <tbody>
    	{foreach from=$registros item=subject}
			<tr class="text-center">
				<td>{$subject.nombre}</td>
				<td class="break-line">{$subject.descripcion}</td>
				<td>
					<a href="{$WEB_ROOT}/graybox.php?page=add-cat-doc-alumno-add&id={$subject.catdocumentoalumnoId}" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Editar Información" class="text-success">
						<i class="fas fa-edit fa-lg"></i>
					</a>
					<a href="#" onClick="onDelete('{$subject.catdocumentoalumnoId}')" title="Eliminar Documento" class="text-danger">
						<i class="fas fa-trash-alt fa-lg"></i>
					</a>
				</td>
			</tr>
		 {/foreach}
	</tbody>
</table>