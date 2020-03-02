<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Información</b> {$myModule.name|truncate:65:"..."} &raquo;
        </div>
        <div class="actions">

        </div>
    </div>
    <div class="portlet-body">
        {include file="boxes/status_no_ajax.tpl"}
        {include file="{$DOC_ROOT}/templates/boxes/new/module-information.tpl"}
    </div>
</div>