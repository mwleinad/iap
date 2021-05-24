<table class="table table-bordered table-striped">
	<thead>
    	<tr class="text-center">
			<th>Nombre</th>
			<th>Correo</th>
			<th>Celular</th>
			<th>Acciones</th>		 
		</tr>
    </thead>
    <tbody>
		{foreach from=$personals item=subject}
			<tr>
				<td>{$subject.lastname_paterno|upper} {$subject.lastname_materno|upper} {$subject.name|upper}</td>
				<td><a href="mailto:{$subject.correo}">{$subject.correo}</a></td>
				<td>{$subject.celular}</td>
				<td class="text-center">
					<a href="{$WEB_ROOT}/graybox.php?page=info-docente&id={$subject.personalId}&cId=si" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Información">
						<i class="fas fa-info-circle fa-lg"></i>
					</a>
					<a href="{$WEB_ROOT}/graybox.php?page=doc-docente&id={$subject.personalId}&cId=admin" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Documentos">
						<i class="fas fa-folder-open fa-lg"></i>
					</a>
					<a href="{$WEB_ROOT}/materias&id={$subject.personalId}" title="Materias">
						<i class="fas fa-book fa-lg"></i>
					</a>
					{*<a  href="javascript:void(0)" onClick="descargarAutoPdf('{$subject.personalId}')" target="_blank" title="Automovil">
						<i class="fas fa-car fa-lg"></i>
					</a>
					<a href="{$WEB_ROOT}/graybox.php?page=val&personalId={$subject.personalId}" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Valoración">
						<i class="fas fa-chart-bar fa-lg"></i>
					</a>*}	
					<a  href="javascript:void(0)" onClick="onDelete('{$subject.personalId}')"  title="Eliminar">
						<i class="fas fa-trash-alt fa-lg"></i>
					</a>	
				</td>
			</tr>
		{/foreach}
	</tbody>
</table>