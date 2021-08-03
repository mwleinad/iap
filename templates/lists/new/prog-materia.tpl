<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
    <thead>
		<tr class="text-center">
			<th>Clave</th>
			<th>Cuatrimestre</th>
			<th>Nombre materia</th>
			<th>Docente</th>
			<th>Vigencia</th>
			<th>Programa de la asignatura</th>
			<th>Carta Descriptiva</th>
			<th>Encuadre</th>
			<th>Rubrica</th>
			<th>Informe Final</th>
			<th>Acta de Calificaciones</th>
			<th>Acciones</th>
		</tr>
    </thead>
    <tbody>
		<input type="hidden" value="0" id="recarga" name="recarga" />
		{foreach from=$result item=subject}
			<tr class="text-center">
				<td>{$subject.clave}</td>
				<td>{$subject.semesterId}</td>
				<td>{$subject.name}</td>
				<td>{if $subject.nombrePersonal eq ''} Sin Asignar {else} {$subject.nombrePersonal} {/if}</td>
				<td>{$subject.initialDate} - {$subject.finalDate}</td>
				<td>
					{if $subject.rutaPlan eq ''}
						<a href="{$WEB_ROOT}/graybox.php?page=up-plan&id={$subject.courseId}&cmId={$subject.courseModuleId}" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Subir">
							<i class="fas fa-cloud-upload-alt fa-lg"></i>
						</a>
					{/if}
					{if $subject.rutaPlan  ne ''}
						<a href="{$WEB_ROOT}/materia/{$subject.rutaPlan}" target="_blank" title="Ver Plan de Estudios">
							<i class="fas fa-eye fa-lg"></i>
						</a>
						<a href="javascript:void(0)" onClick="onDelete('{$subject.courseModuleId}','{$subject.courseId}')" title="Eliminar Plan de Estudios">
							<i class="fas fa-trash-alt fa-lg"></i>
						</a>
					{/if}
				</td>
				<td>
					{if $subject.rutaCarta  ne ''}
						<a href="{$WEB_ROOT}/docentes/carta/{$subject.rutaCarta}" target="_blank" title="Carta Descriptiva">
							<i class="fas fa-book-reader fa-lg"></i>
						</a>
						<a href="javascript:void(0)" onClick="onDeleteCarta('{$subject.courseModuleId}','{$subject.courseId}')" title="Eliminar Carta Descriptiva">
							<i class="fas fa-trash-alt fa-lg"></i>
						</a>
					{else}
						<span class="badge badge-danger">S/I</span>
					{/if}
				</td>
				<td>
					{if $subject.rutaEncuadre  ne ''}
						<a href="{$WEB_ROOT}/docentes/encuadre/{$subject.rutaEncuadre}" target="_blank" title="Encuadre">
							<i class="fas fa-book-reader fa-lg"></i>
						</a>
						<a href="javascript:void(0)" onClick="onDeleteEncuadre('{$subject.courseModuleId}','{$subject.courseId}')" title="Eliminar Carta Descriptiva">
							<i class="fas fa-trash-alt fa-lg"></i>
						</a>
					{else}
						<span class="badge badge-danger">S/I</span>
					{/if}
					
				</td>
				<td>
					{if $subject.rutaRubrica  ne ''}
						<a href="{$WEB_ROOT}/docentes/rubrica/{$subject.rutaRubrica}" target="_blank" title="Rúbrica">
							<i class="fas fa-book-reader fa-lg"></i>
						</a>
						<a href="javascript:void(0)" onClick="onDeleteRubrica('{$subject.courseModuleId}','{$subject.courseId}')" title="Eliminar Carta Descriptiva">
							<i class="fas fa-trash-alt fa-lg"></i>
						</a>
					{else}
						<span class="badge badge-danger">S/I</span>
					{/if}
				</td>
				<td>
					{if $subject.rutaInforme  ne ''}
						<a href="{$WEB_ROOT}/docentes/informe/{$subject.rutaInforme}" target="_blank" title="Informe">
							<i class="fas fa-book-reader fa-lg"></i>
						</a>
						<a href="javascript:void(0)" onClick="onDeleteInforme('{$subject.courseModuleId}','{$subject.courseId}')"  title="Eliminar Informe">
							<i class="fas fa-trash-alt fa-lg"></i>
						</a>
					{else}
						<a href="{$WEB_ROOT}/graybox.php?page=informe&id={$subject.courseModuleId}&cmId={$subject.courseId}" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Subir">
							<i class="fas fa-cloud-upload-alt fa-lg"></i>
						</a>
						<span class="badge badge-danger">S/I</span>
					{/if}
					
				</td>
				<td>
					{if $subject.rutaActa ne ''}
						<a href="{$WEB_ROOT}/docentes/calificaciones/{$subject.rutaActa}" target="_blank"  title="Ver Acta de Calificaciones">
							<i class="fas fa-file-alt fa-lg"></i>
						</a>
					{else}
						<a href="{$WEB_ROOT}/graybox.php?page=up-acta&id={$subject.courseId}&cmId={$subject.courseModuleId}" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Subir">
							<i class="fas fa-cloud-upload-alt fa-lg"></i>
						</a>
						<span class="badge badge-danger">S/I</span>
					{/if}
				</td>
				<td>
					<a href="{$WEB_ROOT}/graybox.php?page=val&id={$subject.courseModuleId}" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Valoración">
						<i class="fas fa-chart-bar fa-lg"></i>
					</a>	
					<a href="{$WEB_ROOT}/graybox.php?page=eval&id={$subject.courseModuleId}" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Evaluaciones">
						<i class="fas fa-star fa-lg"></i>
					</a>
					<a href="{$WEB_ROOT}/graybox.php?page=down-contrato&id={$subject.courseModuleId}&personalId={$pId}" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Contratos">
						<i class="fas fa-file-contract fa-lg"></i>
					</a>
				</td>
			</tr>
		{foreachelse}
			<tr>
				<td colspan="12" class="text-center">No se encontró ningún registro.</td>
			</tr>
		{/foreach}
    </tbody>
</table>