<div class="modal-header">
    El alumno cuenta con 2 o más pre-registros actualmente, seleccione la ficha de registro:
</div>
<div class="modal-body text-center">
    {foreach from=$cursos item=item}
        <a class="btn btn-success mb-3 btn-block" href="{$WEB_ROOT}/pdf/solicitudes.php?alumnoId={$id}&cursoId={$item.subjectId}&tipo={$item.tipo}" target="_blank">
            {$item.majorName} {$item.subjectName}
        </a> 
    {/foreach}
</div>