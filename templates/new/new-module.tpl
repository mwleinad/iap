<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-project-diagram"></i> Nuevo módulo para {$subject.name} | <a href="{$WEB_ROOT}/index_new.php?page=subject" class="btn btn-info btn-sm float-right"><i class="fas fa-arrow-left"></i> Regresar</a>
    </div>
    <div class="card-body" style="max-height: 700px; overflow: scroll;">
        {include file="forms/new/add-module.tpl"}
    </div>
</div>