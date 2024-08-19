<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-percent"></i>
        </span>
        Reporte de Becas
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
        <form id="frmGral" target="_blank" action="{$WEB_ROOT}/ajax/new/reportes.php?page=export-excel" method="post">
            <input type="hidden" value="diplomados" name="opcion">
            <div class="row"> 
                <div class="col-md-6 form-group">
                    <label for="grupo">Grupo</label>
                    <select class="form-control" name="grupo" id="grupo" required>
                        <option value="">--Selecciona un grupo--</option>
                        {foreach from=$grupos item=grupo}
                            <option value="{$grupo.courseId}">{$grupo.group}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="col-md-6">
                    <label for="tipo">Tipo</label>
                    <select class="form-control" id="tipo" name="tipo" required>
                        <option value="">--Selecciona un tipo de reporte--</option>
                        <option value="1">Registros</option>
                        <option value="2">Evaluaciones</option>
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