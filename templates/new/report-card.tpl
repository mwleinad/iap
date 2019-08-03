<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Boleta de Calificaciones</b> {$myModule.name|truncate:65:"..."} &raquo;
        </div>
        <div class="actions">

        </div>
    </div>
    <div class="portlet-body">
        {include file="boxes/status_no_ajax.tpl"}
        {include file="{$DOC_ROOT}/templates/lists/new/report-card.tpl"}
    </div>
</div>