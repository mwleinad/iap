<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-cogs"></i> Configuración del Examen
        <a href="{$WEB_ROOT}/edit-modules-course/id/{$activity.courseModuleId}" class="btn btn-info btn-sm float-right">
            Regresar al Módulo
        </a>
    </div>
    <div class="card-body">
        {include file="boxes/status_no_ajax.tpl"}                                 
        <div id="tblContent" class="table-responsive">	
            {include file="{$DOC_ROOT}/templates/forms/configurar-examen.tpl"}
        </div>
    </div>
</div>