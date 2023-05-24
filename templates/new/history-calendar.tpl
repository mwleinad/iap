<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-cogs"></i> Historial de pagos xd
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
            <form class="form col-md-4 text-right" action="{$WEB_ROOT}/ajax/new/conceptos.php" id="form_modal{$info.majorName}">
                <input type="hidden" name="opcion" value="agregar-pago">
                <input type="hidden" name="alumno" value="{$alumno.userId}">
                <input type="hidden" name="curso" value="{$info.courseId}">
                <button type="submit" class="btn btn-info">Agregar Pago</button>
            </form>
        </div>
        <div class="row">
            {for $period = 1 to $info.totalPeriods}
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
                                            <th>Concepto</th>
                                            <th>Subtotal</th>
                                            <th>Descuento</th>
                                            <th>Total</th>
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
                                                {$contador[$item.concepto_id] = $contador[$item.concepto_id] + 1}
                                                <tr>
                                               
                                                    <td>{$item.concepto_nombre} {$contador[$item.concepto_id]}</td>
                                                    <td>{$item.subtotal}</td>
                                                    <td>{$item.subtotal * ($item.beca / 100)}</td>
                                                    <td>{$item.total}</td>
                                                    <td>{$item.fecha_cobro}</td>
                                                    <td>{$item.fecha_limite}</td>
                                                    <td>{($item.descuento) ? "Sí" : "No"}</td>
                                                    <td>{$item.beca}%</td>
                                                    <td>{$item.status}</td>
                                                    <td>
                                                        <form class="form" action="{$WEB_ROOT}/ajax/new/conceptos.php"
                                                            id="form_pago{$item.pago_id}" method="POST">
                                                            <input type="hidden" name="opcion" value="editar-pago">
                                                            <input type="hidden" name="pago" value="{$item.pago_id}">
                                                            <button type="submmit" class="btn btn-primary">Editar</button>
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
                                        <th>Subtotal</th>
                                        <th>Descuento</th>
                                        <th>Total</th>
                                        <th>¿Aplica Beca?</th>
                                        <th>Beca</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody class="text-center">
                                    {foreach from=$pagos.otros item=item}
                                        <tr>
                                            <td>{$item.concepto_nombre}</td>
                                            <td>{$item.subtotal}</td>
                                            <td>{$item.subtotal * ($item.beca / 100)}</td>
                                            <td>{$item.total}</td>
                                            <td>{($item.descuento) ? "Sí" : "No"}</td>
                                            <td>{$item.beca}%</td>
                                            <td>
                                                <form class="form" action="{$WEB_ROOT}/ajax/new/conceptos.php" id="editar_pago{$item.pago_id}">
                                                    <input type="hidden" name="opcion" value="editar-pago">
                                                    <input type="hidden" name="pago"
                                                        value="{$item.pago_id}">
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