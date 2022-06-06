{foreach from=$theGroup item=item key=key}
	<tr id="1">
        <td class="text-center">{$item.controlNumber}</td>
		{if $cursos=="ESPECIALIDAD" || $cursos=="MAESTRIA"}
			<td class="text-center">{$item.matricula}</td>
		{/if}
        <td>
		{if $item.situation eq 'Recursador'} <small class="text-danger">[Recursador]</small> {/if} {$item.lastNamePaterno|upper} {$item.lastNameMaterno|upper} {$item.names|upper}
		</td>
        <td class="text-center">
        	{if !$item.equipo}
        		N/A
			{else}
           		{$item.equipo}
          	{/if}
    	</td>
    	{section name=foo loop=$totalActividades} 
			<td class="text-center">
				{if $item.score.{$smarty.section.foo.iteration - 1} > 0}
					{$item.score.{$smarty.section.foo.iteration - 1}}/{$item.realScore.{$smarty.section.foo.iteration - 1}}%
				{else}
					No. Cal 
				{/if}
			</td> 
		{/section}
        <td class="text-center">
			{if $isEnglish eq true}
				{if floatval($item.addepUp) ge floatval($minCal)}
					Aprobado
				{else}
					No Aprobado
				{/if}
			{else}
				{$item.addepUp}%
			{/if}
		</td>
    </tr>
{foreachelse}
	<tr><td colspan="4" class="text-center">No se encontró ningún registro.</td></tr>
{/foreach}