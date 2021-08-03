<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-city"></i>                 
        </span>
        Datos de la Institución
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>Configuración
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>

<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-building"></i> Datos de la Institución
    </div>
    <div class="card-body">
        <div id="tblContent" class="table-responsive">
            {include file="lists/institution.tpl"}
        </div>
    </div>
</div>