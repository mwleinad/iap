{foreach from=$students item=item key=key}
    <tr class="text-center">
		<td>{$item.lastNamePaterno|upper}</td>
        <td>{$item.lastNameMaterno|upper}</td>
        <td>{$item.names|upper}</td>
        <td>{$item.controlNumber}</td>
        <td>
			{if $tipo eq 'matricula'}
				<input type="text" name="students[{$item.userId}]" id="students[{$item.userId}]" value="{$item.matricula}" class="form-control">
			{else}
				<input type="text" name="num_{$item.userId}" id="num_{$item.userId}" value="{$item.referenciaBancaria}" class="form-control">
			{/if}
		</td>    
    </tr>
{foreachelse}
	<tr>
    	<td colspan="5" class="text-center">No se encontró ningún registro.</td>
    </tr>				
{/foreach}
