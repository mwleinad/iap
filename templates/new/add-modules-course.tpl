<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="far fa-window-restore"></i> Modulos del Curso
    </div>
    <div class="card-body">
        {if $noModules == 1}
            <div class="alert alert-danger text-center" role="alert">No hay más módulos para agregar.</div>
        {else}
            {include file="{$DOC_ROOT}/templates/forms/new/add-modules-course.tpl"}
        {/if}
    </div>
</div>