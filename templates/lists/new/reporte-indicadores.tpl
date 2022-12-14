<div class="row mt-4">
    <h3 class="col-md-12 text-center">INDICADORES GENERALES</h3>
    <div class="col-sm-4 mx-auto">
        <div class="card">
            <div class="card-body p-0">
                <h5 class="card-title">Indicador de Titulación</h5>
                <h5><i class="fa fa-users"></i> Alumnos Totales: {$total_certificate.total}</h5>
                <h5><i class="fa fa-graduation-cap"></i>Alumnos Titulados: {$total_certificate.certificates}</h5>
                <div class="badge badge-info d-block">
                    <h5>Porcentaje de Titulación: {number_format($total_certificate.percentage, 2)}%</h5>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-4 mx-auto">
        <div class="card">
            <div class="card-body p-0">
                <h5 class="card-title">Indicador de Deserción y Eficiencia Terminal</h5>
                <h5><i class="fa fa-users"></i> Alumnos Iniciales: {$total_desertion.total}</h5>
                <h5><i class="fa fa-graduation-cap"></i>Alumnos Desertores: {$total_desertion.desertion}</h5>
                <div class="badge badge-info d-block">
                    <h5>Porcentaje de Deserción: {number_format($total_desertion.percentageDesertion, 2)}%</h5>
                </div>
                <div class="badge badge-success d-block">
                    <h5>Porcentaje de Eficiencia Terminal: {number_format($total_desertion.percentageEffiency, 2)}%</h5>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-4 mx-auto">
        <div class="card">
            <div class="card-body p-0">
                <h5 class="card-title">Indicador de Recursamiento</h5>
                <h5><i class="fa fa-users"></i> Alumnos Activos: {$total_recursion.total}</h5>
                <h5><i class="fa fa-graduation-cap"></i>Alumnos Recursadores: {$total_recursion.recursion}</h5>
                <div class="badge badge-danger d-block">
                    <h5>Porcentaje de Recursión: {number_format($total_recursion.percentage, 2)}%</h5>
                </div>
            </div>
        </div>
    </div>
    {foreach from=$desglose['totalesEnCurso'] item=item key=key}
        {if $tipo != 1}
            <h3 class="col-md-12 text-center mt-5">INDICADORES  [{$item.nivelPosgrado}] - {$item.nombrePosgrado} </h3>
            <h4 class="col-md-12 text-center mb-5">GRUPOS:{$item.grupos}</h4>
        {else}
            <h3 class="col-md-12 text-center mt-5">GRUPO {$item.group}</h3>
        {/if}
        <div class="col-sm-4 mx-auto">
            <div class="card">
                <div class="card-body p-0">
                    <h5 class="card-title">Indicador de Titulación</h5>
                    <h5><i class="fa fa-users"></i> Alumnos Totales: {$item.totalCursando}</h5>
                    <h5><i class="fa fa-graduation-cap"></i>Alumnos Titulados: {if $desglose['totalTitulados'][$key]['totalTitulados'] gt 0}{$desglose['totalTitulados'][$key]['totalTitulados']}{else}0{/if}</h5>
                    <div class="badge badge-info d-block"> 
                        {if $item.totalCursando gt 0}
                            <h5>Porcentaje de Titulación: {number_format(($desglose['totalTitulados'][$key]['totalTitulados'] * 100) / $item.totalCursando, 2)}%</h5>
                        {else}
                            0%
                        {/if}  
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-4 mx-auto">
            <div class="card">
                <div class="card-body p-0">
                    <h5 class="card-title">Indicador de Deserción y Eficiencia Terminal</h5>
                    <h5><i class="fa fa-users"></i> Alumnos Iniciales: {if $desglose['totalInscritos'][$key]['totalInscritos'] gt 0} {$desglose['totalInscritos'][$key]['totalInscritos']} {else} 0 {/if}</h5>
                    <h5><i class="fa fa-graduation-cap"></i>Alumnos Desertores: {if $desglose['totalDesertores'][$key]['totalDesertores'] gt 0} {$desglose['totalDesertores'][$key]['totalDesertores']} {else} 0 {/if}</h5>
                    <div class="badge badge-info d-block">
                        {if $desglose['totalInscritos'][$key]['totalInscritos'] gt 0} 
                            <h5>Porcentaje de Deserción: {number_format((($desglose['totalDesertores'][$key]['totalDesertores'] * 100) / $desglose['totalInscritos'][$key]['totalInscritos']), 2)}%</h5>
                        {else}
                            <h5>Porcentaje de Deserción: 0% </h5>
                        {/if}
                    </div>
                    <div class="badge badge-success d-block">
                        {if $desglose['totalInscritos'][$key]['totalInscritos'] gt 0} 
                            <h5>Porcentaje de Eficiencia Terminal: {number_format((100 - ($desglose['totalDesertores'][$key]['totalDesertores'] * 100) / $desglose['totalInscritos'][$key]['totalInscritos']), 2)}%</h5>
                        {else}
                            <h5>Porcentaje de Deserción: 0% </h5>
                        {/if} 
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-4 mx-auto">
            <div class="card">
                <div class="card-body p-0">
                    <h5 class="card-title">Indicador de Recursamiento</h5>
                    <h5><i class="fa fa-users"></i> Alumnos Activos: {$item.totalCursando}</h5>
                    <h5><i class="fa fa-graduation-cap"></i>Alumnos Recursadores: {if $desglose['totalRecursadores'][$key]['totalRecursadores'] gt 0}{$desglose['totalRecursadores'][$key]['totalRecursadores']}{else}0{/if}</h5>
                    <div class="badge badge-danger d-block">
                    {if $item.totalCursando gt 0} 
                        <h5>Porcentaje deRecursión: {number_format((($desglose['totalRecursadores'][$key]['totalRecursadores'] * 100) / $item.totalCursando), 2)}%</h5>
                    {else}
                        0%
                    {/if} 
                    </div>
                </div>
            </div>
        </div>
    {/foreach}
</div>