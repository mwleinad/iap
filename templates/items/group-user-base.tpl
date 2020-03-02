{foreach from=$users item=item key=key}
        <tr id="1">
        <td align="center" class="id">{$item.groupId}</td>
        <td align="center">{$item.lastNamePaterno}</td>
        <td align="center">{$item.lastNameMaterno}</td>
         <td align="center">{$item.names}</td>
        <td align="center">{$item.controlNumber}</td>
        <td align="center">{$item.semester}</td>             
        <td align="center">{$item.group}</td>
        <td align="center">{$item.average}</td>       
        <td class="act">&nbsp;
           
        </td>
    </tr>
{foreachelse}
	<tr><td colspan="9" align="center">No se encontró ningún registro.</td></tr>
{/foreach}