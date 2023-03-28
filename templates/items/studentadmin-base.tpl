{foreach from=$students item=item key=key}
    <tr class="text-center">
        <td>{if $item.historial['revisar']} <i class="fa fa-exclamation-triangle text-danger" data-toggle="tooltip" data-placement="top" title="Existe un problema con el historial del alumno"></i> {/if} {$item.lastNamePaterno|upper}</td>
        <td>{$item.lastNameMaterno|upper}</td>
        <td>{$item.names|upper}</td>
        <td>{$item.controlNumber}</td>
        <td><a href="mailto:{$item.email}">{$item.email}</a></td>
        <td><a href="mailto:{$item.correo_institucional}">{$item.correo_institucional}</a></td>
        <td>{$item.password}</td>
        <td>
            {if $tip eq 'Inactivo'}
                <form class="form" action="{$WEB_ROOT}/ajax/new/studentCurricula.php" id="form_historial{$item.alumnoId}" method="post">
                    <input type="hidden" name="type" value="calificacionesBaja">
                    <input type="hidden" name="alumno" value="{$item.alumnoId}">
                    <input type="hidden" name="curso" value="{$courseId}">
                    <button type="submit" class="btn btn-link p-0">
                        <i class="fas fa-eye text-success"></i>
                    </button>
                </form>
                {* <a href="javascript:;" onclick="EnableStudentCurricula({$item.alumnoId},{$courseId})" title="Activar Alumno de esta Curricula">
                    <i class="fas fa-undo fa-lg text-success"></i>
                </a> *}
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