<div class="card mb-4">
    <div class="card-header bg-primary text-white">
		<i class="fas fa-chart-line"></i> Valoración
        <a href="#" class="btn btn-info float-right" title="IMPRIMIR" onClick="onImprimirVal('{$mId}','admin')">
			<i class="fas fa-print"></i> Imprimir
        </a>
    </div>
    <div class="card-body">
		<h1 class="text-center">Avance {$lstPreguntas.totalAlumnos} / {$lstPreguntas.totalGrupo}</h1>
		<div class="table-responsive">
			<table class="table table-sm table-bordered table-striped">
				<tr>
					<td><b>(6)</b> Deficiente</td>
					<td><b>(7)</b> Apenas aceptable</td>
					<td><b>(8)</b> Aceptable</td>
					<td><b>(9)</b> Satisfactorio</td>
					<td><b>(10)</b> Muy Satisfactorio</td>
				</tr>
			</table>
		</div>

		<div id="tblContentActa" class="mt-4 border border-success rounded">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#results">Resultados</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#comments">Comentarios</a>
				</li>
			</ul>
			
			<div class="tab-content">
				<div class="tab-pane container active py-2" id="results">
					<div class="table-responsive">
						<table class="table table-sm table-bordered">
							<thead>
								<tr class="text-center">
									<th></th>
									<th><b>Rubro</b></th>
									<th><b>Promedio</b></th>	 
								</tr>
							</thead>
							<tbody>
								{foreach from=$lstPreguntas.result item=subject}
									<tr class="text-center">
										<td><a href="javascript:void(0)" onClick="verTr('{$subject.categoriapreguntaId}')">[+]</a></td>
										<td>{$subject.nombre}</td>
										<td>{$subject.promedio}</td>
									</tr>
									<tr style="display:none" id="tr_{$subject.categoriapreguntaId}">
										<td colspan="3">
											<table class="table table-sm table-bordered table-striped">
												<tr>
													<td><b>Pregunta</b></td>
													<td><b>Promedio</b></td>
												</tr>
												{foreach from=$subject.lstPreguntas item=item}
													<tr>
														<td>{$item.pregunta}</td>
														<td>{$item.totalPp}</td>
													</tr>
												{/foreach}
											</table>
										</td>
									</tr>
								{/foreach}
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane container fade py-2" id="comments">
					<div class="table-responsive">
						<table class="table table-sm table-bordered table-striped">
							<thead>
								<tr>
									<th class="text-center">Comentario </th>
								</tr>
							</thead>
							<tbody>
								{foreach from=$lstPreguntas.lstComentarios item=subject}
									<tr>
										<td class="text-center">{$subject.comentario}</td>
									</tr>
								{/foreach}
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
    </div>
</div>