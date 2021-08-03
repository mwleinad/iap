{foreach from=$__institution item=item key=key}
	<tr class="text-center">
		<td>{$item.name}</td>
		<td class="break-line">{$item.name_long}</td>
		<td>{$item.identifier}</td>
		<td class="break-line">{$item.ubication}</td>
		<td class="break-line">{$item.ubication_long}</td>
		<td>{$item.phone}</td>
		<td>{$item.fax}</td>
		<td>
			<i class="fas fa-edit fa-lg text-success spanEdit pointer" id="{$item.institutionId}" title="Editar"></i>
		</td>
	</tr>
{/foreach}
