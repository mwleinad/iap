<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-file-signature"></i> Generar Boleta de Calificaciones
        <a href="{$WEB_ROOT}/ajax/descarga-boletas.php?id={$info.courseId}" target="_blank" class="btn btn-info float-right">
            <i class="fas fa-file-pdf"></i> Reporte de Descargas
        </a>
    </div>
    <div class="card-body">
        {include file="forms/new/qualifications-course.tpl"}
    </div>
</div>