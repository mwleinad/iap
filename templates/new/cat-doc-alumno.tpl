<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-folder"></i>                 
        </span>
        Documentos del Alumno
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>Alumno
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>

<div class="card mb-4">
    <div class="card-header bg-primary text-white header_main">
		<div class="sub_header"><i class="far fa-folder"></i> Documentos del Alumno</div>
        <a href="{$WEB_ROOT}/graybox.php?page=add-cat-doc-alumno-add" class="btn btn-info float-right" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Agregar Documento">
            <i class="fas fa-plus"></i> Agregar
        </a>
    </div>
    <div class="card-body">
        <div id="msj"></div>
        {include file="boxes/status_no_ajax.tpl"}
		<div id="loader"></div>
		<div id="contenido" class="table-responsive">
		    {include file="{$DOC_ROOT}/templates/lists/new/cat-doc-alumno.tpl"}
		</div>
    </div>
</div>