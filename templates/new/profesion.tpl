<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-tag-outline"></i>                 
        </span>
        Tipos de Profesiones
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>Catálogos
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>

<div class="card mb-4">
    <div class="card-header bg-primary text-white header_main">
        <div class="sub_header"><i class="fas fa-user-graduate"></i> Tipos de Profesiones</div>
        <a href="javascript:;" class="btn btn-info float-right" id="btnAddProfesion">
            <i class="fas fa-plus"></i> Agregar
        </a>
    </div>
    <div class="card-body">
        <div id="tblContent" class="table-responsive">
            {include file="lists/profesion.tpl"}
        </div>
    </div>
</div>