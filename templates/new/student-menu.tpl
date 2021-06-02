<div class="card border border-primary">
    {if $infoStudent.imagen ne ''}
        <img class="card-img-top" src="{$infoStudent.imagen}" alt="" />
    {else}
        <div class="text-center mt-3">
            <i class="fas fa-user-circle fa-6x"></i>
        </div>
    {/if}
    {*<div class="card-header text-center">
        {$User['nombreCompleto']}
    </div>*}
    <ul class="list-group list-group-flush bg-gradient-iap">
        <a href="{$WEB_ROOT}" class="list-group-item list-group-item-action text-white">
            <b>Menú Principal <i class="fas fa-th-large float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/view-modules-student/id/{$id}" class="list-group-item list-group-item-action text-white">
            <b>Anuncios <i class="fas fa-bullhorn float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/information-modules-student/id/{$id}" class="list-group-item list-group-item-action text-white">
            <b>Información <i class="fas fa-info-circle float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/grupo/id/{$id}" class="list-group-item list-group-item-action text-white">
            <b>Grupo <i class="fas fa-chalkboard float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/docente/id/{$id}" class="list-group-item list-group-item-action text-white">
            <b>Asesor <i class="fas fa-chalkboard-teacher float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/calendar-image-modules-student/id/{$id}" class="list-group-item list-group-item-action text-white">
            <b>Calendario <i class="fas fa-calendar-alt float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/calendar-modules-student/id/{$id}" class="list-group-item list-group-item-action text-white">
            <b>Actividades <i class="fas fa-clipboard-list float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/presentation-modules-student/id/{$id}" class="list-group-item list-group-item-action text-white">
            <b>Clase <i class="fas fa-user-friends float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/examen-modules-student/id/{$id}" class="list-group-item list-group-item-action text-white">
            <b>Exámenes <i class="fas fa-tasks float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/resources-modules-student/id/{$id}" class="list-group-item list-group-item-action text-white">
            <b>Recursos de Apoyo <i class="fas fa-folder-open float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/reply-inbox/id/{$id}/cId/0" class="list-group-item list-group-item-action text-white">
            <b>Inbox <i class="fas fa-inbox float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/forum-modules-student/id/{$id}" class="list-group-item list-group-item-action text-white">
            <b>Foro <i class="fas fa-comments float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/team-modules-student/id/{$id}" class="list-group-item list-group-item-action text-white">
            <b>Mi Equipo <i class="fas fa-users float-right"></i></b>
        </a>
        <a href="{$WEB_ROOT}/wiki/index.php/Página_principal" class="list-group-item list-group-item-action text-white">
            <b>Wiki <i class="fab fa-wikipedia-w float-right"></i></b>
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