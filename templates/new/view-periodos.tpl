<div class="card mb-4">
    <div class="card-header bg-primary text-white">
		<i class="far fa-calendar-check"></i> Agregar Periodos
    </div>
    <div class="card-body">
        <div id="tblContent" class="table-responsive">
			<form id="frmGral">
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Cuat.</th>
							<th>Nombre</th>
							<th>Fecha Inicio</th>
							<th>Fecha Fin</th>
							<th>Periodo</th>
						</tr>
					</thead>
					<tbody>
						{foreach from=$subjects item=subject}
							<tr>
								<td class="text-center">{$subject.semesterId}</td>
								<td>{$subject.name}</td>
								<td>{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
								<td>{$subject.finalDate|date_format:"%d-%m-%Y"}</td>
								<td>
									<input type="text" name="periodo_{$subject.courseModuleId}" class="form-control" value="{$subject.periodo}">
								</td>
							</tr>
						{foreachelse}
							<tr>
								<td colspan="5" class="text-center">No se encontró ningún registro.</td>
							</tr>
						{/foreach}
					</tbody>
				</table>
			</form>
			<div class="col-md-12 text-center">
				<button onClick='savePeriodos()' class="btn btn-success submitForm">Solicitar</button>
			</div>
        </div>
    </div>
</div>