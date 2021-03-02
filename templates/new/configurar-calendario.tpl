<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-chas"></i>                 
        </span>
        Configurar Calendario
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
        <i class="fas fa-cogs"></i> Configurar Calendario
        <a href="{$WEB_ROOT}/graybox.php?page=calendar-form&id={$courseId}" class="btn btn-info float-right" data-target="#ajax" data-toggle="modal">
            <i class="fas fa-plus"></i> Agregar
        </a>
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
            {for $period = 1 to $info.totalPeriods}
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-dark text-white"><b>{$info.tipoCuatri} {$period}</b></div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-sm">
                                    <thead>
                                        <tr class="text-center">
                                            <th>Concepto</th>
                                            <th>Monto</th>
                                            <th>Fecha</th>
                                            <th>¿Es Visible?</th>
                                            <th>¿Aplica Beca?</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {foreach from=$distribution[$period] item=item}
                                            <tr>
                                                <td>{$item['concept']} {$item['consecutive']}</td>
                                                <td class="text-center">${$item['amount']}</td>
                                                <td class="text-center">{$item['date']}</td>
                                                <td class="text-center">{($item['isVisible'] == 1) ? 'Si' : 'No'}</td>
                                                <td class="text-center">{($item['hasDiscount'] == 1) ? 'Si' : 'No'}</td>
                                                <td class="text-center">
                                                    <a href="{$WEB_ROOT}/graybox.php?page=edit-calendar-form&id={$item.calendarDistributionId}" title="Editar" data-target="#ajax" data-toggle="modal" class="btn btn-info btn-sm">
                                                        <i class="fas fa-edit text-white"></i>
                                                    </a>
                                                    <a class="btn btn-danger btn-sm btn-delete" title="Eliminar" data-id="{$item.calendarDistributionId}">
                                                        <i class="fas fa-trash-alt text-white"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        {foreachelse}
                                            <tr>
                                                <td colspan="6" class="text-center">No se encontró ningún registro.</td>
                                            </tr>
                                        {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            {/for}
        </div>
    </div>
</div>
