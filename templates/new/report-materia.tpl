<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-briefcase"></i>                 
        </span>
        Reporte Materias
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>Reportes
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>

<div class="card mb-4">
    <div class="card-header bg-primary text-white">
		<i class="fas fa-briefcase"></i> Reporte Materias
        <a href="#" class="btn btn-info float-right" onClick="onImprimir()" title="Imprimir">
            <i class="fas fa-print"></i> Imprimir
        </a>
    </div>
    <div class="card-body">
		<form id="frmGral">
			<div class="row">
				<div class="col-md-6">
					<label for="posgrado">Posgrado</label>
					<select name="posgrado" id="posgrado" class="form-control" onChange="onMaterias()">
						<option value="">-- Seleccionar --</option>
						{foreach from=$lstPosgrados item=subject}
							<option value="{$subject.subjectId}">{$subject.name}</option>
						{/foreach}
					</select>
				</div>
				<div class="col-md-6">
					<label for="materia">Materia</label>
					<div id="divMateria">
						<select id="materia" name="materia" class="form-control"></select>	
					</div>
				</div>
			</div>
		</form>
		<div class="row my-3">
			<div class="col-md-12 text-center">
				<button onClick="onBuscar()" class="btn btn-primary">Buscar</button>
			</div>
			<div class="col-md-12">
				<div id="msj"></div>
			</div>
		</div>
		<div id="container" class="table-responsive">
			{include file="{$DOC_ROOT}/templates/lists/report-materia.tpl"}
		</div>
    </div>
</div>