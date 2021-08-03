<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-cash"></i>                 
        </span>
        Configurar Calendario (Becas)
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
        <i class="fas fa-calendar-plus"></i> Configurar Calendario (Becas)
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
        <form action="{$WEB_ROOT}/becas-calendario/id/{$info.courseId}" method="POST">
            <input type="hidden" name="courseId" value="{$info.courseId}" />
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
                                    <th>Beca (%)</th>
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
                                            <div class="form-row d-flex justify-content-center">
                                                <input type="text" class="form-control" style="max-width: 80px;" name="students[{$item['alumnoId']}]" placeholder="%" value="{$item['discount']}" autocomplete="off">
                                            </div>
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <button type="submit" class="btn btn-success">Guardar</button>
                </div>
            </div>
        </form>
    </div>
</div>