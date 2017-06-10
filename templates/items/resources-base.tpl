{foreach from=$resources item=subject}   
    <tr>
        <td align="center" class="id">{$subject.resourceId}</td>
        <td align="center">{$subject.name}</td>
        <td align="center">{$subject.description}</td>
        <td align="center">
			<!--<a href="{$WEB_ROOT}/download.php?file=resources/{$subject.path}">Ver Archivo</a>-->
			<a href="{$WEB_ROOT}/download.php?file={$subject.path}">Ver Archivo</a>
		</td>
        <td align="center">
        {if $page != "resources-modules-student"}
            <img src="{$WEB_ROOT}/images/icons/16/delete.png" class="spanDeleteResource" id="d-{$subject.resourceId}" name="d-{$subject.name}" title="Eliminar" />&nbsp;
				 <a style="color:#000000" href="{$WEB_ROOT}/edit-resource/id/{$subject.resourceId}" onclick="return parent.GB_show('Editar Recurso de Apoyo', this.href,650,700) ">
					<img src="{$WEB_ROOT}/images/icons/16/pencil.png" class="spanEdit" id="d-{$subject.subjectId}" name="d-{$subject.name}" title="Editar" />
				 </a>            
           {/if}
        </td>
    </tr>
{foreachelse}
	<tr>
    	<td colspan="12" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
	</tr>
{/foreach}
