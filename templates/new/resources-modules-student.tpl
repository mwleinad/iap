<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Recursos de apoyo {$myModule.name|truncate:65:"..."} 
        </div>

    </div>
    <div class="portlet-body">
        <div id="tblContent">
            {include file="boxes/status_no_ajax.tpl"}
            {include file="lists/new/resources.tpl"}
        </div>
    </div>
</div>