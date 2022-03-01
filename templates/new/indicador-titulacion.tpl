<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-chart-pie"></i> Indicador de Titulación
    </div>
    <div class="card-body text-center">
        <h3><i class="fas fa-users"></i> Alumnos Totales: {$total.total}</h3>
        <h3><i class="fas fa-graduation-cap"></i> Alumnos Titulados: {$total.certificates}</h3>
        <span class="badge badge-success"><h3><i>Porcentaje de Titulación: {number_format(($total.certificates * 100) / $total.total, 2)}%</i></h3></span>
    </div>
</div>