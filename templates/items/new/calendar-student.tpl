<div class="row">
            <div class="col-md-12">
                <h4><b>Curricula:</b> [{$info.majorName}] {$info.name}</h4>
                {if $info.totalPeriods > 0}
                    <h4><b>Total {$info.tipoCuatri}: </b> {$info.totalPeriods}</h4>
                {/if}
                <p>Los datos para realizar <b>PAGOS EN VENTANILLA</b> son los siguientes:</p>
                <ul>
                    <li>Banco: <b>BANORTE IXE</b></li>
                    <li>No. convenio: <b>148126</b></li>
                    <li>No. de referencia: <b>{$references[$usId]}</b></li>
                </ul>
                <p>Los datos para realizar <b>TRANSFERENCIAS BANCARIAS</b> son los siguientes:</p>
                <ul>
                    <li>Banco: <b>BANORTE IXE</b></li>
                    <li>Clave interbancaria: <b>072100010313317272</b></li>
                    <li>Cuenta a nombre de: <b>Instituto de Administración Pública del Estado de Chiapas A. C.</b></li>
                    <li>Favor de colocar en el concepto su nombre o el No. de referencia bancaria, el cual es: <b>{$references[$usId]}</b></li>
                </ul>
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