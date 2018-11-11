<input type="hidden" value="0" id="recarga" name="recarga">
{foreach from=$subjects item=subject}
    <tr>
        <td align="center" class="id">{$subject.subjectId}</td>
        <td align="center">{$subject.majorName}</td>
        <td align="center">{$subject.name}</td>


        {if !$docente}
            <td align="center">
				
						<a href="{$WEB_ROOT}/graybox.php?page=edit-course&id={$subject.subjectId}" data-target="#ajax" data-toggle="modal">
							<i class="material-icons md-16">create</i>
						
						</a>
			
						<a href="{$WEB_ROOT}/configuracion-examen/courseId/{$subject.subjectId}" >
							<i class="material-icons md-16">grade</i>
					
						</a>
					<!--</li>
					
					</ul>
				</div> 	-->
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
