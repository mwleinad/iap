<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i> Historial de Pagos
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
            <div class="col-md-12">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-sm">
                        <thead>
                            <tr>
                                <th class="text-center">Apellido Paterno</th>
                                <th class="text-center">Apellido Materno</th>
                                <th class="text-center">Nombre(s)</th>
                                <th class="text-center">No. Control</th>
                                <th class="text-center">Historial de Pagos</th>
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
                                        <a href="{$WEB_ROOT}/graybox.php?page=history-calendar&id={$item['alumnoId']}&course={$info.courseId}" title="Historial de Pagos" data-target="#ajax" data-toggle="modal" class="btn btn-primary btn-sm">
                                            <i class="fa fa-money"></i>
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
