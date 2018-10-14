{foreach from=$personals item=item key=key}
        <tr>
        <td align="center" class="id">{$item.personalId}</td>       
        <td>{if $item.estatus eq "eliminado"} <strike>{/if}&nbsp;{$item.lastname_paterno} {$item.lastname_materno} {$item.name}{if $item.estatus eq "eliminado"} </strike>{/if}</td>
        <td align="center">{$item.correo}</td>        
        <td align="center">{$item.roleName}</td>        
        <td>&nbsp;
		<img src="{$WEB_ROOT}/images/docente/fotografia/{$item.foto}" style="max-width:40px">
		</td>
        <td align="center">           
			{if $item.estatus ne "eliminado"} 
			<img src="images/icons/16/delete.png" class="spanDelete" id="{$item.personalId}" title="ELIMINAR" />&nbsp;
			{else}
			<img src="images/icons/ok.png" class="spanActivo" id="{$item.personalId}" title="ACTIVAR" />
			{/if}


			<img src="images/icons/16/pencil.png" class="spanEdit" id="{$item.personalId}" title="EDITAR" />


			{if $item.firmaConstancia eq 'si'}
			<img src="images/pointer.png?sd"   title="FIRMA CONSTANCIAS" />
			{/if}
			{if $item.roleName eq 'Evaluador'}
			<img src="images/icons/cats.png"  class="spanAgregarCertificacion" id="{$item.personalId}" title="AGREGAR CERTIFICACION" />
			{/if}
        </td>
    </tr>
{foreachelse}
<tr><td colspan="5" align="center">No se encontr&oacute; ning&uacute;n registro.</td></tr>				
{/foreach}
