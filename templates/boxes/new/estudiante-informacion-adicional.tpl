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
                <h3 class="text-center my-3">{$infoStudent.names} {$infoStudent.lastNamePaterno} {$infoStudent.lastNameMaterno}</h3>
                {foreach from=$cursos item=curso}
                    <div class="accordion" id="accordion{$curso.courseId}">
                        <div class="card"> 
                            {if $curso.situation eq "Ordinario"}
                            <div class="card-header">
                                <h2 class="mb-0">
                            <button class="btn btn-link {if $curso.status == 'activo'} bg-primary {else} bg-danger {/if} btn-block text-left" type="button" data-toggle="collapse"
                                        data-target="#collapse{$curso.courseId}" aria-expanded="true" aria-controls="collapse{$curso.courseId}">
                                        <h3>{$curso.majorName} - {$curso.name} [{$curso.group}]</h3>
                                    </button>
                                </h2>
                            </div>
                            <div id="collapse{$curso.courseId}" class="collapse" aria-labelledby="headingOne"
                                data-parent="#accordion{$curso.courseId}">
                                <div class="card-body">
                                    {foreach from=$curso.calificaciones item=calificaciones key=key}
                                        <div class="row">
                                            <h3 class="w-100">{$curso.tipoCuatri} {$key}</h3>    
                                            <div class="col-12">
                                                <div class="row" style=" padding: 20px 0; background-color: {if $calificaciones@last &&  $curso.status == "inactivo"} #ef5372; {else} #73b760; {/if} font-size: 20px; color: white; border-radius:20px;">
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
                                    data-target="#collapse{$curso.courseId}" aria-expanded="true" aria-controls="collapse{$curso.courseId}">
                                    <h3>{$curso.majorName} - {$curso.name} [{$curso.group}]</h3>
                                </button>
                            </h2>
                        </div>
                        <div id="collapse{$curso.courseId}" class="collapse" aria-labelledby="headingOne"
                            data-parent="#accordion{$curso.courseId}">
                            <div class="card-body">
                                {foreach from=$curso.calificacionesRepeat item=calificaciones key=key}
                                    <div class="row">
                                        <h3 class="w-100">{$curso.tipoCuatri} {$key}</h3>    
                                        <div class="col-12">
                                            <div class="row" style=" padding: 20px; background-color: #73b760; font-size: 20px; color: white; border-radius:20px;">
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
                        <div class="card-header">
                            <h2 class="mb-0">
                                <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse"
                                    data-target="#collapse{$curso.courseId}" aria-expanded="true" aria-controls="collapse{$curso.courseId}">
                                    <h3>{$curso.majorName} {$curso.name} - [{$curso.group}]</h3>
                                </button>
                            </h2>
                        </div>
                        <div id="collapse{$curso.courseId}" class="collapse" aria-labelledby="headingOne"
                            data-parent="#accordion{$curso.courseId}">
                            <div class="card-body">
                                {if $curso.totalPeriods > 0}
                                    <h4><b>Total {$curso.tipoCuatri}: </b> {$curso.totalPeriods}</h4>
                                {/if}
                                {for $period = 1 to $curso.totalPeriods}
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header bg-dark text-white">
                                                <b>{$curso.tipoCuatri} {$period}</b>
                                            </div>
                                            <div class="card-body">
                                                <div class="table-responsive">
                                                    <table class="table table-sm">
                                                        <thead>
                                                            <tr class="text-center">
                                                                <th>Concepto</th>
                                                                <th>Fecha de Pago</th>
                                                                <th>Monto Sin Beca</th>
                                                                <th>Porcentaje de Beca</th>
                                                                <th>Total a Pagar</th>
                                                                <th>Estatus</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        {foreach from=$curso.distribution[$period] item=item}
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
                                                                    <select class="form-control" name="payments[{$item['calendarDistributionId']}]">
                                                                        <option {if $item['paid'] eq 1} selected {/if} value="1">Pagado</option>
                                                                        <option {if $item['paid'] eq 0} selected {/if} value="0">Pendiente</option>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                        {foreachelse}
                                                            <tr>
                                                                <td colspan="6" class="text-center">
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
                        </div>
                    </div>
                </div>
            {/foreach} 
            </div>
        </div>
    </div>
</div>
