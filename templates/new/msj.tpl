<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-email-outline"></i>                 
        </span>
        Mensajes
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
		<div class="sub_header"><i class="far fa-envelope"></i> Mensajes</div>
        <a href="{$WEB_ROOT}/graybox.php?page=add-msj" class="btn btn-info float-right" data-target="#ajax" data-toggle="modal" data-width="1000px" title="Agregar Mensaje">
            <i class="fas fa-plus"></i> Agregar
        </a>
    </div>
    <div class="card-body">
		<form id="frmFlt">
			<div class="row justify-content-center">
				<div class="col-md-6">
					<label for="nombre">Nombre</label>
					<input type="text" id="nombre" name="nombre" class="form-control" onKeyUp="onBuscar()" onKeyPress="onBuscar()" />
				</div>
			</div>
		</form>
		<div class="col-md-12 text-center my-3">
			<button onClick="onBuscar()" class="btn btn-primary">Buscar</button>
		</div>
		<div id="msj"></div>
		<div id="container" class="table-responsive">
			{include file="{$DOC_ROOT}/templates/lists/msj.tpl"}
		</div>
    </div>
</div>