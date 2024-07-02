<input type="hidden" value="0" id="recarga" name="recarga">
{foreach from=$subjects item=subject}
	{if $item.subjectId eq $subject.subjectId}
		<tr>
			{if $User.type ne 'Docente'}
				<td class="id text-center">{$subject.courseId}</td>
			{/if}
			<td class="text-center">{($subject.modality == "Online") ? $subject.rvoeLinea : $subject.rvoe}</td>
			<td class="text-center">{$subject.majorName}</td>
			<td class="text-center break-line">{$subject.name}</td>
			<td class="text-center">{$subject.group}</td>
			<td class="text-center">{if $subject.modality eq 'Local'}Escolar
				{elseif $subject.modality eq 'Online'}No
				Escolar{else}Mixta
				{/if}</td>
			<td class="text-center">
				{if $subject.initialDate != "0000-00-00"}
					{$subject.initialDate|date_format:"%d-%m-%Y"}
				{else}
					S/F
				{/if}
			</td>
			<td class="text-center">
				{if $subject.finalDate != "0000-00-00"}
					{$subject.finalDate|date_format:"%d-%m-%Y"}
				{else}
					S/F
				{/if}
			</td>
			<td class="text-center">
				{if $docente == 1}
					{if !$docente} {$subject.courseModuleActive} {/if}
				{else}
					{if !$docente} {$subject.courseModule} {/if}
				{/if}
				{if !$docente} /{$subject.modules} {/if}
				{* Flecha verde *}
				<br>
				{if ($docente == 1 AND $subject.courseModuleActive > 0) || !$docente}
					<a href="{$WEB_ROOT}/graybox.php?page=view-modules-course&id={$subject.courseId}" title="Ver Modulos de Curso"
						data-target="#ajax" data-toggle="modal">
						<i class="far fa-window-restore text-info fa-lg"></i>
					</a>
				{/if}
				{if !$docente}
					<a href="{$WEB_ROOT}/graybox.php?page=add-modules-course&id={$subject.courseId}" title="Agregar Modulo a Curso"
						data-target="#ajax" data-toggle="modal" style="color:#000">
						<i class="fas fa-plus-circle text-dark fa-lg"></i>
					</a>
				{/if}
			</td>
			<td class="text-center">
				{if !$docente}
					<form class="form d-inline" action="{$WEB_ROOT}/ajax/new/studentCurricula.php" method="POST"
						id="activeStudent{$subject.courseId}">
						<input type="hidden" name="type" value="StudentAdmin">
						<input type="hidden" name="id" value="{$subject.courseId}">
						<input type="hidden" name="tip" value="Activo">
						<button type="submit" class="pointer spanActive badge badge-success rounded-circle" data-target="#ajax"
							data-toggle="modal" title="Alumnos Activos">{$subject.alumnActive}</button>
					</form>
					/
					<form class="form d-inline" action="{$WEB_ROOT}/ajax/new/studentCurricula.php" method="POST"
						id="inactiveStudent{$subject.courseId}">
						<input type="hidden" name="type" value="StudentInactivoAdmin">
						<input type="hidden" name="id" value="{$subject.courseId}">
						<input type="hidden" name="tip" value="Inactivo">
						<button type="submit" class="pointer spanInactive badge badge-danger rounded-circle" data-target="#ajax"
							data-toggle="modal" title="Alumnos Inactivos">{$subject.alumnInactive}</button>
					</form>
				{else}
					<span class="badge badge-success rounded-circle">{$subject.alumnActive}</span> / <span
						class="badge badge-danger rounded-circle">{$subject.alumnInactive}</span>
				{/if}
			</td>
			<td class="text-center">{$subject.active}</td>
			{if !$docente}
				<td class="text-center">
					<div class="dropdown">
						<button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">
							<i class="far fa-list-alt"></i>
						</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							{if $subject.majorName=="ESPECIALIDAD" || $subject.majorName=="MAESTRÍA" || $subject.majorName=="DOCTORADO"}
								<a class="dropdown-item spanActive" href="#" onclick="VerGrupo({$subject.courseId},'matricula');"
									title="Matrículas" id="{$subject.courseId}">
									<i class="fas fa-cog"></i> Matrículas
								</a>
							{/if}
							{if $User.userId != 253}
								<a class="dropdown-item" href="{$WEB_ROOT}/graybox.php?page=niveles-ingles&id={$subject.courseId}"
									data-target="#ajax" data-toggle="modal" title="Niveles de Inglés">
									<i class="far fa-check-square"></i> Niveles de Inglés
								</a>
								<a class="dropdown-item" href="{$WEB_ROOT}/graybox.php?page=titulacion&id={$subject.courseId}"
									data-target="#ajax" data-toggle="modal" title="Títulos">
									<i class="fas fa-file-signature"></i> Títulos
								</a>
								<a class="dropdown-item" href="{$WEB_ROOT}/graybox.php?page=indicadores&id={$subject.courseId}"
									data-target="#ajax" data-toggle="modal" title="Indicadores">
									<i class="fas fa-chart-pie"></i> Indicadores
								</a>
								<a class="dropdown-item" href="{$WEB_ROOT}/graybox.php?page=edit-course&id={$subject.courseId}"
									data-target="#ajax" data-toggle="modal" title="Editar">
									<i class="fas fa-pen"></i> Editar
								</a>
								{* Boleta de Calificaciones *}
								<a class="dropdown-item"
									href="{$WEB_ROOT}/graybox.php?page=qualifications-course&id={$subject.courseId}" data-target="#ajax"
									data-toggle="modal" title="Boleta de Calificaciones">
									<i class="fas fa-file-signature"></i> Boleta de Calificaciones
								</a>
								{* Sabana de Calificaciones *}
								<a class="dropdown-item" href="{$WEB_ROOT}/graybox.php?page=ver-sabana-course&id={$subject.courseId}"
									data-target="#ajax" data-toggle="modal" title="Sabana de Calificaciones">
									<i class="fas fa-tasks"></i> Sabana de Calificaciones
								</a>
								{* Certificados *}
								<a class="dropdown-item" href="{$WEB_ROOT}/graybox.php?page=certificates-course&id={$subject.courseId}"
									data-target="#ajax" data-toggle="modal" title="Certificados">
									<i class="fas fa-certificate"></i> Certificados
								</a>
								{* Acta de Examen *}
								<a class="dropdown-item" href="{$WEB_ROOT}/graybox.php?page=acta-examen-course&id={$subject.courseId}"
									data-target="#ajax" data-toggle="modal" title="Acta de Examen">
									<i class="fas fa-file-contract"></i> Acta de Examen
								</a>
								<a class="dropdown-item" href="{$WEB_ROOT}/graybox.php?page=constancias&id={$subject.courseId}"
									data-target="#ajax" data-toggle="modal" title="Constancias" data-width="1100px">
									<i class="fas fa-certificate"></i> Constancias
								</a>
								<a class="dropdown-item"
									href="{$WEB_ROOT}/graybox.php?page=constancia-sencilla-course&id={$subject.courseId}"
									data-target="#ajax" data-toggle="modal" title="Constancia Sencilla">
									<i class="fas fa-file-alt"></i> Constancia Sencilla
								</a>
								<a class="dropdown-item"
									href="{$WEB_ROOT}/graybox.php?page=constancia-calificaciones-course&id={$subject.courseId}"
									data-target="#ajax" data-toggle="modal" title="Constancia Sencilla">
									<i class="fas fa-file-alt"></i> Constancia del 50%
								</a>
								{if $subject.courseId == 162}
									<a class="dropdown-item" href="{$WEB_ROOT}/graybox.php?page=diplomas&id={$subject.courseId}"
										target="_blank" data-target="#ajax" data-toggle="modal" title="Diplomas">
										<i class="fas fa-clipboard-check"></i> Diplomas
									</a>
								{/if}
								<a class="dropdown-item" href="{$WEB_ROOT}/reporte.php?id={$subject.courseId}" target="_blank"
									title="Reportes">
									<i class="fas fa-chart-bar"></i> Reportes
								</a>
								<a class="dropdown-item pointer spanActive" onclick="VerGrupo({$subject.courseId});"
									title="Referencia Bancaria" id="{$subject.courseId}">
									<i class="fas fa-credit-card"></i> Referencia Bancaria
								</a>
								<a class="dropdown-item" href="{$WEB_ROOT}/graybox.php?page=periodos&id={$subject.courseId}"
									data-target="#ajax" data-toggle="modal" title="Periodos del curso">
									<i class="fas fa-calendar-alt"></i> Periodos de curso
								</a>
								<a class="dropdown-item pointer spanActive" onclick="editPeriodos({$subject.courseId});"
									title="PERIODOS" id="{$subject.courseId}">
									<i class="fas fa-calendar-alt"></i> Periodos de materias
								</a>
							{/if}
							{if in_array($User.userId,[1, 253])}
								<a class="dropdown-item" href="{$WEB_ROOT}/graybox.php?page=constancia-conocer&id={$subject.courseId}"
									data-target="#ajax" data-toggle="modal" title="Constancia">
									<i class="fas fa-certificate"></i> Constancia Evaluación
								</a>
							{/if}
							{if $User.userId == 1}
								<form id="form_calendario{$subject.courseId}" class="form dropdown-item pointer spanActive"
									action="{$WEB_ROOT}/ajax/new/conceptos.php" method="POST">
									<input type="hidden" name="opcion" value="conceptos-curso">
									<input type="hidden" name="curso" value="{$subject.courseId}">
									<button type="submit" class="border-0 bg-transparent p-0" data-target="#ajax" data-toggle="modal">
										<i class="fas fa-calendar-alt"></i> Calendario de Pagos
									</button>
								</form>
							{/if}
						</div>
					</div>
					<div id="divAccion_{$subject.courseId}"></div>
				</td>
			{/if}
		</tr>
	{/if}
{foreachelse}
	<tr>
		<td colspan="12" class="text-center">No se encontró ningún registro.</td>
	</tr>
{/foreach}