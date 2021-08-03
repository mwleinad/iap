<div class="card mb-4">
    <div class="card-header bg-primary text-white">
		<i class="fas fa-star"></i> Evaluaciones
    </div>
    <div class="card-body">
		<div id="tblContentActa" class="table-responsive">		
			<table class="table table-bordered table-striped">
				<thead>
					<tr class="text-center">
						<th><b>Alumno</b></th>
						<th><b>Evaluacion</b></th>	 
					</tr>
				</thead>
				<tbody>
					{foreach from=$ls item=subject}
						<tr class="text-center">
							<td>{$subject.lastNamePaterno|upper} {$subject.lastNameMaterno|upper} {$subject.names|upper}</td>
							<td>
								{if $subject.eval >= 1}
									<span class="badge badge-success">Contestada</span>
								{else}
									<span class="badge badge-danger">No Contestada</span>
								{/if}
							</td>
						</tr>
					{/foreach}
				</tbody>
			</table>
		</div>
    </div>
</div>