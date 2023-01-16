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
                {foreach from=$cursos item=curso}
                    <div class="accordion" id="accordion{$curso['courseId']}">
                        <div class="card">
                            <div class="card-header">
                                <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse"
                                        data-target="#collapse{$curso['courseId']}" aria-expanded="true" aria-controls="collapse{$curso['courseId']}">
                                        <h3>{$curso['majorName']} - {$curso['name']} [{$curso['group']}]</h3>
                                    </button>
                                </h2>
                            </div>

                            <div id="collapse{$curso['courseId']}" class="collapse" aria-labelledby="headingOne"
                                data-parent="#accordion{$curso['courseId']}">
                                <div class="card-body">
                                    {foreach from=$curso['calificaciones'] item=calificaciones key=key}
                                        <div class="row">
                                            <h3 class="w-100">{$curso['tipoCuatri']} {$key}</h3>    
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
                                                    <div class="col-6 text-center">{$calificacion['name']}</div>
                                                    <div class="col-3 text-center">{$calificacion['score']}</div>
                                                    <div class="col-3 text-center">{$calificacion['comments']}</div>
                                                {/foreach} 
                                                </div>
                                            </div>
                                        </div>
                                    {/foreach}
                                </div>
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>
            <div class="tab-pane fade" id="recursamiento" role="tabpanel" aria-labelledby="recursamiento-tab">
                ...
            </div>
            <div class="tab-pane fade" id="pagos" role="tabpanel" aria-labelledby="pagos-tab">
                ...
            </div>
        </div>
    </div>
</div>