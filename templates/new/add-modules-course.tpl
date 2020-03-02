<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Modulos del Curso
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body">
        {if $noModules == 1}
            <div style="text-align:center">No hay mas modulos para agregar.</div>
        {else}
            {include file="{$DOC_ROOT}/templates/forms/new/add-modules-course.tpl"}
        {/if}
    </div>
</div>