<input type="hidden" value="0" id="recarga" name="recarga">
{foreach from=$subjects item=subject}
	{if $item.subjectId eq $subject.subjectId}
		<tr>
			{if $User.type ne 'Docente'}
				<td class="id text-center">{$subject.courseId}</td>
			{/if}			
			<td class="text-center">{$subject.clave}</td>
			<td class="text-center">{$subject.majorName}</td>
			<td class="text-center break-line">{$subject.name}</td>
			<td class="text-center">{$subject.group}</td>
			<td class="text-center">{if $subject.modality eq 'Local'}Presencial{else}{$subject.modality}{/if}</td>
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
				{if !$docente}  {$subject.courseModule} {/if}
				{/if}
					{if !$docente}  /{$subject.modules} {/if}
				{*} Flecha verde {*}
				<br>
				{if ($docente == 1 AND $subject.courseModuleActive > 0) || !$docente}
					<a href="{$WEB_ROOT}/graybox.php?page=view-modules-course&id={$subject.courseId}" title="Ver Modulos de Curso" data-target="#ajax" data-toggle="modal" >
						<i class="far fa-window-restore text-info fa-lg"></i>
					</a>
				{/if}
				{if !$docente}
					<a href="{$WEB_ROOT}/graybox.php?page=add-modules-course&id={$subject.courseId}" title="Agregar Modulo a Curso" data-target="#ajax" data-toggle="modal" style="color:#000" >
						<i class="fas fa-plus-circle text-dark fa-lg"></i>
					</a>
				{/if} 
			</td>
			<td class="text-center">
				{if !$docente}
					<span class="pointer spanActive badge badge-success rounded-circle" onclick="VerGrupoAdmin({$subject.courseId});" title="Alumnos" id="{$subject.courseId}">{$subject.alumnActive}</span>             /
					<span class="pointer spanInactive badge badge-danger rounded-circle" onclick="VerGrupoInactivoAdmin({$subject.courseId});"  id="{$subject.courseId}">{$subject.alumnInactive}</span>
				{else}
					<span class="badge badge-success rounded-circle">{$subject.alumnActive}</span> / <span class="badge badge-danger rounded-circle">{$subject.alumnInactive}</span>
				{/if}
			</td>
			<td class="text-center">{$subject.active}</td>
			{if !$docente}
				<td class="text-center">
					<div class="dropdown">
						<button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="far fa-list-alt"></i>
						</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							{if $subject.majorName=="ESPECIALIDAD" || $subject.majorName=="MAESTRIA"}
								<a class="dropdown-item spanActive" href="#" onclick="VerGrupo({$subject.courseId},'matricula');" title="Matrículas" id="{$subject.courseId}">
									<i class="fas fa-cog"></i> Matrículas
								</a>
							{/if}
							<a class="dropdown-item" href="{$WEB_ROOT}/graybox.php?page=edit-course&id={$subject.courseId}" data-target="#ajax" data-toggle="modal" title="Editar">
								<i class="fas fa-pen"></i> Editar
							</a>
							<a class="dropdown-item" href="{$WEB_ROOT}/graybox.php?page=ver-sabana-course&id={$subject.courseId}" data-target="#ajax" data-toggle="modal" title="Sabana de Calificaciones">
								<i class="fas fa-tasks"></i> Sabana de Calificaciones
							</a>
							<a class="dropdown-item" href="{$WEB_ROOT}/diplomas.php?id={$subject.courseId}" target="_blank" title="Diplomas">
								<i class="fas fa-clipboard-check"></i> Diplomas
							</a>
							<a class="dropdown-item" href="{$WEB_ROOT}/reporte.php?id={$subject.courseId}" target="_blank" title="Reportes">
								<i class="fas fa-chart-bar"></i> Reportes
							</a>
							<a class="dropdown-item pointer spanActive" onclick="VerGrupo({$subject.courseId});" title="Referencia Bancaria" id="{$subject.courseId}">
								<i class="fas fa-credit-card"></i> Referencia Bancaria
							</a>
							<a class="dropdown-item pointer spanActive" onclick="VerSolicitud({$subject.courseId});" title="CONSTANCIAS" id="{$subject.courseId}">
								<i class="fas fa-file-alt"></i> Constancias
							</a>
							<a class="dropdown-item pointer spanActive" onclick="editPeriodos({$subject.courseId});" title="PERIODOS" id="{$subject.courseId}">
								<i class="fas fa-calendar-alt"></i> Periodos
							</a>
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
