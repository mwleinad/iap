<div class="row">
    <div class="col-md-12">
        <div class="card border border-success">
            <div class="card-header bg-success text-white">
                <h4><b>Curricula:</b> [{$courseInfo.majorName}] {$courseInfo.name}</h4>
                {if $courseInfo.totalPeriods > 0}
                    <h4><b>Total de {$courseInfo.tipoCuatri}: </b> {$courseInfo.totalPeriods}</h4>
                {/if}<br>
            </div>
            <div class="card-body">
                <table class="table table-hover">
                    <tbody>
                        {for $period = 1 to $courseInfo.totalPeriods}
                            <tr>
                                <td><b>{$courseInfo.tipoCuatri} {$period}</b></td>
                                <td>
                                    {if array_key_exists($period, $qualifications)}
                                        {if $evaluations[$period]}
                                            {if $qualifications[$period]['downloaded'] eq 1}
                                                <a href="{$WEB_ROOT}/ajax/boleta-calificacion.php?id={$qualifications[$period]['id']}" target="_blank" class="btn btn-outline-info" title="Descargar Boleta de Calificaciones">
                                                    <i class="fas fa-file-download"></i> Descargar Boleta
                                                </a>
                                            {else}
                                                <a href="javascript:;" onclick="DownloadQualifications({$qualifications[$period]['id']}, {$period}, '{$courseInfo['majorName']} EN {$courseInfo['name']}')" class="btn btn-outline-primary" title="Descargar Boleta de Calificaciones">
                                                    <i class="fas fa-file-download"></i> Descargar Boleta
                                                </a> 
                                            {/if}
                                        {else}
                                            <p class="text-danger">Para descargar la boleta debes contestar todas las Evaluaciones Docente.</p>
                                        {/if}
                                    {else}
                                        Por el momento la boleta no está disponible.
                                    {/if}
                                </td>
                            </tr>
                        {/for}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>