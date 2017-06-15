{foreach from=$students item=item key=key}
        <tr>
        <td align="center" class="id">{$item.userId}</td>       
        <td align="center" class="id">{$item.foto}	
		
		
	    	<script src="http://www.iapchiapasenlinea.mx/javascript/util.js" type="text/javascript"></script>      
			<script>				new FancyZoom('foto-{$item.userId}', {ldelim}width:400, height:300{rdelim});		</script>
			

			</td>       
        
		
		<td align="center">{$item.lastNamePaterno}</td>
        <td align="center">{$item.lastNameMaterno}</td>
         <td align="center">{$item.names}</td>
        <td align="center">{$item.controlNumber}</td>
        <td align="left">
        <form name="{$item.userId}" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="userId" id="userId" value="{$item.userId}" />
        	<input type="file" name="foto" id="foto" /><br>
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
<div id="loader_{$item.userId}"> </div>
		         {if $item.activo ==1}
              <img src="{$WEB_ROOT}/images/icons/ok.png"  id="{$item.userId}" onclick="desactivar({$item.userId},{$item.activo});" title="Dar de Baja" />&nbsp;
          	     {else}
		      <img src="{$WEB_ROOT}/images/cancel.png"  id="{$item.userId}" title="Dar de Alta" onclick="activar({$item.userId},{$item.activo});" />
				 {/if}
			 <!--<a href="{$WEB_ROOT}/graybox.php?page=edit-student&id={$item.userId}" title="EDITAR" onclick="return parent.GB_show('Ver Curricula', this.href,650,700) " style="color:#000" >
			-->
			<a href="{$WEB_ROOT}/graybox.php?page=edit-student&id={$item.userId}&auxImagen=1" data-target="#ajax" data-toggle="modal" data-width="1000px">
			<img src="{$WEB_ROOT}/images/icons/16/pencil.png" class="spanEdit" id="{$item.userId}" title="Editar" />
			</a>
			<!--
		   <a href="{$WEB_ROOT}/student-curricula/id/{$item.userId}" title="Ver Curricula de Estudiante" onclick="return parent.GB_show('Ver Curricula', this.href,650,700) " style="color:#000" ><img src="{$WEB_ROOT}/images/icons/16/subject.gif" title="Ver Curricula Estudiante" /></a>            
			-->

			<a href="{$WEB_ROOT}/graybox.php?page=student-curricula&id={$item.userId}" data-target="#ajax" data-toggle="modal" data-width="1000px">
				<img src="{$WEB_ROOT}/images/icons/16/subject.gif" title="Ver Curricula Estudiante" />
			</a>            

		{/if}
        </td>       
    </tr>
{foreachelse}
	<tr>
    	<td colspan="11" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
    </tr>				
{/foreach}
