<div class="card mb-4">
    <div class="card-header bg-info text-white">
        <i class="fas fa-redo"></i> Módulos Recursados
    </div>
    <div class="card-body">
		<div class="table-resposive">
			<table class="table table-hover table-bordered">
				<thead>
					<tr class="text-center">
						<th class="font-weight-bold">Módulo</th>
						<th class="font-weight-bold">Currícula</th>
						<th class="font-weight-bold">Grupo</th>
						<th class="font-weight-bold">Estatus</th>
						<th class="font-weight-bold">Calificación Acumulada</th>
						<th class="font-weight-bold">Calificación Final</th>
					</tr>
				</thead>
				<tbody>
					{foreach from=$modulesRepeat item=item}
                        <tr class="table-{if $item.status eq 'activo'}success{else if $item.status eq 'inactivo'}danger{else}info{/if}">
							<td>{$item.subjectModuleName}</td>
							<td>{$item.subjectName}</td>
							<td>{$item.group}</td>
							<td class="text-center text-capitalize">{$item.status}</td>
							<td></td>
							<td></td>
						</tr>
					{foreachelse}
						<tr>
							<td colspan="6" class="text-center">No se encontró ningún registro.</td>
						</tr>
					{/foreach}
				</tbody>
			</table>
		</div>
    </div>
</div>