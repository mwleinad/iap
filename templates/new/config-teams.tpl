<div id="container-team">
    <div class="card mb-4">
        <div class="card-header bg-primary text-white">
            <i class="fas fa-users-slash"></i> Sin Equipo
        </div>
        <div class="card-body">
            <div id="tblContent" class="table-responsive">
                {include file="{$DOC_ROOT}/templates/lists/no-team.tpl"}
            </div>
        </div>
    </div>

    <div class="card mb-4">
        <div class="card-header bg-primary text-white">
            <i class="fas fa-users"></i> Equipo
        </div>
        <div class="card-body">
            <div id="tblContent" class="table-responsive">
                {include file="{$DOC_ROOT}/templates/lists/teams.tpl"}
            </div>
        </div>
    </div>
</div>