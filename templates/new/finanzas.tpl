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
    <div class="col-md-8"></div>
    <div class="col-md-2 ">
        <a class="btn btn-info btn-block" href="{$WEB_ROOT}/datos-fiscales" title="Datos Fiscales">
            Datos Fiscales
            <i class="fa fa-clipboard"></i>
        </a>
    </div>
    <form action="{$WEB_ROOT}/ajax/new/finanzas.php" class="form col-md-2 mb-3 text-center"
        id="form_deposito{$item.courseId}" title="Cuenta para depósito" data-target="#ajax" data-toggle="modal"
        data-width="900">
        <input type="hidden" name="opcion" value="cuenta-deposito">
        <button type="submit" class="btn btn-info btn-block">
            Cuenta para depósito
            <i class="fa fa-piggy-bank"></i>
        </button>
    </form>
</div>
<div class="col-md-12 py-3 card card-img-holder bg-gradient-primary">
    <h3 class="page-title text-white"> Currículas Activas </h3>
</div>
<div id="accordion">
    {foreach from=$activeCourse item=item name=cursos}
        {if count($item.pagos) > 0}
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
                                                                <td>{$itemp.concepto_nombre} {$contador[$item.concepto_id]}</td>
                                                                <td>${$itemp.subtotal|number_format:2:".":","}</td>
                                                                <td>${$itemp.subtotal * ($itemp.beca / 100)|number_format:2:".":","}</td>
                                                                <td>${$itemp.total|number_format:2:".":","}</td>
                                                                <td>${$itemp.total - $itemp.monto|number_format:2:".":","}</td>
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
                                                {* <pre>
                                                    {$item.pagos.otros|print_r}
                                                </pre> *}
                                                {foreach from=$item.pagos.otros item=itemp name=forFechas}
                                                    {$contador[$itemp.concepto_id] = $contador[$itemp.concepto_id] + 1}
                                                    <tr>
                                                        <td>
                                                            {if count($itemp.cobros) > 0}
                                                                <button type="button" data-cobros="#cobros{$itemp.pago_id}"
                                                                    class="btn btn-outline-info btn-sm cobros p-2">
                                                                    <i class="fa fa-plus"></i>
                                                                </button>
                                                            {/if}
                                                        </td>
                                                        <td>{$itemp.concepto_nombre} {$contador[$item.concepto_id]}</td>
                                                        <td>${$itemp.subtotal|number_format:2:".":","}</td>
                                                        <td>${$itemp.total|number_format:2:".":","}</td>
                                                        <td>${$itemp.total - $itemp.monto|number_format:2:".":","}</td>
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