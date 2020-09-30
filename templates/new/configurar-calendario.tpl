<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i> Configurar Calendario
        </div>
        <div class="actions">
            <a class="btn green" href="{$WEB_ROOT}/graybox.php?page=calendar-form&id={$courseId}" data-target="#ajax" data-toggle="modal">
                <i class="fa fa-plus"></i> Agregar
            </a>
        </div>
    </div>
    <div class="portlet-body">
		{if $msj == 'si'}
		    <div class="alert alert-info alert-dismissable">
			    <button type="button" class="close" data-dismiss="alert">&times;</button>
			    Los datos se guardaron correctamente
			</div>
		{/if}
        <div class="row">
            <div class="col-md-12">
                <h4><b>Curricula:</b> [{$info.majorName}] {$info.name}</h4>
                {if $info.totalPeriods > 0}
                    <h4><b>Total {$info.tipoCuatri}: </b> {$info.totalPeriods}</h4>
                {/if}
            </div>
            {for $period = 1 to $info.totalPeriods}
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading"><b>{$info.tipoCuatri} {$period}</b></div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                {if array_key_exists($period, $distribution) > 0}
                                    <table class="table table-sm">
                                        <thead>
                                            <tr>
                                                <th class="text-center">Concepto</th>
                                                <th class="text-center">Monto</th>
                                                <th class="text-center">Fecha</th>
                                                <th class="text-center">¿Es Visible?</th>
                                                <th class="text-center">¿Aplica Beca?</th>
                                                <th class="text-center">Acciones</th>
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
                                                        <a href="{$WEB_ROOT}/graybox.php?page=edit-calendar-form&id={$item.calendarDistributionId}" title="Editar" data-target="#ajax" data-toggle="modal" class="btn btn-primary btn-sm">
                                                            <i class="fa fa-pencil-square-o"></i>
                                                        </a>
                                                        <a class="btn btn-danger btn-sm btn-delete" title="Eliminar" data-id="{$item.calendarDistributionId}">
                                                            <i class="fa fa-trash"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            {/foreach}
                                        </tbody>
                                    </table>
                                {/if}
                            </div>
                        </div>
                    </div>
                </div>
            {/for}
        </div>
    </div>
</div>
