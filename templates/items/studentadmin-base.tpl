{foreach from=$students item=item key=key}
    <tr>
        <!--  <td align="center" class="id">{$item.userId}</td>
        <td align="center" class="id">{$item.foto}


	    	<script src="http://www.iapchiapasenlinea.mx/javascript/util.js" type="text/javascript"></script>
			<script>				new FancyZoom('foto-{$item.userId}', {ldelim}width:400, height:300{rdelim});		</script>
			</td> -->


        <td align="center">{$item.lastNamePaterno|upper}</td>
        <td align="center">{$item.lastNameMaterno|upper}</td>
        <td align="center">{$item.names|upper}</td>
        <td align="center">{$item.controlNumber}</td>
        <td align="center"><a href="mailto:{$item.email}">{$item.email}</a></td>
        <td align="center">{$item.password}</td>
        <td align="center"> <a href="#" onclick="DeleteStudentCurricula({$item.userId},{$courseId});" title="Eliminar Alumno de esta Curricula"> <img src="{$WEB_ROOT}/images/icons/16/delete.png"></a></td>

        <!--<td align="center">
        <form name="{$item.userId}" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="userId" id="userId" value="{$item.userId}" />
        	<input type="file" name="foto" id="foto" />
        	<input type="submit" value="Cambiar Foto" />
        </form>
        </td>
        <td align="center">
        {if $page == "course-student"}
					{if $status == "inactivo"}
                        	<a href="{$WEB_ROOT}/invoices/id/{$item.userId}/course/{$course}"><img src="http://trazzos.com/sie/admin/images/edit.gif" title="Realizar Pagos" /></a>
                    {else}
          	                <a href="{$WEB_ROOT}/student-actions/{$item.userId}/course/{$course}"><img src="http://trazzos.com/sie/admin/images/icons/browser.png" title="Acciones" /></a>
                    {/if}
        {else}
            <img src="{$WEB_ROOT}/images/icons/16/delete.png" class="spanDelete" id="{$item.userId}" title="Eliminar" />&nbsp;
          	<img src="{$WEB_ROOT}/images/icons/16/pencil.png" class="spanEdit" id="{$item.userId}" title="Editar" />
		   <a href="{$WEB_ROOT}/student-curricula/id/{$item.userId}" title="Ver Curricula de Estudiante" onclick="return parent.GB_show('Ver Curricula', this.href,650,700) " style="color:#000" ><img src="{$WEB_ROOT}/images/icons/16/subject.gif" title="Ver Curricula Estudiante" /></a>
        {/if}
        </td>-->
    </tr>
    {foreachelse}
    <tr>
        <td colspan="11" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
    </tr>
{/foreach}
