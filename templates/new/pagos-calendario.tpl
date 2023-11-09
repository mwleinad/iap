<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-cash"></i>                 
        </span>
        Historial de Pagos
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>Cobranza
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>

<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-history"></i> Historial de Pagos
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-12">
                <h4><b>Curricula:</b> [{$info.majorName}] {$info.name}</h4>
                {if $info.totalPeriods > 0}
                    <h4><b>Total {$info.tipoCuatri}: </b> {$info.totalPeriods}</h4>
                {/if}
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-sm">
                        <thead>
                            <tr class="text-center">
                                <th>Apellido Paterno</th>
                                <th>Apellido Materno</th>
                                <th>Nombre(s)</th>
                                <th>No. Control</th>
                                <th>Estatus</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$students item=item}
                                <tr>
                                    <td>{$item['lastNamePaterno']|upper}</td>
                                    <td>{$item['lastNameMaterno']|upper}</td>
                                    <td>{$item['names']|upper}</td>
                                    <td class="text-center">{$item['controlNumber']}</td>
                                    <td class="text-center">{($item['status'] == "inactivo") ? "<span class='badge badge-danger'>Inactivo</span>" : "<span class='badge badge-success'>Activo</span>"}</td>
                                    <td class="text-center">
                                        <a href="{$WEB_ROOT}/graybox.php?page=history-calendar&id={$item['alumnoId']}&course={$info.courseId}" title="Historial de Pagos" data-target="#ajax" data-toggle="modal" class="btn btn-info btn-sm">
                                            <i class="fas fa-money-bill-wave"></i>
                                        </a>
                                        {if $item['status'] != "inactivo"}
                                            <form class="form d-inline" id="form_excepcion{$item.alumnoId}" action="{$WEB_ROOT}/ajax/new/finanzas.php">
                                                <input type="hidden" name="opcion" value="excepcion">
                                                <input type="hidden" name="alumno" value="{$item.alumnoId}">
                                                <input type="hidden" name="excepcion" value="{($item.bloqueado == 0) ? 1 : 0}">
                                                <button class="btn btn-primary btn-sm" title="{($item.bloqueado == 0) ? "Quitar excepción de pago" :"Agregar excepción de pago"}">
                                                    <i class="fas fa-{($item.bloqueado == 0) ? "ban": "check"}"></i>
                                                </button>
                                            </form>
                                        {/if}
                                    </td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>