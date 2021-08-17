<div class="row">
    <div class="col-md-12">
        <h4><b>Curricula:</b> [{$info.majorName}] {$info.name}</h4>
        {if $info.totalPeriods > 0}
            <h4><b>Total {$info.tipoCuatri}: </b> {$info.totalPeriods}</h4>
        {/if}<br>
        <p class="text-justify">
            <b>NOTA:</b> Estimados alumnos, por este medio hago de su conocimiento que a partir del día 17 de agosto 2021 la emisión  de los Comprobantes Fiscales Digitales realizados por este instituto relativo  a los pagos por concepto de materias, constancias, pago de titulación y pago de certificado, se facturarán a más tardar el último día de cada mes. Asimismo, todos aquellos alumnos que realicen pagos por los conceptos antes señalados y no soliciten la factura correspondiente en el plazo establecido, ya no se les podrán expedir el comprobante fiscal correspondiente.
        </p>
    </div>
    {for $period = 1 to $info.totalPeriods}
        <div class="col-md-12">
            <div class="card border border-success">
                <div class="card-header bg-success text-white"><b>{$info.tipoCuatri} {$period}</b></div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-sm table-hover">
                            <thead>
                                <tr class="text-center">
                                    <th><b>Concepto</b></th>
                                    <th><b>Fecha de Pago</b></th>
                                    <th><b>Monto Sin Beca</b></th>
                                    <th><b>Porcentaje de Beca</b></th>
                                    <th><b>Total a Pagar</b></th>
                                    <th><b>Estatus</b></th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$distribution[$period] item=item}
                                    <tr class="{if $item['paid'] eq 0} bg-danger {/if}">
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
</div>