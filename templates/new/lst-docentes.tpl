<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-chair-school"></i>                 
        </span>
        Lista de Docentes
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
    <div class="card-header bg-primary text-white header_main">
		<div class="sub_header"><i class="fas fa-chalkboard-teacher"></i> Lista de Docentes</div>
        <a href="{$WEB_ROOT}/graybox.php?page=add-docente-admin" class="btn btn-info float-right" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Agregar Docente">
            <i class="fas fa-plus"></i> Agregar
        </a>
    </div>
    <div class="card-body">
		<div class="col-md-12 d-flex justify-content-center mb-4">
			<div style="display:-webkit-inline-box">
				<form id="frmFlt">
					<b>Nombre</b><input type="text" name="nombre" class="form-control" onKeyUp="onBuscar()" onKeyPress="onBuscar()" />
				</form><br>
				<button onClick="onBuscar()" class="btn btn-primary">Buscar</button>
			</div>
		</div>
		<div id="msj"></div>
		<div id="container" class="table-responsive">
			{include file="{$DOC_ROOT}/templates/lists/lst-docentes.tpl"}
		</div>
    </div>
</div>