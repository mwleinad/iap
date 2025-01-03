<div class="card">
    {if $myModule.icon ne ''}
        <img src="{$WEB_ROOT}/images/new/modulos/{$myModule.icon}" class="card-img-top" alt="" />
    {else}
        <img src="{$WEB_ROOT}/images/logos/logo-humanismo.webp" class="card-img-top" alt="logo IAP Humanismo" />
    {/if}
    {*<div class="card-header text-center">
        {$User['nombreCompleto']}
    </div>*}
    <ul class="list-group list-group-flush bg-gradient-iap">
        <a href="{$WEB_ROOT}" class="list-group-item list-group-item-action text-white">
            <b>Menú Principal <i class="fas fa-th-large float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/view-modules-student/id/{$id}" class="list-group-item list-group-item-action text-white {($page == "view-modules-student") ? "active" : ""}">
            <b>Anuncios <i class="fas fa-bullhorn float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/information-modules-student/id/{$id}" class="list-group-item list-group-item-action text-white {($page == "information-modules-student") ? "active" : ""}">
            <b>Información <i class="fas fa-info-circle float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/migrupo/id/{$id}" class="list-group-item list-group-item-action text-white {($page == "migrupo") ? "active" : ""}">
            <b>Grupo <i class="fas fa-chalkboard float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/docente/id/{$id}" class="list-group-item list-group-item-action text-white {($page == "docente") ? "active" : ""}">
            <b>Asesor <i class="fas fa-chalkboard-teacher float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/calendar-image-modules-student/id/{$id}" class="list-group-item list-group-item-action text-white  {($page == "calendar-image-modules-student") ? "active" : ""}">
            <b>Calendario <i class="fas fa-calendar-alt float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/calendar-modules-student/id/{$id}" class="list-group-item list-group-item-action text-white {($page == "calendar-modules-student") ? "active" : ""}">
            <b>Actividades <i class="fas fa-clipboard-list float-right"></i></b>
        </a>
        {* <a href="{$WEB_ROOT}/examen-modules-student/id/{$id}" class="list-group-item list-group-item-action text-white">
            <b>Exámenes <i class="fas fa-tasks float-right"></i></b>
        </a> *}
        <a href="{$WEB_ROOT}/resources-modules-student/id/{$id}" class="list-group-item list-group-item-action text-white {($page == "resources-modules-student") ? "active" : ""}">
            <b>Recursos de Apoyo <i class="fas fa-folder-open float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/reply-inbox/id/{$id}/cId/0" target="_blank" class="list-group-item list-group-item-action text-white {($page == "reply-inbox") ? "active" : ""}">
            <b>Inbox <i class="fas fa-inbox float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/forum-modules-student/id/{$id}" class="list-group-item list-group-item-action text-white {($page == "forum-modules-student") ? "active" : ""}">
            <b>Foro <i class="fas fa-comments float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/team-modules-student/id/{$id}" class="list-group-item list-group-item-action text-white {($page == "team-modules-student") ? "active" : ""}">
            <b>Mi Equipo <i class="fas fa-users float-right"></i></b>
        </a>
    </ul>
    <div class="card-footer text-center">
        <a href="https://www.iapchiapas.edu.mx" target="_blank">
            <i class="fas fa-link"></i> iapchiapas.edu.mx
        </a><br><br>
        <a href="https://www.facebook.com/IAPChiapas" target="_blank">
            <i class="fab fa-facebook"></i> IAPChiapas
        </a>
    </div>
</div>