<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-portrait"></i> Información adicional
    </div>
    <div class="card-body">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="calificaciones-tab" data-toggle="tab" data-target="#calificaciones"
                    type="button" role="tab" aria-controls="calificaciones" aria-selected="true">Calificaciones</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="recursamiento-tab" data-toggle="tab" data-target="#recursamiento"
                    type="button" role="tab" aria-controls="recursamiento" aria-selected="false">Recursamiento</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="pagos-tab" data-toggle="tab" data-target="#pagos" type="button" role="tab"
                    aria-controls="pagos" aria-selected="false">Pagos</button>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="calificaciones" role="tabpanel"
                aria-labelledby="calificaciones-tab">
                <h3 class="text-center my-3">
                    {$infoStudent.names} {$infoStudent.lastNamePaterno} {$infoStudent.lastNameMaterno} <br>
                    <a href="{$WEB_ROOT}/pdf/historial.php?page=export-excel&estudiante={$infoStudent.userId}" target="_blank">
                        Descargar <i class="fa fa-file"></i>
                    </a>
                </h3>
                {foreach from=$cursos item=curso}
                    <div class="accordion" id="accordion{$curso.courseId}">
                        <div class="card">
                            {if $curso.situation eq "Ordinario"}
                                <div class="card-header">
                                    <h2 class="mb-0">
                                        <button
                                            class="btn btn-link {if $curso.status == 'activo'} bg-primary {else} bg-danger {/if} btn-block text-left"
                                            type="button" data-toggle="collapse" data-target="#collapse{$curso.courseId}"
                                            aria-expanded="true" aria-controls="collapse{$curso.courseId}">
                                            <h3>{$curso.majorName} - {$curso.name} [{$curso.group}]</h3>
                                            {if $curso.matricula}
                                                <h4 class="text-center">Matrícula: {$curso.matricula}</h4>
                                            {/if}
                                        </button>
                                    </h2>
                                </div>
                                <div id="collapse{$curso.courseId}" class="collapse" aria-labelledby="headingOne"
                                    data-parent="#accordion{$curso.courseId}">
                                    <div class="card-body">
                                        {foreach from=$curso.calificaciones item=calificaciones key=key}
                                            <div class="row">
                                                <h3 class="w-100">{$curso.tipoCuatri} {$key} {$curso.periodos[$key]}</h3>
                                                <div class="col-12">
                                                    <div class="row"
                                                        style=" padding: 20px 0; background-color: {if $calificaciones@last &&  $curso.status == "inactivo"} #ef5372; {else} #73b760; {/if} font-size: 20px; color: white; border-radius:20px;">
                                                        <div class="col-6 text-center">Materia</div>
                                                        <div class="col-2 text-center">Calificación Acumulada</div>
                                                        <div class="col-2 text-center">Calificación Final</div>
                                                        <div class="col-2 text-center">Descripción</div>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="row" style=" padding: 20px 0; font-size: 18px;">
                                                        {foreach from=$calificaciones item=calificacion}
                                                            <div class="col-6 text-center">{$calificacion.name}</div>
                                                            <div class="col-2 text-center">{$calificacion.addepUp}</div>
                                                            <div class="col-2 text-center">
                                                                {if $calificacion.score < $curso.calificacionMinima && $calificacion.score != 0}
                                                                    <span class="text-danger">{$curso.calificacionMinima-1}</span>
                                                                {elseif $calificacion.score == 0}
                                                                    <span class="text-danger">NP</span>
                                                                {else}
                                                                    {$calificacion.score}
                                                                {/if}
                                                            </div>
                                                            <div class="col-2 text-center">{$calificacion.comments}</div>
                                                        {foreachelse}
                                                            <div class="col-12 text-center">Sin calificaciones</div>
                                                        {/foreach}
                                                    </div>
                                                </div>
                                            </div>
                                        {/foreach}
                                    </div>
                                </div>
                            {/if}
                        </div>
                    </div>
                {/foreach}
            </div>
            <div class="tab-pane fade" id="recursamiento" role="tabpanel" aria-labelledby="recursamiento-tab">
                {foreach from=$cursos item=curso}
                    <div class="accordion" id="accordion{$curso.courseId}">
                        <div class="card">
                            {if $curso.situation != "Ordinario"}
                                <div class="card-header">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse"
                                            data-target="#collapse{$curso.courseId}" aria-expanded="true"
                                            aria-controls="collapse{$curso.courseId}">
                                            <h3>{$curso.majorName} - {$curso.name} [{$curso.group}]</h3>
                                        </button>
                                    </h2>
                                </div>
                                <div id="collapse{$curso.courseId}" class="collapse" aria-labelledby="headingOne"
                                    data-parent="#accordion{$curso.courseId}">
                                    <div class="card-body">
                                        {foreach from=$recursamiento[$curso.courseId]['calificaciones'] item=calificaciones key=key}
                                            <div class="row">
                                                <h3 class="w-100">{$curso.tipoCuatri} {$key}</h3>
                                                <div class="col-12">
                                                    <div class="row"
                                                        style=" padding: 20px; background-color: #73b760; font-size: 20px; color: white; border-radius:20px;">
                                                        <div class="col-6 text-center">Materia</div>
                                                        <div class="col-3 text-center">Calificación</div>
                                                        <div class="col-3 text-center">Descripción</div>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="row" style=" padding: 20px; font-size: 18px;">
                                                        {foreach from=$calificaciones item=calificacion}
                                                            <div class="col-6 text-center">{$calificacion.name}</div>
                                                            <div class="col-3 text-center">{$calificacion.score}</div>
                                                            <div class="col-3 text-center">{$calificacion.comments}</div>
                                                        {/foreach}
                                                    </div>
                                                </div>
                                            </div>
                                        {/foreach}
                                    </div>
                                </div>
                            {/if}
                        </div>
                    </div>
                {/foreach}
            </div>
            <div class="tab-pane fade" id="pagos" role="tabpanel" aria-labelledby="pagos-tab">
                {foreach from=$cursos item=curso}
                    <div class="accordion" id="accordion{$curso.courseId}">
                        <div class="card">
                            {if $curso.situation eq "Ordinario" && count($curso.pagos) > 0}
                                <div class="card-header">
                                    <h2 class="mb-0">
                                        <button
                                            class="btn btn-link {if $curso.status == 'activo'} bg-primary {else} bg-danger {/if} btn-block text-left"
                                            type="button" data-toggle="collapse" data-target="#collapse{$curso.courseId}"
                                            aria-expanded="true" aria-controls="collapse{$curso.courseId}">
                                            <h3>{$curso.majorName} - {$curso.name} [{$curso.group}]</h3>
                                        </button>
                                    </h2>
                                </div>
                                <div id="collapse{$curso.courseId}" class="collapse" aria-labelledby="headingOne"
                                    data-parent="#accordion{$curso.courseId}">
                                    <div class="card-body p-0">
                                        {for $period = 1 to $curso.totalPeriods}
                                            <div class="col-md-12">
                                                <div class="card">
                                                    <div class="card-header bg-dark text-white"><b>{$curso.tipoCuatri} {$period}</b>
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
                                                                        <th>Beca</th>
                                                                        <th>Estatus</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody class="text-center">
                                                                    {foreach from=$curso.pagos['periodicos'] item=itemp name=forFechas}
                                                                        {if $itemp.periodo == $period}
                                                                            {$contador[$itemp.concepto_id] = $contador[$itemp.concepto_id] + 1}
                                                                            <tr
                                                                                {($itemp.fecha_limite < date('Y-m-d') && $itemp.status != 2) ? 'class="alert alert-danger" ' : ""}>
                                                                                <td>
                                                                                    {if count($itemp.cobros) > 0}
                                                                                        <button type="button"
                                                                                            data-cobros="#cobros{$itemp.pago_id}"
                                                                                            class="btn btn-outline-info btn-sm cobros p-2">
                                                                                            <i class="fa fa-plus"></i>
                                                                                        </button>
                                                                                    {/if}
                                                                                </td>
                                                                                <td>{$itemp.concepto_nombre} {$contador[$item.concepto_id]}
                                                                                </td>
                                                                                <td>${$itemp.subtotal|number_format:2:".":","}</td>
                                                                                <td>${$itemp.subtotal * ($itemp.beca / 100)|number_format:2:".":","}
                                                                                </td>
                                                                                <td>${$itemp.total|number_format:2:".":","}</td>
                                                                                <td>${$itemp.total - $itemp.monto|number_format:2:".":","}
                                                                                </td>
                                                                                <td>{$itemp.fecha_cobro}</td>
                                                                                <td>{$itemp.fecha_limite}</td>
                                                                                <td>{$itemp.beca}%</td>
                                                                                <td>{$itemp.status_btn}</td>
                                                                            </tr>
                                                                            {if count($itemp.cobros) > 0}
                                                                                <tr class="d-none" id="cobros{$itemp.pago_id}">
                                                                                    <td colspan="2"></td>
                                                                                    <td colspan="8">
                                                                                        {foreach from=$itemp.cobros item=itemc name=cobros}
                                                                                            <div class="row mb-3">
                                                                                                <div class="col-md-4">
                                                                                                    <label>
                                                                                                        <b>Monto cobrado
                                                                                                            {$smarty.foreach.cobros.iteration}: </b>
                                                                                                        ${$itemc.monto|number_format:2:".":","}
                                                                                                    </label>
                                                                                                </div>
                                                                                                <div class="col-md-4">
                                                                                                    <b>Fecha de pago:</b>{$itemc.fecha_pago}
                                                                                                </div>
                                                                                                <div class="col-md-4">
                                                                                                    {if $itemc.facturado}
                                                                                                        <a href="{$itemc.facturas['pdf']['urlBlank']}"
                                                                                                            target="_blank">
                                                                                                            <i class="fa fa-file-pdf fa-2x"></i>
                                                                                                        </a>
                                                                                                        <a href="{$itemc.facturas['xml']['urlBlank']}"
                                                                                                            target="_blank">
                                                                                                            <i class="fa fa-file-invoice fa-2x"></i>
                                                                                                        </a>
                                                                                                    {else}
                                                                                                        <b>Facturado:</b> No
                                                                                                    {/if}
                                                                                                </div>
                                                                                            </div>
                                                                                        {/foreach}
                                                                                    </td>
                                                                                </tr>
                                                                            {/if}
                                                                        {/if}
                                                                    {/foreach}
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        {/for}
                                        <div class="col-md-12">
                                            <div class="card">
                                                <div class="card-header bg-dark text-white"><b>Otros</b></div>
                                                <div class="card-body">
                                                    <div class="table-responsive">
                                                        <table class="table table-sm">
                                                            <thead>
                                                                <tr class="text-center">
                                                                    <th></th>
                                                                    <th>Concepto</th>
                                                                    <th>Subtotal</th>
                                                                    <th>Total a pagar</th>
                                                                    <th>Monto pendiente</th>
                                                                    <th>Estatus</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody class="text-center">
                                                                {foreach from=$curso.pagos.otros item=itemp name=forFechas}
                                                                    {$contador[$itemp.concepto_id] = $contador[$itemp.concepto_id] + 1}
                                                                    <tr>
                                                                        <td>
                                                                            {if count($itemp.cobros) > 0}
                                                                                <button type="button"
                                                                                    data-cobros="#cobros{$itemp.pago_id}"
                                                                                    class="btn btn-outline-info btn-sm cobros p-2">
                                                                                    <i class="fa fa-plus"></i>
                                                                                </button>
                                                                            {/if}
                                                                        </td>
                                                                        <td>{$itemp.concepto_nombre} {$contador[$item.concepto_id]}
                                                                        </td>
                                                                        <td>${$itemp.subtotal|number_format:2:".":","}</td>
                                                                        <td>${$itemp.total|number_format:2:".":","}</td>
                                                                        <td>${$itemp.total - $itemp.monto|number_format:2:".":","}
                                                                        </td>
                                                                        <td>{$itemp.status_btn}</td>
                                                                    </tr>
                                                                    {if count($itemp.cobros) > 0}
                                                                        <tr class="d-none" id="cobros{$itemp.pago_id}">
                                                                            <td colspan="2"></td>
                                                                            <td colspan="8">
                                                                                {foreach from=$itemp.cobros item=itemc name=cobros}
                                                                                    <div class="row mb-3">
                                                                                        <div class="col-md-3">
                                                                                            <label>
                                                                                                <b>Monto cobrado
                                                                                                    {$smarty.foreach.cobros.iteration}: </b>
                                                                                                ${$itemc.monto|number_format:2:".":","}
                                                                                            </label>
                                                                                        </div>
                                                                                        <div class="col-md-3">
                                                                                            <b>Fecha de pago:</b>{$itemc.fecha_pago}
                                                                                        </div>
                                                                                        <div class="col-md-3">
                                                                                            {if $itemc.facturado}
                                                                                                <a href="{$itemc.facturas['pdf']['urlBlank']}"
                                                                                                    target="_blank">
                                                                                                    <i class="fa fa-file-pdf fa-2x"></i>
                                                                                                </a>
                                                                                                <a href="{$itemc.facturas['xml']['urlBlank']}"
                                                                                                    target="_blank">
                                                                                                    <i class="fa fa-file-invoice fa-2x"></i>
                                                                                                </a>
                                                                                            {else}
                                                                                                <b>Facturado:</b> No
                                                                                            {/if}
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
                            {/if}
                        </div>
                    </div>
                {/foreach}
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