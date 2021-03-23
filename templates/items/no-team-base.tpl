{foreach from=$noTeam item=item key=key}
    <tr id="1">
        <td class="text-center">{$item.controlNumber}</td>
        <td>{$item.lastNamePaterno} {$item.lastNameMaterno} {$item.names}</td>
        <td class="text-center">
            <input type="checkbox" name="inTeam[]" name="inTeam[]" value="{$item.alumnoId}" />
        </td>
    </tr>
{foreachelse}
	<tr>
        <td colspan="3" class="text-center">
            No se encontró ningún registro.
        </td>
    </tr>
{/foreach}
<tr>
    <td colspan="3" class="text-center">
        <input type="submit" name="Enviar" name="Enviar" value="Crear Equipo con Alumnos Seleccionados" class="btn btn-success" />
    </td>
</tr>
