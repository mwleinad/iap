{foreach from=$personals item=item key=key}
        <tr>
        <td align="center" class="id">{$item.personalId}</td>       
        <td>{if $item.estatus eq "eliminado"} <strike>{/if}&nbsp;{$item.lastname_paterno} {$item.lastname_materno} {$item.nombrePersonal}{if $item.estatus eq "eliminado"} </strike>{/if}</td>
        <td align="center">{$item.correo}</td>        
        <td align="center">{$item.roleName}</td>        
        <td align="center">
		<a href="{$WEB_ROOT}/usuarios">
		{$item.numCandidatos}
		</a>
		</td>        
        <td>&nbsp;
		{if $item.foto eq ""}
				<img src="{$WEB_ROOT}/images/iap.jpg" style="max-width:40px">
		{else}
		
			
			<a href="{$WEB_ROOT}/graybox.php?page=ver-foto&id={$item.foto}" data-target="#ajax" data-toggle="modal">
			<img src="{$WEB_ROOT}/images/docente/fotografia/{$item.foto}?{$rand}" style="max-width:40px">
			</a>
		{/if}
		
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
			{if $item.roleName eq 'Evaluador' && $item.estatus ne "eliminado"}
			<img src="images/icons/cats.png"  class="spanAgregarCertificacion" id="{$item.personalId}" title="AGREGAR CERTIFICACION" />
			{/if}
        </td>
    </tr>
{foreachelse}
<tr><td colspan="5" align="center">No se encontr&oacute; ning&uacute;n registro.</td></tr>				
{/foreach}
