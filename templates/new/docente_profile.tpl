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
        <div class="card">
            {if $fotoPj ne ''}
                <img class="card-img-top" src="{$fotoPj}" alt="" />
            {else}
                <div class="text-center mt-3">
                    <i class="fas fa-user-circle fa-6x"></i>
                </div>
            {/if}
            <div class="card-body">
                <h5 class="card-title text-center">
                    {$User.username}<br>
                    <span class="bg-info px-1 rounded text-white mt-4"><small>DOCENTE</small></span>
                </h5>
                <p class="card-text">El <b>Instituto de Administración Pública del Estado de Chiapas, A. C.</b> te da la más cordial bienvenida a nuestro Sistema de Educación en Línea.</p>
            </div>
            <div class="card-footer text-center">
                <a href="https://www.iapchiapas.edu.mx" target="_blank">
                    <i class="fas fa-link"></i> iapchiapas.edu.mx
                </a><br><br>
                <a href="https://www.facebook.com/IAPChiapas" target="_blank">
                    <i class="fab fa-facebook"></i> IAPChiapas
                </a>
            </div>
        </div>
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
        <div class="row">
            <div class="col-md-12 mb-3">
                <h3 class="page-title">
                    <span class="page-title-icon bg-gradient-success text-white mr-2">
                        <i class="mdi mdi-view-dashboard"></i>                 
                    </span>
                    Menú
                </h3>
            </div>
            {* CURRICULA *}
            <div class="col-md-4 stretch-card grid-margin">
                <div class="card bg-gradient-success card-img-holder text-white">
                    <div class="text-center">
                        <a href="{$WEB_ROOT}/history-subject">
                            <img class="card-img-top" src="{$WEB_ROOT}/images/new/icons/" alt="">
                        </a>
                    </div>
                    <div class="card-body">
                        <h4 class="font-weight-normal mb-3">IAP Chiapas
                            <i class="fas fa-list-ul float-right fa-lg"></i>
                        </h4>
                        <h2 class="mb-5">Currícula</h2>
                        <div class="text-center">
                            <a href="{$WEB_ROOT}/history-subject" class="btn btn-outline-light btn-fw btn-sm">
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
                        <a href="{$WEB_ROOT}/doc-docente">
                            <img class="card-img-top" src="{$WEB_ROOT}/images/new/icons/" alt="">
                        </a>
                    </div>
                    <div class="card-body">
                        <h4 class="font-weight-normal mb-3">IAP Chiapas
                            <i class="fas fa-file-alt float-right fa-lg"></i>
                        </h4>
                        <h2 class="mb-5">Documentos</h2>
                        <div class="text-center">
                            <a href="{$WEB_ROOT}/doc-docente" class="btn btn-outline-light btn-fw btn-sm">
                                <i class="fas fa-link"></i> Ver
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            {* REPOSITORIO *}
            {if $showRegulation}
                <div class="col-md-4 stretch-card grid-margin">
                    <div class="card bg-gradient-success card-img-holder text-white">
                        <div class="text-center">
                            <a href="{$WEB_ROOT}/repositorio">
                                <img class="card-img-top" src="{$WEB_ROOT}/images/new/icons/" alt="">
                            </a>
                        </div>
                        <div class="card-body">
                            <h4 class="font-weight-normal mb-3">IAP Chiapas
                                <i class="fas fa-folder-open float-right fa-lg"></i>
                            </h4>
                            <h2 class="mb-5">Repositorio</h2>
                            <div class="text-center">
                                <a href="{$WEB_ROOT}/repositorio" class="btn btn-outline-light btn-fw btn-sm">
                                    <i class="fas fa-link"></i> Ver
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
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
        </div>
    </div>
</div>











{*
<div class="row">
    <div class="col-md-12">
        <!-- END BEGIN PROFILE SIDEBAR -->
        <!-- BEGIN PROFILE CONTENT -->
        <div class="profile-content">
            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN PORTLET -->
                    <div class="portlet light ">
                        <div class="portlet-title tabbable-line">
                            <div class="caption caption-md">
                                <i class="icon-globe theme-font hide"></i>
                                <span class="caption-subject font-blue-madison bold uppercase">Bitácora</span>
                            </div>
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#tab_1_1" data-toggle="tab"> Notificaciones </a>
                                </li>
								<!--
                                <li >
                                    <a href="#tab_1_2" data-toggle="tab"> Avisos </a>
                                </li>-->
                            </ul>
                        </div>
                        <div class="portlet-body">
                            <!--BEGIN TABS-->
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab_1_1">
                                    <div class="scroller" style="height: 337px;" data-always-visible="1" data-rail-visible1="0" data-handle-color="#D7DCE2">
                                        <ul class="feeds">
										
                                            {foreach from=$notificaciones item=reply}
                                                {if $reply.vistaPermiso==1}

                                                <li>
                                                <a href="{$WEB_ROOT}{$reply.enlace}">
                                                    <div class="col1">
                                                        <div class="cont">
                                                            <div class="cont-col1">
                                                                <div class="label label-sm label-success">
                                                                    <i class="fa fa-bell-o"></i>
                                                                </div>
                                                            </div>
                                                            <div class="cont-col2">
                                                                <div class="desc">
                                                                    {$reply.actividad} por {$reply.nombre}
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col2">
                                                        <div class="date"> {$reply.fecha_aplicacion|date_format:"%d %b '%y"} </div>
                                                    </div>
                                                </a>
                                            </li>
                                                {/if}
                                            {/foreach}
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!--END TABS-->
                        </div>
                    </div>
                    <!-- END PORTLET -->
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                </div>
            </div>
        </div>
        <!-- END PROFILE CONTENT -->
    </div>
</div>
*}