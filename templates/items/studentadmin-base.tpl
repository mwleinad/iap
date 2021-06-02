{foreach from=$students item=item key=key}
    <tr class="text-center">
        <td>{$item.lastNamePaterno|upper}</td>
        <td>{$item.lastNameMaterno|upper}</td>
        <td>{$item.names|upper}</td>
        <td>{$item.controlNumber}</td>
        <td><a href="mailto:{$item.email}">{$item.email}</a></td>
        <td>{$item.password}</td>
        <td>
            <a href="#" onclick="DeleteStudentCurricula({$item.userId},{$courseId});" title="Eliminar Alumno de esta Curricula">
                <i class="fas fa-minus-circle fa-lg text-danger"></i>
            </a>
        </td>
    </tr>
{foreachelse}
    <tr>
        <td colspan="7" class="text-center">No se encontró ningún registro.</td>
    </tr>
{/foreach}
