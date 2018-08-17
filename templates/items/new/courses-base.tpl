<input type="hidden" value="0" id="recarga" name="recarga">
{foreach from=$subjects item=subject}
    <tr>
        <td align="center" class="id">{$subject.courseId}</td>
        <td align="center">{$subject.clave}</td>
        <td align="center">{$subject.majorName}</td>
        <td align="center">{$subject.name}</td>
		 <td align="center">{$subject.group}</td>
        <td align="center">{if $subject.modality eq 'Local'}Presencial{else}{$subject.modality}{/if}</td>
        <td align="center">{if $subject.initialDate != "0000-00-00"} {$subject.initialDate|date_format:"%d-%m-%Y"}{else} S/F {/if}</td>
        <td align="center">{if $subject.finalDate != "0000-00-00"}  {$subject.finalDate|date_format:"%d-%m-%Y"}  {else} S/F  {/if}   </td>
       
        <td align="center">{$subject.active}</td>
        {if !$docente}
            <td align="center">
				<div class="btn-group">
					<a class="btn btn-primary" href="javascript:;" data-toggle="dropdown" aria-expanded="false">
					<i class="fa fa-list-alt"></i>
					<i class="fa fa-angle-down"></i>
					</a>
					<ul class="dropdown-menu">
					<li>
						{if $subject.majorName=="ESPECIALIDAD" || $subject.majorName=="MAESTRIA"}<!--
							<img src="{$WEB_ROOT}/images/engrane.png" onclick="generar({$subject.courseId},'{$subject.majorName}');" title="Generar Matriculas"  style="width:16px" />-->
							<!--<i class="fa fa-cog" aria-hidden="true" onclick="generar({$subject.courseId},'{$subject.majorName}');" title="MATRICULAS"></i>-->
							<a style="cursor:pointer" class="spanActive" onclick="VerGrupo({$subject.courseId},'matricula');" title="MATRICULAS" id="{$subject.courseId}">
							<i class="material-icons md-16">settings</i>
							Matriculas
							</a>  
							&nbsp;
						{/if}
						
					</li>
					<li>
						<a href="{$WEB_ROOT}/graybox.php?page=edit-course&id={$subject.courseId}" data-target="#ajax" data-toggle="modal"><!--
							<img src="{$WEB_ROOT}/images/pencil.png" class="spanEdit" id="d-{$subject.subjectId}" name="d-{$subject.name}" title="Editar" style="width:16px" />-->
							<i class="material-icons md-16">create</i>
							Editar
						</a>
					</li>
					<li>
						<a href="{$WEB_ROOT}/graybox.php?page=ver-sabana-course&id={$subject.courseId}" data-target="#ajax" data-toggle="modal" title="Sabana de Calificaciones">
							<!--<img src="{$WEB_ROOT}/images/cal.png" class="spanEdit" id="d-{$subject.subjectId}" name="d-{$subject.name}"  style="width:16px"  />
							--><i class="material-icons md-16">grade</i>
							Sabana de Calificaciones
						</a>
					</li>
					<li>
						<a href="{$WEB_ROOT}/diplomas.php?id={$subject.courseId}" target="_blank" >
							<i class="material-icons md-16">folder_special</i>
							Diplomas
							<!--<img src="{$WEB_ROOT}/images/cer.jpg" class="spanEdit" id="d-{$subject.subjectId}" name="d-{$subject.name}" title="Impresion de Diplomas"  style="width:16px" />
							-->
						</a>
					</li>
					<li>
						<a href="{$WEB_ROOT}/reporte.php?id={$subject.courseId}" target="_blank" >
							<i class="material-icons md-16">poll</i>
							Reportes
							<!--<img src="{$WEB_ROOT}/images/graf.png" class="spanEdit" id="d-{$subject.subjectId}" name="d-{$subject.name}" title="Reporte General" style="width:16px"  />
							-->
						</a>
					</li>
					<li>
							<a style="cursor:pointer" class="spanActive" onclick="VerGrupo({$subject.courseId});" title="Referencia Bancaria" id="{$subject.courseId}">
							<i class="material-icons md-16">payment</i>
							Referencia Bancaria
							</a> 
					</li>
					<li>
						<a style="cursor:pointer" class="spanActive" onclick="VerSolicitud({$subject.courseId});" title="CONSTANCIAS" id="{$subject.courseId}">
						<i class="material-icons md-16">description</i>
							Constancias
						</a>
					</li>
					<li>
						<a style="cursor:pointer" class="spanActive" onclick="editPeriodos({$subject.courseId});" title="PERIODOS" id="{$subject.courseId}">
						<i class="material-icons md-16">event</i>
						Periodos
						</a>  
					</li>
					</ul>
				</div> 	
				<div id="divAccion_{$subject.courseId}" >
					{*TODO este boton no funciona de cualquier manera asi que lo quite por lo pronto
					<img src="{$WEB_ROOT}/images/icons/16/delete.png" class="spanDelete" data-id="{$subject.courseId}" id="d-{$subject.courseId}" name="d-{$subject.name}" title="Eliminar" />&nbsp;
					*}
					{*TODO creo que seria mejor abrir un modal ancho*}
					{*TODO falta la parte de generar certificado*}
				</div>	
            </td>
        {/if}
    </tr>
    {foreachelse}
    <tr>
        <td colspan="12" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
    </tr>
{/foreach}
