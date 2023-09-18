<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-cash"></i>
        </span>
        Reporte de Pagos
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>Finanzas
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>

<div class="card mb-4">
    <div class="card-body">
        <form class="row" target="_blank" id="form_reportes"
            action="{$WEB_ROOT}/ajax/new/reportes.php?page=export-excel" method="post">
            <div class="col-md-8 mx-auto">
                <div class="row">
                    <div class="col-md-7 mb-3 mx-auto">
                        <label for="opcion">Tipo de reporte</label>
                        <select class="form-control selectpicker" id="opcion" name="opcion">
                            <option value="">--Selecciona el tipo de reporte--</option>
                            <option value="cuenta-alumno" data-icon="fa fa-user">Estado de cuenta - Por alumno</option>
                            <option value="cuenta-grupo" data-icon="fa fa-users">Estado de cuenta - Por grupo</option>
                            <option value="cuenta-fechas" data-icon="fa fa-calendar-alt">Ingresos Generales - Por rango de fechas
                            </option>
                        </select>
                    </div>
                    <div id="reporte-1" class="col-md-12 d-none">
                        <div class="row">
                            {include file="items/new/pagos-alumnos.tpl"}
                        </div>
                    </div>
                    <div id="reporte-2" class="col-md-12 d-none">
                        <div class="row">
                            {include file="items/new/pagos-grupo.tpl"}
                        </div>
                    </div>
                    <div id="reporte-3" class="col-md-12 d-none">
                        <div class="row">
                            {include file="items/new/pagos-fechas.tpl"}
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 text-center">
                <button class="btn btn-success" type="submit">Generar reporte</button>
            </div>
        </form>
    </div>
</div>