<div class="modal-header">
    El alumno cuenta con 2 o más currículas activas actualmente, seleccione la ficha de registro:
</div>
<div class="modal-body text-center">
    {foreach from=$cursos item=item}
        <a class="btn btn-success mb-3" href="{$WEB_ROOT}/pdf/solicitudes.php?alumnoId={$item.alumnoId}&cursoId={$item.courseId}" target="_blank">
            {$item.majorName}-{$item.name}[{$item.group}]
        </a> 
    {/foreach}
</div>