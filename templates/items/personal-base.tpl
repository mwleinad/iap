{foreach from=$personals item=item key=key}
        <tr>
        <td align="center" class="id">{$item.personalId}</td>       
        <td>{if $item.estatus eq "eliminado"} <strike>{/if}&nbsp;{$item.lastname_paterno} {$item.lastname_materno} {$item.name}{if $item.estatus eq "eliminado"} </strike>{/if}</td>
        <td align="center">{$item.position}</td>        
        <td>&nbsp;{$item.wrappedDescription}</td>
        <td align="center">           
          
          {if $item.estatus ne "eliminado"} 
		    <img src="images/icons/16/delete.png" class="spanDelete" id="{$item.personalId}" title="Eliminar" />&nbsp;
		  {else}
		<img src="images/icons/16/pencilss.png" class="spanEdit" id="{$item.personalId}" title="Editar" />
		 {/if}
		  
		  
		  <img src="images/icons/16/pencil.png" class="spanEdit" id="{$item.personalId}" title="Editar" />
		
			
			{if $item.firmaConstancia eq 'si'}
			<img src="images/pointer.png?sd"   title="FIRMA CONSTANCIAS" />
			{/if}
        </td>
    </tr>
{foreachelse}
<tr><td colspan="5" align="center">No se encontr&oacute; ning&uacute;n registro.</td></tr>				
{/foreach}
