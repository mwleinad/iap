<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b></b> {$myModule.name|truncate:65:"..."} &raquo;
        </div>
        <div class="actions">

        </div>
    </div>
	{if $info.acuseDerecho eq "si"}
    <div class="portlet-body">
        {include file="boxes/status_no_ajax.tpl"}
        {include file="{$DOC_ROOT}/templates/lists/new/module-announcements.tpl"}
    </div>
	{else}
	  <div class="portlet-body">
        {include file="boxes/status_no_ajax.tpl"}
        {include file="{$DOC_ROOT}/templates/lists/new/acuse.tpl"}
    </div>
	{/if}
	
	
</div>