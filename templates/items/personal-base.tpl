{foreach from=$personals item=item key=key}
    <tr>
        <td class="id text-center">{$item.personalId}</td>    
        <td>
            <a href="#">
				<img src="{$WEB_ROOT}/{$item.foto}" max-width="60px" class="img-fluid" />
			</a>
        </td>   
        <td class="break-line">{$item.lastname_paterno} {$item.lastname_materno} {$item.name}</td>
        <td class="text-center">{$item.position}</td>        
        <td class="text-center">
            <form name="{$item.personalId}" method="post" enctype="multipart/form-data">
                <input type="hidden" name="personalId" id="personalId" value="{$item.personalId}" />
                <input type="file" name="foto" id="foto" class="form-control mt-3" /><br>
                <input type="submit" value="Cambiar Foto" class="btn btn-success btn-sm mt-2" />
            </form>
        </td>
        <td class="break-line">{$item.wrappedDescription}</td>
        <td class="text-center">
            <i id="{$item.personalId}" class="fas fa-times-circle fa-2x text-danger pointer spanDelete" data-toggle="tooltip" data-placement="top" title="Eliminar"></i>
            <i id="{$item.personalId}" class="fas fa-pen-square fa-2x text-success pointer spanEdit" data-toggle="tooltip" data-placement="top" title="Editar"></i>
			{if $item.firmaConstancia eq 'si'}
			    {*<img src="images/pointer.png?sd"   title="FIRMA CONSTANCIAS" />*}
                <i class="fas fa-file-signature text-info fa-2x" data-toggle="tooltip" data-placement="top" title="Firma Constancias"></i>
			{/if}
        </td>
    </tr>
{foreachelse}
    <tr><td colspan="5" class="text-center">No se encontró ningún registro.</td></tr>				
{/foreach}
