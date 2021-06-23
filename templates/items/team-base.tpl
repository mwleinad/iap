{foreach from=$teams item=item key=key}
    <tr id="1">
        <td class="text-center">{$item.teamNumber}</td>
        <td class="text-center">{$item.controlNumber}</td>
        <td>{$item.lastNamePaterno} {$item.lastNameMaterno} {$item.names}</td>
        <td class="text-center">
            <a href="{$WEB_ROOT}/config-teams/id/{$id}/delete/{$item.teamNumber}" class="btn btn-danger btn-xs">
                <i class="fas fa-users-slash"></i> Desmantelar Equipo
            </a>
        </td>
    </tr>
{foreachelse}
	<tr>
        <td colspan="4" class="text-center">
            No se encontró ningún registro.
        </td>
    </tr>
{/foreach}