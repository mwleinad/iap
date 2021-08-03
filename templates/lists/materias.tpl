<table class="table table-bordered table-striped">
	<thead>
    	<tr class="text-center">	
			<th>Materia</th>
			<th>Estatus</th>
			<th>Posgrado</th>
			<th>Grupo</th>
			<th>Modalidad</th>
			<th>Fecha Materia</th>
			<th>Fecha Contrato</th>
			<th>Desglose</th>
			<th>No. de Contrato</th>	 
			<th></th>	 
		</tr>
    </thead>
    <tbody>
		{foreach from=$registros item=subject}
    		<tr  class="text-center">
				<td>{$subject.name}</td>
				<td>{$subject.estatusFin}</td>
				<td>{$subject.nameCar}</td>
				<td>{$subject.group9}</td>
				<td>{$subject.modality}</td>
				<td>{if $subject.modality eq 'Online'} {$subject.initialDate} - {$subject.finalDate} {else} {$subject.fechaMateria} {/if}</td>
				<td>{$subject.fechaContrato}</td>
				<td>
					{if $subject.totalPagar ne '0.00'}
						<table class="table table-sm">
							<tr>
								<td><b>Importe:</b></td>
								<td>$ {$subject.importe}</td>
							</tr>
							<tr>
								<td><b>IVA:</b></td>
								<td>$ {$subject.iva}</td>
							</tr>
							<tr>
								<td><b>Subtotal:</b></td>
								<td><b>$  {$subject.subtotal|number_format:2:'.':','}</b></td>
							</tr>
							<tr>
								<td><b>ISR:</b></td>
								<td>$ {$subject.isr}</td>
							</tr>
							<tr>
								<td><b>RET. IVA:</b></td>
								<td>$ {$subject.retIva}</td>
							</tr>
							<tr>
								<td><b>Total a Pagar: </b></td>
								<td><b>${$subject.totalPagar}</b></td>
							</tr>
						</table>
					{/if}
				</td>
				<td>{$subject.noContrato}</td>
				<td>
					<a href="{$WEB_ROOT}/graybox.php?page=val&id={$subject.courseModuleId}" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Valoración">
						<i class="fas fa-chart-bar fa-lg"></i>
					</a>	
					<a href="{$WEB_ROOT}/graybox.php?page=eval&id={$subject.courseModuleId}" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Evaluaciones">
						<i class="fas fa-star fa-lg"></i>
					</a>
					<a href="{$WEB_ROOT}/graybox.php?page=editar-contra&id={$subject.courseModuleId}&personalId={$pId}" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Editar Información">
						<i class="fas fa-edit fa-lg"></i>
					</a>
					<a href="{$WEB_ROOT}/graybox.php?page=cedula-contra&id={$subject.courseModuleId}&personalId={$pId}" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Cédula Contrato">
						<i class="fas fa-id-card fa-lg"></i>
					</a>
					<a href="{$WEB_ROOT}/graybox.php?page=down-contrato&id={$subject.courseModuleId}&personalId={$pId}" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Contratos">
						<i class="fas fa-file-contract fa-lg"></i>
					</a>
				</td>
			</tr>
		{/foreach}
	</tbody>
</table>