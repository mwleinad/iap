{foreach from=$teams item=item key=key}
    <tr id="1">
        <td class="text-center">{$item.teamNumber}</td>
        <td class="text-center">{$item.controlNumber}</td>
        <td>{$item.lastNamePaterno} {$item.lastNameMaterno} {$item.names}</td>
        <td class="text-center">
            <form class="form" action="{$WEB_ROOT}/config-teams/id/{$id}" id="form_{$item.userId}">
                <input type="hidden" name="opcion" value="eliminar-de-equipo">
                <input type="hidden" name="alumno" value="{$item.userId}"> 
                <button class="btn btn-danger btn-xs" type="submit">
                    <i class="fas fa-users-slash"></i>Eliminar del equipo
                </button>
            </form> 
            
        </td>
    </tr>
{foreachelse}
	<tr>
        <td colspan="4" class="text-center">
            No se encontró ningún registro.
        </td>
    </tr>
{/foreach}