{foreach from=$subjects item=subject}
    <tr>
        <td class="text-center">{$subject.subjectId}</td>
        <td class="text-center">{$subject.majorName}</td>
        <td class="text-center">{$subject.clave}</td>
        <td class="break-line">{$subject.name}</td>
        <td class="text-center">
			<a class="spanViewModule btn btn-dark btn-sm text-white" id="{$subject.subjectId}" name="{$subject.name}">
                {$subject.modules} <i class="fas fa-plus-circle"></i>
			</a>
        </td>
        <td>{$subject.payments}</td>
        <td>{$subject.cost}</td>
        <td class="text-center">
			<a class="btn btn-danger btn-sm text-white spanDelete" id="{$subject.subjectId}" name="{$subject.name}" title="Eliminar">
                <i class="fas fa-trash-alt"></i>
			</a>
           <a href="{$WEB_ROOT}/graybox.php?page=edit-subject&id={$subject.subjectId}" title="Editar Currícula" data-target="#ajax" data-toggle="modal" class="btn btn-info btn-sm text-white">
                <i class="fas fa-edit"></i>
            </a>
        </td>
    </tr>
{foreachelse}
    <tr>
        <td colspan="8" class="text-center">No se encontró ningún registro.</td>
    </tr>
{/foreach}
