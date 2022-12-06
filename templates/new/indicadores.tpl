<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-chart-pie"></i> Indicadores
    </div>
    <div class="card-body text-center">
        <div class="text-right">
            <a href="{$WEB_ROOT}/ajax/indicadores.php?id={$courseId}" target="_blank" class="btn btn-danger">
                <i class="fas fa-file-pdf"></i> Imprimir Indicadores
            </a>
        </div>
        <h4 class="text-left">{$courseInfo.majorName} {$courseInfo.name}</h4>
        <h4 class="text-left"><b>Grupo:</b> {$courseInfo.group}</h4>
        <h4 class="text-left"><b>Período:</b> {$courseInfo.initialDate} - {$courseInfo.finalDate}</h4>
        <h1>Indicador de Titulación</h1><hr>
        <h3><i class="fas fa-users"></i> Alumnos Totales: {$total_certificate.total}</h3>
        <h3><i class="fas fa-graduation-cap"></i> Alumnos Titulados: {$total_certificate.certificates}</h3>
        <span class="badge badge-info">
            <h5><i>Porcentaje de Titulación: {number_format(($total_certificate.certificates * 100) / $total_certificate.total, 2)}%</i></h5>
        </span>

        <br><br><br>
        <h1>Indicador de Deserción y Eficiencia Terminal</h1>
        <h3><i class="fas fa-users"></i> Alumnos Iniciales: {$total_desertion.total}</h3>
        <h3><i class="fas fa-graduation-cap"></i> Alumnos Desertores: {$total_desertion.desertion}</h3>
        <span class="badge badge-info">
            <h5><i>Porcentaje de Deserción: {number_format(($total_desertion.desertion * 100) / $total_desertion.total, 2)}%</i></h5>
        </span>
        <span class="badge badge-success">
            <h5><i>Porcentaje de Eficiencia Terminal: {number_format((100 - ($total_desertion.desertion * 100) / $total_desertion.total), 2)}%</i></h5>
        </span>

        <br><br><br>
        <h1>Indicador de Recursamiento</h1><hr>
        <h3><i class="fas fa-users"></i> Alumnos Activos: {$total_recursion.total}</h3>
        <h3><i class="fas fa-graduation-cap"></i> Alumnos Recursadores: {$total_recursion.recursion}</h3>
        <span class="badge badge-danger">
            <h5><i>Porcentaje de Recursión: {number_format(($total_recursion.recursion * 100) / $total_recursion.total, 2)}%</i></h5>
        </span>
    </div>
</div>