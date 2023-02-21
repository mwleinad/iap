<div class="card">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-check"></i> Historial de calificaciones
        <button type="button" id="btn-close" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
        </button>
    </div>
    <div class="card-body">
        {* <pre>{$calificaciones|@print_r}</pre> *}
        {foreach from=$calificaciones item=calificacion key=key}
            <div class="row">
                <h3 class="w-100">{$tipoCuatri} {$key}</h3> 
                <div class="col-12">
                    <div class="row align-items-center" style="padding: 5px; background-color: #73b760; font-size: 20px; color: white; border-radius:20px 20px 0 0;">
                        <div class="col-6 text-center">Materia</div>
                        <div class="col-2 text-center">Calificación Acumulada</div>
                        <div class="col-2 text-center">Calificación Final</div>
                        <div class="col-2 text-center">Descripción</div> 
                    </div>
                </div>
                <div class="col-12">
                    {foreach from=$calificacion item=item}
                    <div class="row td" style="padding: 10px; font-size: 16px;">
                        <div class="col-6 text-center">{$item.name}</div>
                        <div class="col-2 text-center">{$item.addepUp}</div>
                        <div class="col-2 text-center">{$item.score}</div>
                        <div class="col-2 text-center">{$item.comments}</div>
                    </div>
                    {/foreach} 
                </div>
            </div>
        {/foreach}
    </div>
    <div class="card-footer text-left">
        <form class="form d-inline" action="{$WEB_ROOT}/ajax/new/studentCurricula.php" id="regresarInactivos">
            <input type="hidden" name="type" value="StudentInactivoAdmin">
            <input type="hidden" name="id" value="{$curso}">
            <input type="hidden" name="tip" value="Inactivo">
            <button class="btn btn-primary">
                <i class="fas fa-arrow-left"></i> Regresar
            </button>
        </form>
    </div>
</div>