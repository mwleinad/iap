{foreach from=$students item=item key=key}
    <tr class="text-center">
        <td>{$item.lastNamePaterno|upper}</td>
        <td>{$item.lastNameMaterno|upper}</td>
        <td>{$item.names|upper}</td>
        <td>{$item.controlNumber}</td>
        <td><a href="mailto:{$item.email}">{$item.email}</a></td>
        <td>{$item.password}</td>
        <td>
            {if $tip eq 'Inactivo'}
                <a href="javascript:;" onclick="EnableStudentCurricula({$item.alumnoId},{$courseId})" title="Activar Alumno de esta Curricula">
                    <i class="fas fa-undo fa-lg text-success"></i>
                </a>
            {else}
                <a href="javascript:;" onclick="DeleteStudentCurricula({$item.alumnoId},{$courseId})" title="Eliminar Alumno de esta Curricula">
                    <i class="fas fa-minus-circle fa-lg text-danger"></i>
                </a>    
            {/if}
        </td>
    </tr>
{foreachelse}
    <tr>
        <td colspan="7" class="text-center">No se encontró ningún registro.</td>
    </tr>
{/foreach}
