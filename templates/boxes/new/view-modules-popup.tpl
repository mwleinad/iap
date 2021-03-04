<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <a href="{$WEB_ROOT}/index_new.php?page=new-module&id={$id}" class="text-white">
            <i class="fas fa-plus-circle"></i> Click para agregar módulos a Currícula
        </a>
    </div>
    <div class="card-body">
        <div id="tblContent" class="table-responsive">
            {include file="{$DOC_ROOT}/templates/lists/new/modules.tpl"}
        </div>
    </div>
</div>