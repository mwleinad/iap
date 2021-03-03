<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="far fa-calendar-check"></i> Calendario de Pagos
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
        <form action="{$WEB_ROOT}/history-calendar" method="POST">
            <input type="hidden" name="userId" value="{$userId}" />
            <input type="hidden" name="courseId" value="{$info.courseId}" />
            {for $period = 1 to $info.totalPeriods}
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-dark text-white">
                            <b>{$info.tipoCuatri} {$period}</b>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-sm">
                                    <thead>
                                        <tr class="text-center">
                                            <th>Concepto</th>
                                            <th>Fecha de Pago</th>
                                            <th>Monto Sin Beca</th>
                                            <th>Porcentaje de Beca</th>
                                            <th>Total a Pagar</th>
                                            <th>Estatus</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {foreach from=$distribution[$period] item=item}
                                            <tr class="{if $item['paid'] eq 0} danger {/if}">
                                                <td>{$item['concept']} {$item['consecutive']}</td>
                                                <td class="text-center">{$item['date_dmy']}</td>
                                                <td class="text-center">${$item['amount']}</td>
                                                <td class="text-center">{($item['hasDiscount'] == 1) ? ($item['discount']|cat:'%') : 'No Aplica'}</td>
                                                <td class="text-center">
                                                    {if $item['hasDiscount'] == 1}
                                                        ${(((100-$item['discount'])/100) * $item['amount'])}
                                                    {else}
                                                        ${$item['amount']}
                                                    {/if}
                                                </td>
                                                <td class="text-center">
                                                    <select class="form-control" name="payments[{$item['calendarDistributionId']}]">
                                                        <option {if $item['paid'] eq 1} selected {/if} value="1">Pagado</option>
                                                        <option {if $item['paid'] eq 0} selected {/if} value="0">Pendiente</option>
                                                    </select>
                                                </td>
                                            </tr>
                                        {foreachelse}
                                            <tr>
                                                <td colspan="6" class="text-center">
                                                    No se encontró ningún registro.
                                                </td>
                                            </tr>
                                        {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            {/for}
            <div class="col-md-12 text-center">
                <button type="submit" class="btn btn-success">Guardar</button>
            </div>
        </form>
    </div>
</div>