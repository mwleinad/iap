<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="far fa-folder-open"></i> Documentos del Docente
    </div>
    <div class="card-body">
        <div id="msj"></div>
        {include file="boxes/status_no_ajax.tpl"}
        <div id="loader"></div>
        <div id="contenido" class="table-responsive">
            {include file="{$DOC_ROOT}/templates/lists/new/doc-docente.tpl"}
        </div>
    </div>
</div>