<table class="table table-bordered table-striped">
	<thead>
    	<tr class="text-center">
			<th>Documento</th>	 
			<th></th>		 
		</tr>
    </thead>
    <tbody>
    	{foreach from=$registros item=subject}
			<tr class="text-center">	
				<td>{$subject.nombre}</td>
				<td>
					<a href="{$WEB_ROOT}/docentes/repositorio/{$subject.ruta}" target="_blank" title="Descargar Repositorio">
						<i class="fas fa-cloud-download-alt fa-lg"></i>
					</a>
					{if !$docente}
						<a href="#" onClick="deleteRepositorio({$subject.repositorioId})" title="Eliminar Repositorio">
							<i class="fas fa-trash-alt fa-lg"></i>
						</a>
					{/if}
				</td>
			</tr>
		 {/foreach}
	</tbody>
</table>