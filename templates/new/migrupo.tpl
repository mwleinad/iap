<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-home"></i>                 
        </span>
        {$myModule.majorName}: {$myModule.subjectName}
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
        <li class="breadcrumb-item active" aria-current="page">
            <span></span>IAP Chiapas
            <i class="mdi mdi-checkbox-marked-circle-outline icon-sm text-primary align-middle"></i>
        </li>
        </ul>
    </nav>
</div>
<div class="row">
    <div class="col-md-3">
        {include file="new/student-menu.tpl"}
    </div>
    <div class="col-md-9">
        <div class="row">
            <div class="col-md-12 mb-3">
                <h3 class="page-title">
                    <span class="page-title-icon bg-gradient-primary text-white mr-2">
                        <i class="mdi mdi-tag"></i>                 
                    </span>
                    <b>Grupo</b>
                </h3>
            </div>
        </div>
        <div class="row">
            {foreach from=$lstGrupo item=item key=key}
                <div class="col-md-3 d-flex align-items-stretch mb-3">
                    <div class="card border border-primary w-100 text-center">
                        <div class="card-body">
                            <a href="{$WEB_ROOT}/graybox.php?page=view-perfil&id={$item.userId}" data-target="#ajax" data-toggle="modal" data-width="1000px">
                                {if $item.rutaFoto eq ''}
                                    <i class="fas fa-user-circle fa-5x"></i>
                                {else}
                                    <img src="{$WEB_ROOT}/alumnos/{$item.rutaFoto}?{$rand}" class="rounded-circle" alt="" style="width: 80px"> 
                                {/if}
                            </a><br>
                            <p class="card-text">{$item.names|upper} {$item.lastNamePaterno|upper} {$item.lastNameMaterno|upper}</p>
                        </div>
                        <div class="card-footer">
                            <a href="{$WEB_ROOT}/graybox.php?page=view-perfil&id={$item.userId}" class="btn btn-outline-primary btn-sm" data-target="#ajax" data-toggle="modal">
                                Ver Perfil
                            </a>
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>
    </div>
</div>