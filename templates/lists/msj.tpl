<table class="table table-bordered table-striped">
	<thead>
    	<tr class="text-center">
			<th>Titulo</th>
			<th>Mensaje</th>	 
			<th>Fecha</th>	 
			<th>Acciones</th>	 
		</tr>
    </thead>
    <tbody>
		{foreach from=$personals item=subject}
			<tr>
				<td>{$subject.titulo}</td>
				<td>{$subject.mensaje}</td>
				<td>{$subject.fecha}</td>
				<td class="text-center">
					<a  href="{$WEB_ROOT}/graybox.php?page=add-msj&id={$subject.mensajeId}" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Subir Documento">				
						<i class="fas fa-search-plus fa-lg"></i>
					</a>
				</td>
			</tr>
		{/foreach}
	</tbody>
</table>