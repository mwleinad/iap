<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Calificar Actividad
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body">
        {if $actividad.modality == "Individual"}
            <div id="tblContent">{include file="{$DOC_ROOT}/templates/lists/score.tpl"}</div>
        {else}
            <div id="tblContent">{include file="{$DOC_ROOT}/templates/lists/score-team.tpl"}</div>
        {/if}
    </div>
</div>




