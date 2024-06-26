<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-cogs"></i> Historial de pagos
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-8">
                <h4 class="text-uppercase"><b>Currícula:</b> [{$info.majorName}] {$info.name}</h4>
                <h4 class="text-uppercase"><b>Alumno:</b> {$alumno.names} {$alumno.lastNamePaterno}
                    {$alumno.lastNameMaterno}</h4>
                {if $info.totalPeriods > 0}
                    <h4><b>Total {$info.tipoCuatri}: </b> {$info.totalPeriods}</h4>
                {/if}
            </div>
            <form class="form col-md-4 text-right" action="{$WEB_ROOT}/ajax/new/conceptos.php"
                id="form_modal{$info.majorName}">
                <input type="hidden" name="opcion" value="agregar-pago">
                <input type="hidden" name="alumno" value="{$alumno.userId}">
                <input type="hidden" name="curso" value="{$info.courseId}">
                <button type="submit" class="btn btn-info btn-sm">Agregar Concepto</button>
            </form>
        </div>
        <div class="row">
            {for $period = 1 to $info.totalPeriods}
                {$subtotalconcentrado = 0}
                {$descuentoconcentrado = 0}
                {$totalconcentrado = 0}
                {$pendienteconcentrado = 0}
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-dark text-white">
                            <b>{$info.tipoCuatri} {$period}</b>
                            <form class="form d-inline float-right" action="{$WEB_ROOT}/ajax/new/conceptos.php"
                                id="form_modal{$period}">
                                <input type="hidden" name="opcion" value="actualizar-beca">
                                <input type="hidden" name="alumno" value="{$alumno.userId}">
                                <input type="hidden" name="curso" value="{$info.courseId}">
                                <input type="hidden" name="periodo" value="{$period}">
                                <div class="input-group">
                                    <input type="number" min="0" max="100" name="beca" placeholder="%" id="beca"
                                        aria-label="% de Beca" aria-describedby="button-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-success" type="submit">Aplicar % de beca</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-sm">
                                    <thead>
                                        <tr class="text-center">
                                            <th></th>
                                            <th>Concepto</th>
                                            <th>Subtotal</th>
                                            <th>Descuento</th>
                                            <th>Total a pagar</th>
                                            <th>Monto pendiente</th>
                                            <th>Fecha Cobro</th>
                                            <th>Fecha Límite</th>
                                            <th>¿Aplica Beca?</th>
                                            <th>Beca</th>
                                            <th>Estatus</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody class="text-center">
                                        {foreach from=$pagos.periodicos item=item name=forFechas}
                                            {if $item.periodo == $period}
                                                {$descuento = $item.subtotal * ($item.beca / 100)}
                                                {$pendiente = $item.total - $item.monto}
                                                {$subtotalconcentrado = $subtotalconcentrado + $item.subtotal}
                                                {$descuentoconcentrado = $descuentoconcentrado + $descuento}
                                                {$totalconcentrado = $totalconcentrado + $item.total}
                                                {$pendienteconcentrado = $pendienteconcentrado + $pendiente}
                                                {$contador[$item.concepto_id] = $contador[$item.concepto_id] + 1}
                                                <tr
                                                    {($item.fecha_limite < date('Y-m-d') && !in_array($item.status, [2,4])) ? 'class="alert alert-danger" ' : ""}>
                                                    <td>
                                                        {if count($item.cobros) > 0}
                                                            <button type="button" data-cobros="#cobros{$item.pago_id}"
                                                                class="btn btn-outline-info btn-sm cobros p-2">
                                                                <i class="fa fa-plus"></i>
                                                            </button>
                                                        {/if}
                                                    </td>
                                                    <td>{$item.concepto_nombre} {$item.indice}</td>
                                                    <td>${$item.subtotal|number_format:2:".":","}</td>
                                                    <td>${$descuento|number_format:2:".":","}</td>
                                                    <td>${$item.total|number_format:2:".":","}</td>
                                                    <td>${$pendiente|number_format:2:".":","}</td>
                                                    <td>{$item.fecha_cobro}</td>
                                                    <td>{$item.fecha_limite}</td>
                                                    <td>{($item.descuento) ? "Sí" : "No"}</td>
                                                    <td>{$item.beca}%</td>
                                                    <td>{$item.status_btn}</td>
                                                    <td>
                                                        {if !in_array($item.status,[2,4])}
                                                            <form class="form d-inline" action="{$WEB_ROOT}/ajax/new/conceptos.php"
                                                                id="form_pago{$item.pago_id}" method="POST">
                                                                <input type="hidden" name="opcion" value="editar-pago">
                                                                <input type="hidden" name="pago" value="{$item.pago_id}">
                                                                <button type="submmit" class="btn btn-primary btn-sm">Editar</button>
                                                            </form>
                                                            <form class="form d-inline" action="{$WEB_ROOT}/ajax/new/conceptos.php"
                                                                id="form_cobro{$item.pago_id}" method="POST">
                                                                <input type="hidden" name="opcion" value="agregar-cobro">
                                                                <input type="hidden" name="pago" value="{$item.pago_id}">
                                                                <button type="submit" class="btn btn-info btn-sm">
                                                                    Generar cobro
                                                                </button>
                                                            </form>
                                                            <form class="form d-inline" action="{$WEB_ROOT}/ajax/new/conceptos.php"
                                                                id="form_condonar{$item.pago_id}" method="post" data-alert="true" data-mensaje="El monto pendiente será tomado como pagado.">
                                                                <input type="hidden" name="opcion" value="condonar-pago">
                                                                <input type="hidden" name="pago" value="{$item.pago_id}">
                                                                <button type="submit" class="btn btn-sm" style="background-color: #4056a5; color: #fff;">
                                                                    Condonar pago
                                                                </button>
                                                            </form>
                                                        {/if}
                                                        {if $item.status == 2 && $item.beca == 100}
                                                            <a href="{$WEB_ROOT}/pdf/recibo.php?pago={$item.pago_id}"
                                                                class="btn btn-sm text-white"
                                                                style="background-color: #970000; border-color: #970000;"
                                                                target="_blank">
                                                                {($item.recibo) ? "Ver" : "Generar"} recibo
                                                            </a>
                                                        {/if}
                                                    </td>
                                                </tr>
                                                {if count($item.cobros) > 0}
                                                    <tr class="d-none" id="cobros{$item.pago_id}">
                                                        <td colspan="2"></td>
                                                        <td colspan="8">
                                                            {foreach from=$item.cobros item=itemc name=cobros}
                                                                <div class="row mb-3">
                                                                    <div class="col-md-3">
                                                                        <label>
                                                                            <b>Monto cobrado {$smarty.foreach.cobros.iteration}: </b>
                                                                            ${$itemc.monto|number_format:2:".":","}
                                                                        </label>
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <b>Fecha de pago:</b>{$itemc.fecha_pago}
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <b>Facturado:</b>{($itemc.facturado == 0) ? "No" : "Sí"}
                                                                    </div>
                                                                </div>
                                                            {/foreach}
                                                        </td>
                                                    </tr>
                                                {/if}
                                            {/if}
                                        {/foreach}
                                    </tbody>
                                    <tfoot class="text-center">
                                        <td colspan="2"></td>
                                        <td>${$subtotalconcentrado|number_format:2:'.':','}</td>
                                        <td>${$descuentoconcentrado|number_format:2:'.':','}</td>
                                        <td>${$totalconcentrado|number_format:2:'.':','}</td>
                                        <td>${$pendienteconcentrado|number_format:2:'.':','}</td>
                                        <td colspan="6"></td>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            {/for}
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header bg-dark text-white"><b>Otros conceptos</b></div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-sm">
                                <thead>
                                    <tr class="text-center">
                                        <th></th>
                                        <th>Concepto</th>
                                        <th>Subtotal</th>
                                        <th>Descuento</th>
                                        <th>Total a pagar</th>
                                        <th>Monto pendiente</th>
                                        <th>¿Aplica Beca?</th>
                                        <th>Beca</th>
                                        <th>Estatus</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody class="text-center">
                                    {foreach from=$pagos.otros item=item}
                                        <tr>
                                            <td>
                                                {if count($item.cobros) > 0}
                                                    <button type="button" data-cobros="#cobros{$item.pago_id}"
                                                        class="btn btn-outline-info btn-sm cobros">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                {/if}
                                            </td>
                                            <td>{$item.concepto_nombre} {$contador[$item.concepto_id]}</td>
                                            <td>${$item.subtotal|number_format:2:".":","}</td>
                                            <td>${$item.subtotal * ($item.beca / 100)|number_format:2:".":","}</td>
                                            <td>${$item.total|number_format:2:".":","}</td>
                                            <td>${$item.total - $item.monto|number_format:2:".":","}</td>
                                            <td>{($item.descuento) ? "Sí" : "No"}</td>
                                            <td>{$item.beca}%</td>
                                            <td>{$item.status_btn}</td>
                                            <td>
                                                {if $item.status != 2}
                                                    <form class="form d-inline" action="{$WEB_ROOT}/ajax/new/conceptos.php"
                                                        id="editar_pago{$item.pago_id}">
                                                        <input type="hidden" name="opcion" value="editar-pago">
                                                        <input type="hidden" name="pago" value="{$item.pago_id}">
                                                        <button type="submit" class="btn btn-primary btn-sm">Editar</button>
                                                    </form>
                                                    <form class="form d-inline" action="{$WEB_ROOT}/ajax/new/conceptos.php"
                                                        id="form_cobro{$item.pago_id}" method="POST">
                                                        <input type="hidden" name="opcion" value="agregar-cobro">
                                                        <input type="hidden" name="pago" value="{$item.pago_id}">
                                                        <button type="submit" class="btn btn-info btn-sm">
                                                            Generar cobro
                                                        </button>
                                                    </form>
                                                {/if}

                                            </td>
                                        </tr>
                                        {if count($item.cobros) > 0}
                                            <tr class="d-none" id="cobros{$item.pago_id}">
                                                <td colspan="2"></td>
                                                <td colspan="7">
                                                    {foreach from=$item.cobros item=itemc name=cobros}
                                                        <div class="row mb-3">
                                                            <div class="col-md-3">
                                                                <b>Monto cobrado {$smarty.foreach.cobros.iteration}:</b>
                                                                {$itemc.monto}
                                                            </div>
                                                            <div class="col-md-3">
                                                                <b>Fecha de pago:</b>{$itemc.fecha_pago}
                                                            </div>
                                                            <div class="col-md-3">
                                                                <b>Facturado:</b>{($itemc.facturado == 0) ? "No" : "Sí"}
                                                            </div>
                                                        </div>
                                                    {/foreach}
                                                </td>
                                            </tr>
                                        {/if}
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(".cobros").on("click", function() {
        let idcobro = $(this).data("cobros");
        let seccionCobro = $(idcobro);
        if (seccionCobro.hasClass('d-none')) {
            seccionCobro.removeClass('d-none');
            $(this).html('<i class="fa fa-minus"></i>');
        } else {
            seccionCobro.addClass('d-none');
            $(this).html('<i class="fa fa-plus"></i>');
        }
    });
</script>