{foreach from=$students item=item key=key}
<tr>
    <td class="id text-center">{$item.userId}</td>       
    <td class="id text-center">{$item.foto}</td>       
    <td class="text-center">{$item.lastNamePaterno|upper}</td>
    <td class="text-center">{$item.lastNameMaterno|upper}</td>
    <td class="text-center">{$item.names|upper}</td>
    <td class="text-center">{$item.controlNumber}</td>
    <td class="text-left">
        <form name="{$item.userId}" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="userId" id="userId" value="{$item.userId}" />
        	<input type="file" name="foto" id="foto" /><br>
        	<input type="submit" value="Cambiar Foto" />
        </form>
    </td>
    <td class="text-center">   
        {if $page == "course-student"}
			{if $status == "inactivo"}
                <a href="{$WEB_ROOT}/invoices/id/{$item.userId}/course/{$course}"><img src="http://trazzos.com/sie/admin/images/edit.gif" title="Realizar Pagos" /></a>
            {else}  
          	    <a href="{$WEB_ROOT}/student-actions/{$item.userId}/course/{$course}"><img src="http://trazzos.com/sie/admin/images/icons/browser.png" title="Acciones" /></a>
            {/if}		        
        {else} 
		<div id="loader_{$item.userId}"></div>
		{if $item.activo ==1}
            <img src="{$WEB_ROOT}/images/icons/ok.png"  id="{$item.userId}" onclick="desactivar({$item.userId},{$item.activo});" title="Dar de Baja" />&nbsp;
        {else}
		    <img src="{$WEB_ROOT}/images/cancel.png"  id="{$item.userId}" title="Dar de Alta" onclick="activar({$item.userId},{$item.activo});" />
		{/if}
			<a href="{$WEB_ROOT}/graybox.php?page=edit-student&id={$item.userId}&auxImagen=1" data-target="#ajax" data-toggle="modal" data-width="1000px">
				<img src="{$WEB_ROOT}/images/icons/16/pencil.png" class="spanEdit" id="{$item.userId}" title="Editar" />
			</a>
			<a href="{$WEB_ROOT}/graybox.php?page=student-curricula&id={$item.userId}&auxTpl=1" data-target="#ajax" data-toggle="modal" data-width="1000px">
				<img src="{$WEB_ROOT}/images/icons/16/subject.gif" title="Ver Curricula Estudiante" />
			</a>   
			<a href="{$WEB_ROOT}/files/solicitudes/{$item.userId}_{$item.courseId}.pdf" target="_blank">
				<img src="{$WEB_ROOT}/images/icons/16/document--arrow.png" title="Ficha de Registro" />
			</a>
			{if $item.hasRGP > 0}
				<a href="{$WEB_ROOT}/ajax/acuse_rgp.php?u={$item.userId}" target="_blank">
					<img src="{$WEB_ROOT}/images/icons/16/pdf.gif" title="Acuse de Recibo del Reglamento General de Posgrado" />
				</a>      
			{/if}
		{/if}
    </td>       
</tr>
{foreachelse}
	<tr>
    	<td colspan="11" class="text-center">No se encontró ningún registro.</td>
    </tr>				
{/foreach}
