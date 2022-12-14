<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-briefcase"></i>                 
        </span>
        Reporte Indicadores
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
        {* <a href="#" class="btn btn-info float-right" onClick="onImprimir()" title="Imprimir">
            <i class="fas fa-print"></i> Imprimir
        </a> *}
    </div>
    <div class="card-body">
		<form id="frmGral" class="form" action="{$WEB_ROOT}/ajax/new/reporte-indicadores.php" method="post">
			<div class="row">
                <div class="col-md-4">
                    <label>Fecha de inicial</label>
                    <input type="date" class="form-control" id="fecha_inicial" required name="fecha_inicial">
                </div>
                <div class="col-md-4">
                    <label>Fecha final</label>
                    <input type="date" class="form-control" id="fecha_final" required name="fecha_final">
                </div>
                <div class="col-md-4 form-group">
                    <label for="posgrado">Posgrado</label>
                    <select class="form-control" name="posgrado" id="posgrado">
                        <option value="">----</option>
                        {foreach from=$posgrados item=item}
                            <option value="{$item.subjectId}">[{$item.nivelPosgrado}]{$item.posgrado}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="col-md-12 text-center">
                    <button type="submit" class="btn btn-primary">Buscar</button>
                </div>
			</div>
		</form> 
		<div id="contenedor-reportes">
		</div>
    </div>
</div>