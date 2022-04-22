<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
	<thead>
    	<tr>
			<th class="font-weight-bold break-line">Documento</th>	 
			<th class="font-weight-bold break-line">Descripción</th>	 	 
			<th></th>		 
		</tr>
    </thead>
    <tbody>
    	{foreach from=$registros item=subject}
			<tr class="text-center">
				<td>{$subject.nombre}</td>
				<td>{$subject.descripcion}</td>
				<td>
					<a href="{$WEB_ROOT}/graybox.php?page=add-cat-doc-alumno-add&id={$subject.catdocumentoalumnoId}" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Editar Información" class="text-success">
						<i class="fas fa-edit fa-lg"></i>
					</a>
					<a  href="javascript:void(0)" onClick="onDelete('{$subject.catdocumentoalumnoId}'')" title="Eliminar Documento" class="text-danger">
						<i class="fas fa-trash-alt fa-lg"></i>
					</a>
				</td>
			</tr>
		 {/foreach}
	</tbody>
</table>