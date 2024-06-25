<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-cash"></i>
        </span>
        Finanzas
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>IAP Chiapas
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>
<div class="row">
    <div class="col-md-10"></div>
    <div class="col-md-2 mb-3">
        <a class="btn btn-info btn-block" href="{$WEB_ROOT}/datos-fiscales" title="Datos Fiscales">
            Datos Fiscales
            <i class="fa fa-clipboard"></i>
        </a>
    </div>
</div>

{if count($activeCourse) > 0}
    <div class="col-md-12 py-3 card card-img-holder bg-gradient-primary">
        <h3 class="page-title text-white"> Currículas Activas </h3>
    </div>
    <div id="accordion" class="mb-3">
        {foreach from=$activeCourse item=item name=cursos}
            {if count($item.pagos) > 0}
                {$contador = []}
                <div class="card">
                    <div class="card-header" id="headingActive{$smarty.foreach.cursos.iteration}">
                        <h5 class="mb-0 d-flex align-items-center flex-wrap justify-content-between">
                            <button class="btn btn-link text-uppercase" data-toggle="collapse"
                                data-target="#collapseActive{$smarty.foreach.cursos.iteration}"
                                aria-expanded="{($smarty.foreach.cursos.first) ? "true" : "false"}"
                                aria-controls="collapseActive{$smarty.foreach.cursos.iteration}">
                                <b>Currícula:</b>[{$item.majorName}] {$item.name}
                            </button>
                            <div class="d-flex">
                                {if $alumno.referenciaBancaria == ""}
                                    <form action="{$WEB_ROOT}/ajax/new/finanzas.php" class="form text-center"
                                        id="form_deposito{$item.courseId}" title="Cuenta para depósito" data-target="#ajax"
                                        data-toggle="modal" data-width="1200">
                                        <input type="hidden" name="curso" value="{$item.courseId}">
                                        <input type="hidden" name="opcion" value="cuenta-deposito">
                                        <button type="submit" class="btn btn-link px-3">
                                            Cuenta para depósito<br>
                                            <i class="fa fa-piggy-bank"></i>
                                        </button>
                                    </form>
                                {/if}
                                {if !in_array($item.courseId, [167, 168])}
                                    <a href="{$WEB_ROOT}/pdf/calendario-pagos.php?alumno={$User.userId}&curso={$item.courseId}"
                                        class="text-center btn btn-link px-3" target="_blank" title="Descargar Calendario">
                                        Descargar Calendario<br>
                                        <i class="fa fa-download"></i>
                                    </a>
                                    <form action="{$WEB_ROOT}/ajax/new/finanzas.php" class="form text-center"
                                        id="form_pago{$item.courseId}" title="Nuevo Pago" data-target="#ajax" data-toggle="modal"
                                        data-width="500">
                                        <input type="hidden" name="opcion" value="nuevo-pago">
                                        <input type="hidden" name="alumno" value="{$User.userId}">
                                        <input type="hidden" name="curso" value="{$item.courseId}">
                                        <button type="submit" class="btn btn-link px-3">
                                            Solicitar pago<br>
                                            <i class="fa fa-file-invoice-dollar"></i>
                                        </button>
                                    </form>
                                {/if}
                            </div>
                        </h5>
                    </div>

                    <div id="collapseActive{$smarty.foreach.cursos.iteration}"
                        class="collapse {($smarty.foreach.cursos.first) ? "show" : ""}"
                        aria-labelledby="headingActive{$smarty.foreach.cursos.iteration}" data-parent="#accordion">
                        <div class="card-body">
                            {for $period = 1 to $item.totalPeriods}
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-header bg-dark text-white"><b>{$item.tipoCuatri} {$period}</b></div>
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
                                                            {if $alumno.referenciaBancaria != ""}
                                                                <th></th>
                                                            {/if}
                                                        </tr>
                                                    </thead>
                                                    <tbody class="text-center">
                                                        {foreach from=$item.pagos['periodicos'] item=itemp name=forFechas}
                                                            {if $itemp.periodo == $period}
                                                                {$contador[$itemp.concepto_id] = $contador[$itemp.concepto_id] + 1}
                                                                <tr
                                                                    {($itemp.fecha_limite < date('Y-m-d') && !in_array($itemp.status, [2,4])) ? 'class="alert alert-danger" ' : ""}>
                                                                    <td>
                                                                        {if count($itemp.cobros) > 0}
                                                                            <button type="button" data-cobros="#cobros{$itemp.pago_id}"
                                                                                class="btn btn-outline-info btn-sm cobros p-2">
                                                                                <i class="fa fa-plus"></i>
                                                                            </button>
                                                                        {/if}
                                                                    </td>
                                                                    <td data-label="Concepto">{$itemp.concepto_nombre} {$contador[$itemp.concepto_id]}</td>
                                                                    <td data-label="Subtotal">${$itemp.subtotal|number_format:2:".":","}</td>
                                                                    <td data-label="Descuento">${$itemp.subtotal * ($itemp.beca / 100)|number_format:2:".":","}</td>
                                                                    <td data-label="Total a pagar">${$itemp.total|number_format:2:".":","}</td>
                                                                    <td data-label="Monto pendiente">${($itemp.status == 4) ? '0.00' : ($itemp.total - $itemp.monto)|number_format:2:".":","}
                                                                    </td>
                                                                    <td data-label="Fecha cobro">{$itemp.fecha_cobro}</td>
                                                                    <td data-label="Fecha Límite">{$itemp.fecha_limite}</td>
                                                                    <td data-label="Beca">{$itemp.beca}%</td>
                                                                    <td data-label="Estatus">{$itemp.status_btn}</td>
                                                                    {if $alumno.referenciaBancaria != ""}
                                                                        <td>
                                                                            {if !in_array($itemp.status,[2,4])}
                                                                                <div class="btn-group" role="group">
                                                                                    <button type="button" class="btn btn-primary dropdown-toggle"
                                                                                        data-toggle="dropdown" aria-expanded="false">
                                                                                        Realizar pago
                                                                                    </button>
                                                                                    <div class="dropdown-menu">
                                                                                        <a class="dropdown-item"
                                                                                            href="{$WEB_ROOT}/pdf/referencia.php?curso={$item.courseId}&concepto={$itemp.pago_id}&num={$contador[$itemp.concepto_id]}"
                                                                                            target="_blank">En ventanilla</a>
                                                                                        <a class="dropdown-item"
                                                                                            href="{$WEB_ROOT}/pdf/transferencia.php?curso={$item.courseId}&concepto={$itemp.pago_id}&num={$contador[$itemp.concepto_id]}"
                                                                                            target="_blank">Por transferencia</a>

                                                                                        <a class="dropdown-item"
                                                                                            href="{$WEB_ROOT}/pagar/id/{$itemp.pago_id}">Pago en
                                                                                            línea</a>

                                                                                    </div>
                                                                                </div>
                                                                            {/if}
                                                                            {if $itemp.status == 2 && $itemp.beca == 100}
                                                                                <a href="{$WEB_ROOT}/pdf/recibo.php?pago={$itemp.pago_id}"
                                                                                    class="btn btn-sm text-white"
                                                                                    style="background-color: #970000; border-color: #970000;"
                                                                                    target="_blank">
                                                                                    {($itemp.recibo) ? "Ver" : "Generar"} recibo
                                                                                </a>
                                                                            {/if}
                                                                        </td>
                                                                    {/if}
                                                                </tr>
                                                                {if count($itemp.cobros) > 0}
                                                                    <tr class="d-none" id="cobros{$itemp.pago_id}">
                                                                        <td colspan="2"></td>
                                                                        <td colspan="8">
                                                                            {foreach from=$itemp.cobros item=itemc name=cobros}
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
                                                                                        {if $itemc.facturado}
                                                                                            <a href="{$itemc.facturas['pdf']['urlBlank']}" target="_blank">
                                                                                                <i class="fa fa-file-pdf fa-2x"></i>
                                                                                            </a>
                                                                                            <a href="{$itemc.facturas['xml']['urlBlank']}" target="_blank">
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
                                        <div class="table-responsive" style="overflow: inherit;">
                                            <table class="table table-sm">
                                                <thead>
                                                    <tr class="text-center">
                                                        <th></th>
                                                        <th>Concepto</th>
                                                        <th>Subtotal</th>
                                                        <th>Total a pagar</th>
                                                        <th>Monto pendiente</th>
                                                        <th>Estatus</th>
                                                        {if $alumno.referenciaBancaria != ""}
                                                            <th></th>
                                                        {/if}
                                                    </tr>
                                                </thead>
                                                <tbody class="text-center">
                                                    {* <pre>
                                                        {$item.pagos.otros|print_r}
                                                    </pre> *}
                                                    {foreach from=$item.pagos.otros item=itemp name=forFechas}
                                                        {$contador[$itemp.concepto_id] = $contador[$itemp.concepto_id] + 1}
                                                        <tr>
                                                            <td data-label="">
                                                                {if count($itemp.cobros) > 0}
                                                                    <button type="button" data-cobros="#cobros{$itemp.pago_id}"
                                                                        class="btn btn-outline-info btn-sm cobros p-2">
                                                                        <i class="fa fa-plus"></i>
                                                                    </button>
                                                                {/if}
                                                            </td>
                                                            <td data-label="Concepto">{$itemp.concepto_nombre} {$contador[$item.concepto_id]}</td>
                                                            <td data-label="Subtotal">${$itemp.subtotal|number_format:2:".":","}</td>
                                                            <td data-label="Total a pagar">${$itemp.total|number_format:2:".":","}</td>
                                                            <td data-label="Monto pendiente">${$itemp.total - $itemp.monto|number_format:2:".":","}</td>
                                                            <td data-label="Estatus">{$itemp.status_btn}</td>
                                                            {if $alumno.referenciaBancaria != ""}
                                                                <td>
                                                                    {if $itemp.status != 2}
                                                                        <div class="btn-group" role="group">
                                                                            <button type="button" class="btn btn-primary dropdown-toggle"
                                                                                data-toggle="dropdown" aria-expanded="false">
                                                                                Realizar pago
                                                                            </button>
                                                                            <div class="dropdown-menu">
                                                                                <a class="dropdown-item"
                                                                                    href="{$WEB_ROOT}/pdf/referencia.php?curso={$item.courseId}&concepto={$itemp.pago_id}&num={$contador[$itemp.concepto_id]}"
                                                                                    target="_blank">En ventanilla</a>
                                                                                <a class="dropdown-item"
                                                                                    href="{$WEB_ROOT}/pdf/transferencia.php?curso={$item.courseId}&concepto={$itemp.pago_id}&num={$contador[$itemp.concepto_id]}"
                                                                                    target="_blank">Por transferencia</a>
                                                                                <a class="dropdown-item"
                                                                                    href="{$WEB_ROOT}/pagar/id/{$itemp.pago_id}">Pago en
                                                                                    línea</a>
                                                                            </div>
                                                                        </div>
                                                                    {/if}
                                                                </td>
                                                            {/if}
                                                        </tr>
                                                        {if count($itemp.cobros) > 0}
                                                            <tr class="d-none" id="cobros{$itemp.pago_id}">
                                                                <td colspan="2"></td>
                                                                <td colspan="8">
                                                                    {foreach from=$itemp.cobros item=itemc name=cobros}
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
            {/if}
        {foreachelse}
            <div class="card">
                <div class="card-body">
                    Sin datos de pago
                </div>
            </div>
        {/foreach}
    </div>
{/if}

{if count($finishedCourse) > 0}
    <div class="col-md-12 py-3 card card-img-holder bg-gradient-info">
        <h3 class="page-title text-white"> Currículas Finalizadas </h3>
    </div>
    <div id="accordionFinished">
        {foreach from=$finishedCourse item=item name=cursos}
            {if count($item.pagos) > 0}
                {$contador = []}
                <div class="card">
                    <div class="card-header" id="headingFinished{$smarty.foreach.cursos.iteration}">
                        <h5 class="mb-0 d-flex align-items-center flex-wrap justify-content-between">
                            <button class="btn btn-link text-uppercase" data-toggle="collapse"
                                data-target="#collapseFinished{$smarty.foreach.cursos.iteration}"
                                aria-expanded="{($smarty.foreach.cursos.first) ? "true" : "false"}"
                                aria-controls="collapseFinished{$smarty.foreach.cursos.iteration}">
                                <b>Currícula:</b>[{$item.majorName}] {$item.name}
                            </button>
                            <div class="d-flex">
                                <a href="{$WEB_ROOT}/pdf/calendario-pagos.php?alumno={$User.userId}&curso={$item.courseId}"
                                    class="text-center btn btn-link px-3" target="_blank" title="Descargar Calendario">
                                    Descargar Calendario<br>
                                    <i class="fa fa-download"></i>
                                </a>
                                <form action="{$WEB_ROOT}/ajax/new/finanzas.php" class="form text-center"
                                    id="form_pago{$item.courseId}" title="Nuevo Pago" data-target="#ajax" data-toggle="modal"
                                    data-width="500">
                                    <input type="hidden" name="opcion" value="nuevo-pago">
                                    <input type="hidden" name="alumno" value="{$User.userId}">
                                    <input type="hidden" name="curso" value="{$item.courseId}">
                                    <button type="submit" class="btn btn-link px-3">
                                        Solicitar pago<br>
                                        <i class="fa fa-file-invoice-dollar"></i>
                                    </button>
                                </form>
                            </div>
                        </h5>
                    </div>

                    <div id="collapseFinished{$smarty.foreach.cursos.iteration}"
                        class="collapse {($smarty.foreach.cursos.first) ? "show" : ""}"
                        aria-labelledby="headingFinished{$smarty.foreach.cursos.iteration}" data-parent="#accordionFinished">
                        <div class="card-body">
                            {for $period = 1 to $item.totalPeriods}
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-header bg-dark text-white"><b>{$item.tipoCuatri} {$period}</b></div>
                                        <div class="card-body">
                                            <div class="table-responsive" style="overflow: inherit;">
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
                                                            {if $alumno.referenciaBancaria != ""}
                                                                <th></th>
                                                            {/if}
                                                        </tr>
                                                    </thead>
                                                    <tbody class="text-center">
                                                        {foreach from=$item.pagos['periodicos'] item=itemp name=forFechas}
                                                            {if $itemp.periodo == $period}
                                                                {$contador[$itemp.concepto_id] = $contador[$itemp.concepto_id] + 1}
                                                                <tr
                                                                    {($itemp.fecha_limite < date('Y-m-d') && $itemp.status != 2) ? 'class="alert alert-danger" ' : ""}>
                                                                    <td>
                                                                        {if count($itemp.cobros) > 0}
                                                                            <button type="button" data-cobros="#cobros{$itemp.pago_id}"
                                                                                class="btn btn-outline-info btn-sm cobros p-2">
                                                                                <i class="fa fa-plus"></i>
                                                                            </button>
                                                                        {/if}
                                                                    </td>
                                                                    <td>{$itemp.concepto_nombre} {$contador[$itemp.concepto_id]}</td>
                                                                    <td>${$itemp.subtotal|number_format:2:".":","}</td>
                                                                    <td>${$itemp.subtotal * ($itemp.beca / 100)|number_format:2:".":","}</td>
                                                                    <td>${$itemp.total|number_format:2:".":","}</td>
                                                                    <td>${$itemp.total - $itemp.monto|number_format:2:".":","}</td>
                                                                    <td>{$itemp.fecha_cobro}</td>
                                                                    <td>{$itemp.fecha_limite}</td>
                                                                    <td>{$itemp.beca}%</td>
                                                                    <td>{$itemp.status_btn}</td>
                                                                    {if $alumno.referenciaBancaria != ""}
                                                                        <td>
                                                                            {if $itemp.status != 2}
                                                                                <div class="btn-group" role="group">
                                                                                    <button type="button" class="btn btn-primary dropdown-toggle"
                                                                                        data-toggle="dropdown" aria-expanded="false">
                                                                                        Realizar pago
                                                                                    </button>
                                                                                    <div class="dropdown-menu">
                                                                                        <a class="dropdown-item"
                                                                                            href="{$WEB_ROOT}/pdf/referencia.php?curso={$item.courseId}&concepto={$itemp.pago_id}&num={$contador[$itemp.concepto_id]}"
                                                                                            target="_blank">En ventanilla</a>
                                                                                        <a class="dropdown-item"
                                                                                            href="{$WEB_ROOT}/pdf/transferencia.php?curso={$item.courseId}&concepto={$itemp.pago_id}&num={$contador[$itemp.concepto_id]}"
                                                                                            target="_blank">Por transferencia</a>
                                                                                        <a class="dropdown-item"
                                                                                            href="{$WEB_ROOT}/pagar/id/{$itemp.pago_id}">Pago en
                                                                                            línea</a>
                                                                                    </div>
                                                                                </div>
                                                                            {/if}
                                                                        </td>
                                                                    {/if}
                                                                </tr>
                                                                {if count($itemp.cobros) > 0}
                                                                    <tr class="d-none" id="cobros{$itemp.pago_id}">
                                                                        <td colspan="2"></td>
                                                                        <td colspan="8">
                                                                            {foreach from=$itemp.cobros item=itemc name=cobros}
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
                                                                                        {if $itemc.facturado}
                                                                                            <a href="{$itemc.facturas['pdf']['urlBlank']}" target="_blank">
                                                                                                <i class="fa fa-file-pdf fa-2x"></i>
                                                                                            </a>
                                                                                            <a href="{$itemc.facturas['xml']['urlBlank']}" target="_blank">
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
                                        <div class="table-responsive" style="overflow: inherit;">
                                            <table class="table table-sm">
                                                <thead>
                                                    <tr class="text-center">
                                                        <th></th>
                                                        <th scope="col">Concepto</th>
                                                        <th scope="col">Subtotal</th>
                                                        <th scope="col">Total a pagar</th>
                                                        <th scope="col">Monto pendiente</th>
                                                        <th scope="col">Estatus</th>
                                                        {if $alumno.referenciaBancaria != ""}
                                                            <th></th>
                                                        {/if}
                                                    </tr>
                                                </thead>
                                                <tbody class="text-center">
                                                    {* <pre>
                                                        {$item.pagos.otros|print_r}
                                                    </pre> *}
                                                    {foreach from=$item.pagos.otros item=itemp name=forFechas}
                                                        {$contador[$itemp.concepto_id] = $contador[$itemp.concepto_id] + 1}
                                                        <tr>
                                                            <td data-label="">
                                                                {if count($itemp.cobros) > 0}
                                                                    <button type="button" data-cobros="#cobros{$itemp.pago_id}"
                                                                        class="btn btn-outline-info btn-sm cobros p-2">
                                                                        <i class="fa fa-plus"></i>
                                                                    </button>
                                                                {/if}
                                                            </td>
                                                            <td data-label="Concepto">{$itemp.concepto_nombre} {$contador[$item.concepto_id]}</td>
                                                            <td data-labe="Subtotal">${$itemp.subtotal|number_format:2:".":","}</td>
                                                            <td data-label="Total a pagar">${$itemp.total|number_format:2:".":","}</td>
                                                            <td data-label="Monto pendiente">${$itemp.total - $itemp.monto|number_format:2:".":","}</td>
                                                            <td data-label="Estatus">{$itemp.status_btn}
                                                                {($itemp.archivo != "" && $itemp.status == 2) ? "<a class='badge badge-info' target='_blank' href='{$WEB_ROOT}/files/solicitudes/{$itemp.archivo}'>Ver
                                                documento <i class='fa fa-file-pdf'></i></a>" : ""}</td>
                                                            {if $alumno.referenciaBancaria != ""}
                                                                <td data-label="">
                                                                    {if $itemp.status != 2}
                                                                        <div class="btn-group" role="group">
                                                                            <button type="button" class="btn btn-primary dropdown-toggle"
                                                                                data-toggle="dropdown" aria-expanded="false">
                                                                                Realizar pago
                                                                            </button>
                                                                            <div class="dropdown-menu">
                                                                                <a class="dropdown-item"
                                                                                    href="{$WEB_ROOT}/pdf/referencia.php?curso={$item.courseId}&concepto={$itemp.pago_id}&num={$contador[$itemp.concepto_id]}"
                                                                                    target="_blank">En ventanilla</a>
                                                                                <a class="dropdown-item"
                                                                                    href="{$WEB_ROOT}/pdf/transferencia.php?curso={$item.courseId}&concepto={$itemp.pago_id}&num={$contador[$itemp.concepto_id]}"
                                                                                    target="_blank">Por transferencia</a>

                                                                                <a class="dropdown-item"
                                                                                    href="{$WEB_ROOT}/pagar/id/{$itemp.pago_id}">Pago en
                                                                                    línea</a>
                                                                            </div>
                                                                        </div>
                                                                    {/if}
                                                                </td>
                                                            {/if}
                                                        </tr>
                                                        {if count($itemp.cobros) > 0}
                                                            <tr class="d-none" id="cobros{$itemp.pago_id}">
                                                                <td colspan="2"></td>
                                                                <td colspan="8">
                                                                    {foreach from=$itemp.cobros item=itemc name=cobros}
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
                                                                                {if $itemc.facturado}
                                                                                    <a href="{$itemc.facturas['pdf']['urlBlank']}" target="_blank">
                                                                                        <i class="fa fa-file-pdf fa-2x"></i>
                                                                                    </a>
                                                                                    <a href="{$itemc.facturas['xml']['urlBlank']}" target="_blank">
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
                </div>
            {/if}
        {foreachelse}
            <div class="card">
                <div class="card-body">
                    Sin datos de pago
                </div>
            </div>
        {/foreach}
    </div>
{/if}

<style>
    @media screen and (max-width: 780px) {
        .card-body{
            padding: 0 !important;
        }
        table {
            border: 0;
        }

        table caption {
            font-size: 1.3em;
        }

        table thead {
            border: none;
            clip: rect(0 0 0 0);
            height: 1px;
            margin: -1px;
            overflow: hidden;
            padding: 0;
            position: absolute;
            width: 1px;
        }

        table tr {
            border-bottom: 3px solid #ddd;
            display: block;
            margin-bottom: .625em;
        }

        table td {
            border-bottom: 1px solid #ddd;
            display: block;
            font-size: .8em;
            text-align: right;
        }

        table td::before {
            content: attr(data-label);
            float: left;
            font-weight: bold;
            text-transform: uppercase;
        }

        table td:last-child {
            border-bottom: 0;
        }
    }
</style>