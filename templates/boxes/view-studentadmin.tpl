<div class="card">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-users"></i> Ver Grupo {$tip}
        {if $tip eq "Inactivo"}
            <button type="button" id="btn-close" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
            </button>
        {/if}
    </div>
    <div class="card-body">
        <div id="tblContent" class="table-responsive">
            <div class="text-right form-group">
                {if $User.perfil == "Administrador"}
                    <a href="{$WEB_ROOT}/ajax/new/export.php?curso={$courseId}&page=export-excel" target="_blank" class="btn btn-success">Exportar para G Suite <i class="fa fa-file-excel"></i></a>
                    <form class="form d-inline" id="form_correos" action="{$WEB_ROOT}/ajax/new/studentCurricula.php" method="post">
                        <input type="hidden" name="type" value="cambiarCorreos">
                        <input type="hidden" name="curso" value="{$courseId}">
                        <button type="submit" class="btn-success btn">Cambiar correos <i class="fa fa-envelope"></i></button>
                    </form>
                {/if}
            </div>
            {include file="{$DOC_ROOT}/templates/lists/studentadmin.tpl"}
        </div>
    </div>
</div>