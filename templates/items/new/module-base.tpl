{foreach from=$subjects item=subject}
    <tr>
        <td class="id text-center">{$subject.subjectModuleId}</td>
        <td class="text-center">{$subject.clave}</td>
        <td class="text-center">{$subject.semesterId}</td>
        <td>{$subject.name}</td>
        <td class="text-center">
            <a href="{$WEB_ROOT}/index_new.php?page=subject&delete={$subject.subjectModuleId}"
                onclick="return confirmationDelete(event)">
                <i class="fas fa-times-circle fa-2x text-danger spanModuleDelete" id="{$subject.subjectId}"
                    name="{$subject.name}" data-toggle="tooltip" data-placement="top" title="Eliminar"></i>
            </a>
            <a href="{$WEB_ROOT}/graybox.php?page=edit-module&id={$subject.subjectModuleId}{if $urlBack}&urlBack={$urlBack}{/if}" data-target="#ajax"
                data-toggle="modal" onclick="CloseFview()">
                <i class="fas fa-pen-square fa-2x text-success spanEdit" id="{$subject.subjectId}" name="{$subject.name}"
                    data-toggle="tooltip" data-placement="top" title="Editar"></i>
            </a>
        </td>
    </tr>
{foreachelse}
    <tr>
        <td colspan="5" class="text-center">No se encontró ningún registro.</td>
    </tr>
{/foreach}