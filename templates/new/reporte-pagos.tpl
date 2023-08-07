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
        <form class="row form" id="form_reportes" action="{$WEB_ROOT}/ajax/new/reportes.php" method="post">
            <input type="hidden" name="opcion" value="pagos">
            <div class="col-md-8 mx-auto">
                <div class="row">
                    <div class="col-md-7 mb-3 mx-auto">
                        <label>Alumno</label>
                        <select class="selectpicker alumnos form-control"
                            data-url="{$WEB_ROOT}/ajax/new/studentCurricula.php" data-live-search="true" name="alumno">
                            <option value="">--Selecciona el alumno--</option>
                            {foreach from=$alumnos item=item}
                                <option value="{$item.userId}">{$item.lastNamePaterno|upper} {$item.lastNameMaterno|upper}
                                    {$item.names|upper}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="col-md-7 mb-3 mx-auto">
                        <label>Currícula</label>
                        <select data-none-selected-text="--Selecciona la currícula--"
                            class="selectpicker curricula form-control" data-max-options="1" name="curricula"
                            id="curricula">
                        </select>
                    </div>
                </div>
            </div> 
            <div class="col-md-12 text-center">
                <button class="btn btn-success" type="submit">Generar reporte</button>
            </div>
        </form>
    </div>
</div>