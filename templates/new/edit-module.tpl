<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-edit"></i> Editar información del módulo {$subject.name}
        {if $docente}
            <a href="{$WEB_ROOT}/index_new.php?page=edit-modules-course&id={$courseId}" class="btn btn-info btn-sm float-right">
                Regresar
            </a>
        {else}
            <a href="{$WEB_ROOT}/index_new.php?page=subject" class="btn btn-info btn-sm float-right">
                Regresar
            </a>
        {/if}
    </div>
    <div class="card-body" style="max-height: 700px; overflow: scroll;">
        {include file="forms/new/edit-module.tpl"}
    </div>
</div>