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
            <form action="{$WEB_ROOT}/ajax/new/conceptos.php" method="POST" class="form" id="form_agregar_conceptos">
                <input type="hidden" name="opcion" value="agregar_conceptos_curso">
                <input type="hidden" name="curso" value="{$courseId}">
                <button type="submit" class="btn btn-info float-right" data-target="#ajax" data-toggle="modal">
                    <i class="fas fa-plus"></i> Agregar
                </button>
            </form>
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
                                                    {$contador[$item.concepto_id] = $contador[$item.concepto_id] + 1}
                                                    <tr>
                                                        <td>{$item.concepto_nombre} {$contador[$item.concepto_id]}</td>
                                                        <td>{$item.total}</td>
                                                        <td>{$item.fecha_cobro}</td>
                                                        <td>{$item.fecha_limite}</td>
                                                        <td>{($item.descuento) ? "Sí" : "No"}</td>
                                                        <td>
                                                            <form class="form" action="{$WEB_ROOT}/ajax/new/conceptos.php" id="form_edicion{$item.concepto_course_id}">
                                                                <input type="hidden" name="opcion" value="editar-curso-concepto">
                                                                <input type="hidden" name="calendario" value="true">
                                                                <input type="hidden" name="concepto-curso"
                                                                    value="{$item.concepto_course_id}">
                                                                <button class="btn btn-primary" type="submit" data-toggle="modal" data-target="#ajax">Editar</button>
                                                            </form>
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
                                                    <form class="form" action="{$WEB_ROOT}/ajax/new/conceptos.php" id="form_edicion{$item.concepto_course_id}">
                                                        <input type="hidden" name="calendario" value="true">
                                                        <input type="hidden" name="opcion" value="editar-curso-concepto">
                                                        <input type="hidden" name="concepto-curso"
                                                            value="{$item.concepto_course_id}">
                                                        <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#ajax">Editar</button>
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