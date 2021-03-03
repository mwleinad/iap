<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-cash"></i>                 
        </span>
        Currícula
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>Curricula
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>

<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-calendar-alt"></i> Currícula
        <a href="{$WEB_ROOT}/graybox.php?page=new-subject" class="btn btn-info float-right" data-target="#ajax" data-toggle="modal">
            <i class="fas fa-plus"></i> Agregar
        </a>
    </div>
    <div class="card-body">
        <div id="tblContent" class="table-responsive">
            {include file="lists/new/subject.tpl"}
        </div>
    </div>
</div>