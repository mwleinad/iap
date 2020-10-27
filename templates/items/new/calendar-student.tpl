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
                                <table class="table table-sm">
                                    <thead>
                                        <tr>
                                            <th class="text-center">Concepto</th>
                                            <th class="text-center">Fecha de Pago</th>
                                            <th class="text-center">Monto Sin Beca</th>
                                            <th class="text-center">Porcentaje de Beca</th>
                                            <th class="text-center">Total a Pagar</th>
                                            <th class="text-center">Estatus</th>
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
                                                    {($item['paid'] == 1) ? 'Pagado' : 'Pendiente'}
                                                </td>
                                            </tr>
                                        {foreachelse}
                                            <tr>
                                                <td colspan="5" class="text-center">
                                                    No se encontr&oacute; ning&uacute;n registro.
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
        </div>