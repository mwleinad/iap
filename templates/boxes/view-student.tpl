<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-users"></i> Ver Grupo {$tip}
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-12">{$status|ucfirst}</div>
        </div>
        <div id="tblContent" class="table-responsive">
            {include file="{$DOC_ROOT}/templates/lists/student1.tpl"}  
        </div>
    </div>
</div>