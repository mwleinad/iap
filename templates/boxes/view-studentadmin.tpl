<div class="card">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-users"></i> Ver Grupo {$tip}
        {if $tip eq "Inactivo"}
            <button type="button" id="btn-close" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
            </button>
        {/if}
    </div>
    <div class="card-body">
        <div id="tblContent" class="table-responsive">
        <div class="popupheader" style="z-index:70">
            <div class="ftitl">
                <div class="dgBox" id="draganddrop">
                    <div class="flabel" style="float:left">{$status|ucfirst}</div>
                </div>
            </div>
            {include file="{$DOC_ROOT}/templates/lists/studentadmin.tpl"}
        </div>
    </div>
</div>