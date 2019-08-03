<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Editar información del módulo {$subject.name}
            {if $docente}
                | <a href="{$WEB_ROOT}/index_new.php?page=edit-modules-course&id={$courseId}" style="color:#000000">Regresar</a>
            {else}
                | <a href="{$WEB_ROOT}/index_new.php?page=subject" style="color:#000000">Regresar</a>
            {/if}
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body">
        {include file="forms/new/edit-module.tpl"}
    </div>
</div>