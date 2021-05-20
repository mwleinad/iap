<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-source-fork"></i>                 
        </span>
        Docente/Materias
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>Docente
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>

<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-graduation-cap"></i> Docente/Materia
    </div>
    <div class="card-body">
        <div id="msj"></div>
        {include file="boxes/status_no_ajax.tpl"}
        <div id="loader"></div>
        <div id="contenido" class="table-responsive">
            {include file="{$DOC_ROOT}/templates/lists/materias.tpl"}
        </div>
    </div>
</div>