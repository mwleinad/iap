{foreach from=$time item=item key=key}
        <tr id="1">
        <td align="center" class="id">{$item.hrStart} - {$item.hrEnd}</td>       
        <td height="30">
        	{$info[$itm.subgpoId][$item.schtimeId][1]['personal']}
            <br />{$info[$itm.subgpoId][$item.schtimeId][1]['salon']}
        </td>
        <td>
        	{$info[$itm.subgpoId][$item.schtimeId][2]['personal']}
            <br />{$info[$itm.subgpoId][$item.schtimeId][2]['salon']}
         </td>        
        <td>
        	{$info[$itm.subgpoId][$item.schtimeId][3]['personal']}
            <br />{$info[$itm.subgpoId][$item.schtimeId][3]['salon']}
         </td>
        <td>
        	{$info[$itm.subgpoId][$item.schtimeId][4]['personal']}
            <br />{$info[$itm.subgpoId][$item.schtimeId][4]['salon']}
         </td>
        <td>
        	{$info[$itm.subgpoId][$item.schtimeId][5]['personal']}
            <br />{$info[$itm.subgpoId][$item.schtimeId][5]['salon']}
         </td>
    </tr>
{foreachelse}
<tr><td colspan="6" align="center">No se encontró ningún registro.</td></tr>
{/foreach}
