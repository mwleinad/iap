<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-chart-pie"></i> Indicador de Deserción
    </div>
    <div class="card-body text-center">
        <h3><i class="fas fa-users"></i> Alumnos Iniciales: {$total.total}</h3>
        <h3><i class="fas fa-graduation-cap"></i> Alumnos Desertores: {$total.desertion}</h3>
        <span class="badge badge-success"><h3><i>Porcentaje de Deserción: {number_format(($total.desertion * 100) / $total.total, 2)}%</i></h3></span>
    </div>
</div>