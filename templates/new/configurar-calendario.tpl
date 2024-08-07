<div id="calendario-pagos">
    <div class="page-header">
        <h3 class="page-title">
            <span class="page-title-icon bg-gradient-primary text-white mr-2">
                <i class="mdi mdi-cash"></i>
            </span>
            Configurar Calendario
        </h3>
        <nav aria-label="breadcrumb">
            <ul class="breadcrumb">
                <li class="breadcrumb-item active" aria-current="page">
                    <span></span>Cobranza
                    <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
                </li>
            </ul>
        </nav>
    </div>

    <div class="card">
        <div class="card-header bg-primary text-white">
            <i class="fas fa-cogs"></i> Configurar Calendario

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
            <div class="row">
                {if count($conceptos.periodicos) > 0 || count($conceptos.otros) > 0}
                    {for $period = 1 to $info.totalPeriods}
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header bg-dark text-white"><b>{$info.tipoCuatri} {$period}</b></div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-sm">
                                            <thead>
                                                <tr class="text-center">
                                                    <th>Concepto</th>
                                                    <th>Monto</th>
                                                    <th>Fecha Cobro</th>
                                                    <th>Fecha Límite</th>
                                                    <th>¿Aplica Beca?</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody class="text-center">
                                                {foreach from=$conceptos.periodicos item=item name=forFechas}
                                                    {if $item.periodo == $period} 
                                                        <tr>
                                                            <td>{$item.concepto_nombre} {$item.indice}</td>
                                                            <td>${$item.total|number_format:2:".":","} {$total = $item.total + $total}
                                                            </td>
                                                            <td>{$item.fecha_cobro}</td>
                                                            <td>{$item.fecha_limite}</td>
                                                            <td>{($item.descuento) ? "Sí" : "No"}</td>
                                                            <td>
                                                                <form class="form d-inline" action="{$WEB_ROOT}/ajax/new/conceptos.php"
                                                                    id="form_edicion{$item.concepto_course_id}">
                                                                    <input type="hidden" name="opcion" value="editar-curso-concepto">
                                                                    <input type="hidden" name="calendario" value="true">
                                                                    <input type="hidden" name="concepto-curso"
                                                                        value="{$item.concepto_course_id}">
                                                                    <button class="btn btn-primary" type="submit" data-toggle="modal"
                                                                        data-target="#ajax">Editar</button>
                                                                </form>
                                                                <form class="form d-inline" action="{$WEB_ROOT}/ajax/new/conceptos.php"
                                                                    id="form_eliminacion{$item.concepto_course_id}" data-alert=true data-mensaje="Los cambios solo serán aplicados a conceptos sin cobros.">
                                                                    <input type="hidden" name="opcion" value="eliminar-curso-concepto">
                                                                    <input type="hidden" name="calendario" value="true">
                                                                    <input type="hidden" name="concepto_curso"
                                                                        value="{$item.concepto_course_id}">
                                                                    <button class="btn btn-danger">Eliminar</button>
                                                                </form>
                                                            </td>
                                                        </tr>
                                                    {/if}
                                                {/foreach}
                                            </tbody>
                                            <tfoot class="text-center">
                                                <tr>
                                                    <td>Costo Total:</td>
                                                    <td>${$total|number_format:2:".":","} {$total = 0}</td>
                                                    <td colspan="4"></td>
                                                </tr>
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
                                                <th>Concepto</th>
                                                <th>Monto</th>
                                                <th>¿Aplica Beca?</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody class="text-center">
                                            {foreach from=$conceptos.otros item=item}
                                                <tr>
                                                    <td>{$item.concepto_nombre}</td>
                                                    <td>{$item.total}</td>
                                                    <td>{($item.descuento) ? "Sí" : "No"}</td>
                                                    <td>
                                                        <form class="form" action="{$WEB_ROOT}/ajax/new/conceptos.php"
                                                            id="form_edicion{$item.concepto_course_id}">
                                                            <input type="hidden" name="calendario" value="true">
                                                            <input type="hidden" name="opcion" value="editar-curso-concepto">
                                                            <input type="hidden" name="concepto-curso"
                                                                value="{$item.concepto_course_id}">
                                                            <button type="submit" class="btn btn-primary" data-toggle="modal"
                                                                data-target="#ajax">Editar</button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            {/foreach}
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                {else}
                    <div class="col-md-12">
                        <h4>
                            Sin conceptos
                        </h4>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>