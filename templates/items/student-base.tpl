{foreach from=$students item=item key=key}
<tr class="text-center">
    <td class="id">{$item.userId}</td>       
    <td class="id">
		{if $item.photo ne ''}
			<a data-fancybox="p{$item.userId}" href="{$WEB_ROOT}/alumnos/{$item.photo}">
				<img src="{$WEB_ROOT}/alumnos/{$item.photo}" class="img-fluid" />
			</a>
		{/if}
	</td>       
    <td>{$item.lastNamePaterno|upper}</td>
    <td>{$item.lastNameMaterno|upper}</td>
    <td>{$item.names|upper}</td>
    <td>{$item.controlNumber}</td>
    <td>
        <form name="{$item.userId}" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="userId" id="userId" value="{$item.userId}" />
        	<input type="file" name="foto" id="foto" class="form-control mt-3" /><br>
        	<input type="submit" value="Cambiar Foto" class="btn btn-success btn-sm mt-2" />
        </form>
    </td>
    <td>   
        {if $page == "course-student"}
			{if $status == "inactivo"}
                <a href="{$WEB_ROOT}/invoices/id/{$item.userId}/course/{$course}"><img src="http://trazzos.com/sie/admin/images/edit.gif" title="Realizar Pagos" /></a>
            {else}  
          	    <a href="{$WEB_ROOT}/student-actions/{$item.userId}/course/{$course}"><img src="http://trazzos.com/sie/admin/images/icons/browser.png" title="Acciones" /></a>
            {/if}		        
        {else} 
		<div id="loader_{$item.userId}"></div>
			{if $item.activo ==1}
				<i class="fas fa-check-circle fa-2x text-success pointer" id="{$item.userId}" onclick="desactivar({$item.userId},{$item.activo});" data-toggle="tooltip" data-placement="top" title="Dar de Baja"></i>
			{else}
				<i class="fas fa-times-circle fa-2x text-danger pointer" id="{$item.userId}" data-toggle="tooltip" data-placement="top" title="Dar de Alta" onclick="activar({$item.userId},{$item.activo});"></i>
			{/if}
			<a href="{$WEB_ROOT}/graybox.php?page=edit-student&id={$item.userId}&auxImagen=1" data-target="#ajax" data-toggle="modal" data-width="1000px">
				<i class="fas fa-pen-square fa-2x pointer spanEdit" id="{$item.userId}" data-toggle="tooltip" data-placement="top" title="Editar"></i>
			</a>
			<a href="{$WEB_ROOT}/graybox.php?page=student-curricula&id={$item.userId}&auxTpl=1" data-target="#ajax" data-toggle="modal" data-width="1000px">
				<i class="fas fa-book fa-2x text-dark pointer" data-toggle="tooltip" data-placement="top" title="Ver Curricula Estudiante"></i>
			</a>   
			<a href="{$WEB_ROOT}/files/solicitudes/{$item.userId}_{$item.courseId}.pdf" target="_blank">
				<i class="fas fa-file-export fa-2x text-info pointer" data-toggle="tooltip" data-placement="top" title="Ficha de Registro"></i>
			</a>
			{if $item.hasRGP > 0}
				<a href="{$WEB_ROOT}/ajax/acuse_rgp.php?u={$item.userId}" target="_blank">
					<i class="fas fa-file-pdf fa-2x text-danger pointer" data-toggle="tooltip" data-placement="top" title="Acuse de Recibo del Reglamento General de Posgrado"></i>
				</a>      
			{/if}
		{/if}
    </td>       
</tr>
{foreachelse}
	<tr>
    	<td colspan="11">No se encontró ningún registro.</td>
    </tr>				
{/foreach}
