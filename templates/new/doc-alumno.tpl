<div class="card mb-4">
    <div class="card-header bg-primary header_main">
        <div class="sub_header">
            <i class="far fa-folder-open"></i> Documentos
        </div>
    </div>
    <div class="card-body">
        <div id="msj"></div>
        {include file="boxes/status_no_ajax.tpl"}
        <div id="loader"></div>
        <div id="contenido" class="table-responsive">
            {include file="{$DOC_ROOT}/templates/lists/new/doc-alumno.tpl"}
        </div>
    </div>
</div>