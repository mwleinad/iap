<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-home"></i>
        </span>
        Bienvenido
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
        {include file="new/card_student.tpl"}
    </div>
    <div class="col-md-9">
        <div class="row">
            <div class="col-md-12">
                {if $msjC eq 'si'}
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>El perfil se actualizo correctamente.</strong>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                {/if}
                {if $msjCc eq 'si'}
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>La contraseña se actualizó correctamente.</strong>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                {/if}
            </div>
        </div>
        {* If Actualizado *}
        {if $User.actualizado eq "no"}
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            Actualización de Datos
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Por favor realiza la actualización de tus datos para poder ingresar a
                                todos los módulos de la Plataforma de Educación En Línea...</h5>
                            {include file="{$DOC_ROOT}/templates/forms/new/completo.tpl"}
                        </div>
                    </div>
                </div>
            </div>
        {else}
            <div class="row">
                <div class="col-md-12 mb-3">
                    <h3 class="page-title">
                        <span class="page-title-icon bg-gradient-primary text-white mr-2">
                            <i class="mdi mdi-school"></i>
                        </span>
                        Currícula Activa
                    </h3>
                </div>
                {* CURRICULA ACTIVA *}

                {foreach from=$activeCourses item=subject}
                    <div class="col-md-4 stretch-card grid-margin">
                        <div class="card card-img-holder text-white bg-gradient-primary">
                            <div class="text-center">
                                <a href="{$WEB_ROOT}/modulos-curricula/id/{$subject.courseId}" title="Módulos de la Currícula">
                                    {if $subject.icon eq ''}
                                        <i class="far fa-image fa-6x text-white mt-4"></i>
                                    {else}
                                        <img class="card-img-top" src="{$WEB_ROOT}/images/new/curricula/{$subject.icon}" alt="">
                                    {/if}
                                </a>
                            </div>
                            <div class="card-body">
                                <h4 class="font-weight-normal mb-3">{$subject.majorName}
                                    <i class="fas fa-chalkboard float-right fa-lg"></i>
                                </h4>
                                <p class="mb-3">
                                    {$subject.name}<br>
                                    <small>Grupo: {$subject.group} ({if $subject.modality eq 'Local'}Escolar
                                        {else}No
                                        Escolar{/if})<br>
                                        Periodo: {$subject.initialDate|date_format:"%d-%m-%Y"} -
                                        {$subject.finalDate|date_format:"%d-%m-%Y"}</small><br>
                                    {if $subject.situation eq 'Ordinario'}
                                        <small>Módulos: {$subject.courseModule}</small>
                                    {/if}
                                    {if $subject.situation eq 'Recursador'}
                                        <small>Recursando Materia(s)</small>
                                    {/if}
                                </p>

                                <div class="text-center">
                                    {if $subject.situation eq 'Ordinario'}
                                        <a href="{$WEB_ROOT}/modulos-curricula/id/{$subject.courseId}"
                                            title="Módulos de la Currícula" class="btn btn-outline-light btn-fw btn-sm">
                                            <i class="fas fa-link"></i> Ingresar
                                        </a>
                                    {/if}
                                    {if $subject.situation eq 'Recursador'}
                                        <a href="{$WEB_ROOT}/modulos-recursar/id/{$subject.courseId}"
                                            title="Módulos de la Currícula" class="btn btn-outline-light btn-fw btn-sm">
                                            <i class="fas fa-link"></i> Ingresar
                                        </a>
                                    {/if}<br><br>
                                    <a href="{$WEB_ROOT}/boletas/id/{$subject.courseId}"
                                        class="btn btn-outline-light btn-fw btn-sm">
                                        <i class="far fa-list-alt"></i> Boletas de Calificaciones
                                    </a>
                                    <br><br>
                                    <a href="{$WEB_ROOT}/mi-credencial-digital/id/{$subject.courseId}"
                                        class="btn btn-outline-light btn-fw btn-sm">
                                        <i class="far fa-list-alt"></i> Mi credencial digital
                                    </a> 
                                </div>
                            </div>
                        </div>
                    </div>
                {foreachelse}
                    <div class="col-md-12">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="far fa-frown fa-lg"></i> <strong>¡Lo sentimos!</strong> No Cuentas Con Currícula
                            {$tipo_curricula}.
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </div>
                {/foreach}
            </div>
            <div class="row">
                <div class="col-md-12 mb-3">
                    <h3 class="page-title">
                        <span class="page-title-icon bg-gradient-danger text-white mr-2">
                            <i class="mdi mdi-school"></i>
                        </span>
                        Currícula Inactiva
                    </h3>
                </div>
                {* CURRICULA INACTIVA *}
                {foreach from=$inactiveCourses item=subject}
                    <div class="col-md-4 stretch-card grid-margin">
                        <div class="card card-img-holder text-white bg-gradient-danger">
                            <div class="text-center">
                                <a href="{$WEB_ROOT}/modulos-curricula/id/{$subject.courseId}" title="Módulos de la Currícula">
                                    {if $subject.icon eq ''}
                                        <i class="far fa-image fa-6x text-white mt-4"></i>
                                    {else}
                                        <img class="card-img-top" src="{$WEB_ROOT}/images/new/curricula/{$subject.icon}" alt="">
                                    {/if}
                                </a>
                            </div>
                            <div class="card-body">
                                <h4 class="font-weight-normal mb-3">{$subject.majorName}
                                    <i class="fas fa-chalkboard float-right fa-lg"></i>
                                </h4>
                                <p class="mb-3">
                                    {$subject.name}<br>
                                    <small>Grupo: {$subject.group} ({if $subject.modality eq 'Local'}Escolar
                                        {else}No
                                        Escolar{/if})<br>
                                        Periodo: {$subject.initialDate|date_format:"%d-%m-%Y"} -
                                        {$subject.finalDate|date_format:"%d-%m-%Y"}</small><br>
                                    {if $subject.situation eq 'Ordinario'}
                                        <small>Módulos: {$subject.courseModule}</small>
                                    {/if}
                                    {if $subject.situation eq 'Recursador'}
                                        <small>Recursando Materia(s)</small>
                                    {/if}
                                </p>
                                <div class="text-center">
                                    {* {if $subject.situation eq 'Ordinario'}
                                        <a href="{$WEB_ROOT}/modulos-curricula/id/{$subject.courseId}" title="Módulos de la Currícula" class="btn btn-outline-light btn-fw btn-sm">
                                            <i class="fas fa-link"></i> Ver
                                        </a>
                                    {/if}
                                    {if $subject.situation eq 'Recursador'}
                                        <a href="{$WEB_ROOT}/modulos-recursar/id/{$subject.courseId}" title="Módulos de la Currícula" class="btn btn-outline-light btn-fw btn-sm">
                                            <i class="fas fa-link"></i> Ver
                                        </a>
                                    {/if}<br><br>  *}
                                </div>
                            </div>
                        </div>
                    </div>
                {foreachelse}
                    <div class="col-md-12">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="far fa-smile fa-lg"></i> No Cuentas Con Currículas Inactivas.
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </div>
                {/foreach}
            </div>
            <div class="row">
                <div class="col-md-12 mb-3">
                    <h3 class="page-title">
                        <span class="page-title-icon bg-gradient-info text-white mr-2">
                            <i class="mdi mdi-school"></i>
                        </span>
                        Currícula Finalizada
                    </h3>
                </div>
                {* CURRICULA Finalizada *}
                {foreach from=$finishedCourses item=subject}
                    <div class="col-md-4 stretch-card grid-margin">
                        <div class="card card-img-holder text-white bg-gradient-primary">
                            <div class="text-center">
                                <a href="{$WEB_ROOT}/modulos-curricula/id/{$subject.courseId}" title="Módulos de la Currícula">
                                    {if $subject.icon eq ''}
                                        <i class="far fa-image fa-6x text-white mt-4"></i>
                                    {else}
                                        <img class="card-img-top" src="{$WEB_ROOT}/images/new/curricula/{$subject.icon}" alt="">
                                    {/if}
                                </a>
                            </div>
                            <div class="card-body">
                                <h4 class="font-weight-normal mb-3">{$subject.majorName}
                                    <i class="fas fa-chalkboard float-right fa-lg"></i>
                                </h4>
                                <p class="mb-3">
                                    {$subject.name}<br>
                                    <small>Grupo: {$subject.group} ({if $subject.modality eq 'Local'}Escolar
                                        {else}No
                                        Escolar{/if})<br>
                                        Periodo: {$subject.initialDate|date_format:"%d-%m-%Y"} -
                                        {$subject.finalDate|date_format:"%d-%m-%Y"}</small><br>
                                    {if $subject.situation eq 'Ordinario'}
                                        <small>Módulos: {$subject.courseModule}</small>
                                    {/if}
                                    {if $subject.situation eq 'Recursador'}
                                        <small>Recursando Materia(s)</small>
                                    {/if}
                                </p>
                                {if $User.bloqueado == 0}
                                    <div class="text-center">
                                        {if $subject.situation eq 'Ordinario'}
                                            <a href="{$WEB_ROOT}/modulos-curricula/id/{$subject.courseId}"
                                                title="Módulos de la Currícula" class="btn btn-outline-light btn-fw btn-sm">
                                                <i class="fas fa-link"></i> Ver
                                            </a>
                                        {/if}
                                        {if $subject.situation eq 'Recursador'}
                                            <a href="{$WEB_ROOT}/modulos-recursar/id/{$subject.courseId}"
                                                title="Módulos de la Currícula" class="btn btn-outline-light btn-fw btn-sm">
                                                <i class="fas fa-link"></i> Ver
                                            </a>
                                        {/if}<br><br>
                                        <a href="{$WEB_ROOT}/boletas/id/{$subject.courseId}"
                                            class="btn btn-outline-light btn-fw btn-sm">
                                            <i class="far fa-list-alt"></i> Boletas de Calificaciones
                                        </a>
                                    </div>
                                {/if}
                            </div>
                        </div>
                    </div>
                {foreachelse}
                    <div class="col-md-12">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="far fa-smile fa-lg"></i> No Cuentas Con Currículas Inactivas.
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </div>
                {/foreach}
            </div>
            <div class="row">
                <div class="col-md-12 mb-3">
                    <h3 class="page-title">
                        <span class="page-title-icon bg-gradient-success text-white mr-2">
                            <i class="mdi mdi-view-dashboard"></i>
                        </span>
                        Menú
                    </h3>
                </div>
                {* FINANZAS *}
                <div class="col-md-4 stretch-card grid-margin">
                    <div class="card bg-gradient-success card-img-holder text-white">
                        <div class="text-center">
                            <a href="{$WEB_ROOT}/finanzas">
                                <img class="card-img-top" src="{$WEB_ROOT}/images/new/icons/finanzas.svg" alt="">
                            </a>
                        </div>
                        <div class="card-body">
                            <h4 class="font-weight-normal mb-3">IAP Chiapas
                                <i class="fas fa-dollar-sign float-right fa-lg"></i>
                            </h4>
                            <h2 class="mb-5">Finanzas</h2>
                            <div class="text-center">
                                <a href="{$WEB_ROOT}/finanzas" class="btn btn-outline-light btn-fw btn-sm">
                                    <i class="fas fa-link"></i> Ver
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                {* INBOX *}
                <div class="col-md-4 stretch-card grid-margin">
                    <div class="card bg-gradient-success card-img-holder text-white">
                        <div class="text-center">
                            <a href="{$WEB_ROOT}/inbox/or/h">
                                <img class="card-img-top" src="{$WEB_ROOT}/images/new/icons/inbox.svg" alt="">
                            </a>
                        </div>
                        <div class="card-body">
                            <h4 class="font-weight-normal mb-3">IAP Chiapas
                                <i class="fas fa-envelope float-right fa-lg"></i>
                            </h4>
                            <h2 class="mb-5">Inbox</h2>
                            <div class="text-center">
                                <a href="{$WEB_ROOT}/inbox/or/h" class="btn btn-outline-light btn-fw btn-sm">
                                    <i class="fas fa-link"></i> Ver
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                {* DOCUMENTOS *}
                <div class="col-md-4 stretch-card grid-margin">
                    <div class="card bg-gradient-success card-img-holder text-white">
                        <div class="text-center">
                            <a href="{$WEB_ROOT}/doc-alumno">
                                <img class="card-img-top" src="{$WEB_ROOT}/images/new/icons/documentos.svg" alt="">
                            </a>
                        </div>
                        <div class="card-body">
                            <h4 class="font-weight-normal mb-3">IAP Chiapas
                                <i class="fas fa-file-alt float-right fa-lg"></i>
                            </h4>
                            <h2 class="mb-5">Documentos</h2>
                            <div class="text-center">
                                <a href="{$WEB_ROOT}/doc-alumno" class="btn btn-outline-light btn-fw btn-sm">
                                    <i class="fas fa-link"></i> Ver
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                {* PERSONAL ACADEMICO *}
                <div class="col-md-4 stretch-card grid-margin">
                    <div class="card bg-gradient-success card-img-holder text-white">
                        <div class="text-center">
                            <a href="{$WEB_ROOT}/personal-academico">
                                <img class="card-img-top" src="{$WEB_ROOT}/images/new/icons/personal.svg" alt="">
                            </a>
                        </div>
                        <div class="card-body">
                            <h4 class="font-weight-normal mb-3">IAP Chiapas
                                <i class="fas fa-users float-right fa-lg"></i>
                            </h4>
                            <h2 class="mb-5">Personal Académico</h2>
                            <div class="text-center">
                                <a href="{$WEB_ROOT}/personal-academico" class="btn btn-outline-light btn-fw btn-sm">
                                    <i class="fas fa-link"></i> Ver
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                {* REGLAMENTO GENERAL DE POSGRADO *}
                {if $showRegulation}
                    <div class="col-md-4 stretch-card grid-margin">
                        <div class="card bg-gradient-success card-img-holder text-white">
                            <div class="text-center">
                                <a href="{$WEB_ROOT}/reglamento">
                                    <img class="card-img-top" src="{$WEB_ROOT}/images/new/icons/reglamento.svg" alt="">
                                </a>
                            </div>
                            <div class="card-body">
                                <h4 class="font-weight-normal mb-3">IAP Chiapas
                                    <i class="fas fa-balance-scale float-right fa-lg"></i>
                                </h4>
                                <h2 class="mb-5">Reglamento General de Posgrado</h2>
                                <div class="text-center">
                                    <a href="{$WEB_ROOT}/reglamento" class="btn btn-outline-light btn-fw btn-sm">
                                        <i class="fas fa-link"></i> Ver
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}
                {* ACERVO DIGITAL *}
                <div class="col-md-4 stretch-card grid-margin">
                    <div class="card bg-gradient-success card-img-holder text-white">
                        <div class="text-center">
                            <a href="https://biblioteca.iapchiapas.edu.mx/" target="_blank">
                                <img class="card-img-top" src="{$WEB_ROOT}/images/new/icons/reglamento.svg" alt="">
                            </a>
                        </div>
                        <div class="card-body">
                            <h4 class="font-weight-normal mb-3">IAP Chiapas
                                <i class="fas fa-balance-scale float-right fa-lg"></i>
                            </h4>
                            <h2 class="mb-5">Portal de Acervo Digital</h2>
                            <div class="text-center">
                                <a href="https://biblioteca.iapchiapas.edu.mx/" target="_blank"
                                    class="btn btn-outline-light btn-fw btn-sm">
                                    <i class="fas fa-link"></i> Ver
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        {/if}
    </div>
</div>
<div class="cookies d-none">
    <div class="container" style="background: #fff; border-radius: 20px 20px 0 0;">
        <div class="row">
            <div class="col-md-12">
                <div style=" padding: 20px 40px; text-align: justify; font-size: 18px;">
                    <h5 style="font-size:20px; text-align:center; font-weight: 700;">Esta página web hace uso de cookies
                    </h5>
                    Las cookies necesarias ayudan a hacer una página web utilizable activando funciones básicas como la
                    navegación en la página y el acceso a áreas seguras. La página web no puede funcionar adecuadamente
                    sin estas cookies.
                </div>
            </div>
            <div class="col-md-12 text-center mb-3">
                <button class="btn btn-success" type="button" onclick="aceptarCookies()">Aceptar Cookies</button>
                <a class="btn btn-info" target="_blank" href="https://iapchiapas.edu.mx/aviso_privacidad">Aviso de
                    privacidad</a>
            </div>
        </div>
    </div>
</div>