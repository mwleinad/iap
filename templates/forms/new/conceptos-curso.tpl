{if $opcion eq "conceptos-curso"}
    <div class="card mb-4">
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
                                                            <form class="form" action="{$WEB_ROOT}/ajax/new/conceptos.php"
                                                                id="form_concepto_curso{$item.concepto_course_id}">
                                                                <input type="hidden" name="opcion" value="editar-curso-concepto">
                                                                <input type="hidden" name="concepto-curso"
                                                                    value="{$item.concepto_course_id}">
                                                                <button type="submit" class="btn btn-primary">Editar</button>
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
                                                    <form class="form" action="{$WEB_ROOT}/ajax/new/conceptos.php"
                                                        id="form_concepto_curso{$item.concepto_course_id}">
                                                        <input type="hidden" name="opcion" value="editar-curso-concepto">
                                                        <input type="hidden" name="concepto-curso"
                                                            value="{$item.concepto_course_id}">
                                                        <button type="submit" class="btn btn-primary">Editar</button>
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
            </div>
        </div>
    </div>
{/if}

{if $opcion eq "actualizar-curso-concepto"}
    <div class="card mb-4">
        <div class="card-header bg-primary text-white">
            <i class="fas fa-cogs"></i> Edición de concepto
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-12">
                    <form class="form row" id="form_modal_concepto" action="{$WEB_ROOT}/ajax/new/conceptos.php"
                        method="POST">
                        <input type="hidden" name="concepto_curso" value="{$concepto.concepto_course_id}">
                        <input type="hidden" name="opcion" value="{$opcion}"> 
                        <div class="col-md-4 form-group {($concepto.fecha_cobro == "") ? "d-none" : ""}">
                            <label>Fecha de cobro</label>
                            <input type="text" class="form-control i-calendar" id="fecha_cobro" name="fecha_cobro"
                                value="{$concepto.fecha_cobro}">
                        </div>
                        <div class="col-md-4 form-group {($concepto.fecha_cobro == "") ? "d-none" : ""}">
                            <label>Fecha Límite</label>
                            <input type="text" class="form-control i-calendar" id="fecha_limite" name="fecha_limite"
                                value="{$concepto.fecha_limite}">
                        </div>
                        <div class="col-md-4 form-group {($concepto.fecha_cobro == "") ? "d-none" : ""}">
                            <label>Periodo</label>
                            <input type="number" class="form-control" id="periodo" name="periodo"
                                value="{$concepto.periodo}">
                        </div>

                        <div class="col-md-4 form-group">
                            <label>Costo</label>
                            <input type="text" name="costo" id="costo" class="form-control" value="{$concepto.total}">
                        </div>
                        <div class="col-md-4 form-group">
                            <label>¿Aplica beca?</label>
                            <select class="form-control" id="beca" name="beca">
                                <option value="1">Sí</option>
                                <option value="0" {($concepto.descuento == 0) ? "selected" : ""}>No</option>
                            </select>
                        </div>
                        <div class="col-12 mb-3 text-center">
                            <button type="submit" class="btn btn-success">Actualizar</button>
                            {if $calendario}
                                <button type="button" data-dismiss="modal" class="btn btn-danger">Cerrar</button>
                                <input type="hidden" name="calendario" value="true">
                            {else}
                                <a class="btn btn-danger ajax_sin_form" href="{$WEB_ROOT}/ajax/new/conceptos.php"
                                    data-data='"opcion":"conceptos-curso","curso":"{$concepto.course_id}"'>Regresar</a>
                            {/if}
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        flatpickr('.i-calendar', {
            dateFormat: "Y-m-d"
        });
    </script>
{/if}