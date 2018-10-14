{foreach from=$roles item=item key=key}
        <tr>
        <td align="center" class="id">{$item.roleId}</td>
        <td align="center">{if $item.estatus eq "eliminado"} <strike> {/if}{$item.clave}{if $item.estatus eq "eliminado"} </strike> {/if}</td>       
        <td align="center">{if $item.estatus eq "eliminado"} <strike> {/if}{$item.name}{if $item.estatus eq "eliminado"} </strike> {/if}</td>        
        <td id="etitl1">{if $item.estatus eq "eliminado"} <strike> {/if}&nbsp;{$item.wrappedDescription}{if $item.estatus eq "eliminado"} </strike> {/if}</td>        
        <td align="center">                        
           &nbsp;
          	<img src="images/icons/16/pencil.png" class="spanEdit" id="{$item.roleId}" title="Editar" />
			
			  {if $item.estatus ne "eliminado"} 
			   <img src="images/icons/16/delete.png" class="spanDelete" id="{$item.roleId}" title="Eliminar" />
			  {else}
			   <img src="images/icons/ok.png" class="spanActivar" id="{$item.roleId}" title="ACTIVAR" />
			  {/if}
        </td>
    </tr>
{foreachelse}
<tr><td colspan="5" align="center">No se encontró ningún registro.</td></tr>				
{/foreach}
