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
        {if $msj == 'si'}
            <div class="row">
                <div class="col-md-12">
                    <div class="alert alert-info alert-dismissible fade show" role="alert">
                        Los datos se guardaron correctamente.
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </div>
            </div>
        {/if}
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
                                <th>Historial de Pagos</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$students item=item}
                                <tr>
                                    <td>{$item['lastNamePaterno']|upper}</td>
                                    <td>{$item['lastNameMaterno']|upper}</td>
                                    <td>{$item['names']|upper}</td>
                                    <td class="text-center">{$item['controlNumber']}</td>
                                    <td class="text-center">
                                        <a href="{$WEB_ROOT}/graybox.php?page=history-calendar&id={$item['alumnoId']}&course={$info.courseId}" title="Historial de Pagos" data-target="#ajax" data-toggle="modal" class="btn btn-info btn-sm">
                                            <i class="fas fa-money-bill-wave"></i>
                                        </a>
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