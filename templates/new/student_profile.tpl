{*<div class="row">
    <div class="col-12">
        <span class="d-flex align-items-center purchase-popup">
            <p>Like what you see? Check out our premium version for more.</p>
            <a href="#" target="_blank" class="btn ml-auto download-button">Download Free Version</a>
            <a href="#" target="_blank" class="btn purchase-button">Upgrade To Pro</a>
            <i class="mdi mdi-close popup-dismiss"></i>
        </span>
    </div>
</div>*}
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
            {if $infoStudent.imagen ne ''}
                <img class="card-img-top" src="{$infoStudent.imagen}" alt="" />
            {else}
                <div class="text-center mt-3">
                    <i class="fas fa-user-circle fa-6x"></i>
                </div>
            {/if}
            <div class="card-body">
                <h5 class="card-title text-center">{$User['nombreCompleto']}</h5>
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
                    <span class="page-title-icon bg-gradient-primary text-white mr-2">
                        <i class="mdi mdi-school"></i>                 
                    </span>
                    Currícula {$tipo_curricula}
                </h3>
            </div>
            {* CURRICULA ACTIVA *}
            {foreach from=$activeCourses item=subject}
                <div class="col-md-4 stretch-card grid-margin">
                    <div class="card card-img-holder text-white {if $tipo_curricula eq 'Activa'} bg-gradient-primary {/if} {if $tipo_curricula eq 'Inactiva'} bg-gradient-danger {/if} {if $tipo_curricula eq 'Finalizada'} bg-gradient-info {/if}">
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
                                <small>Grupo: {$subject.group} ({$subject.modality})<br>
                                Periodo: {$subject.initialDate|date_format:"%d-%m-%Y"} - {$subject.finalDate|date_format:"%d-%m-%Y"}</small>
                            </p>
                            <div class="text-center">
                                <a href="{$WEB_ROOT}/modulos-curricula/id/{$subject.courseId}" title="Módulos de la Currícula" class="btn btn-outline-light btn-fw btn-sm">
                                    <i class="fas fa-link"></i> Ver
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            {foreachelse}
                <div class="col-md-12">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="far fa-frown fa-lg"></i> <strong>¡Lo sentimos!</strong> No Cuentas Con Currícula {$tipo_curricula}.
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
        </div>
    </div>
</div>


























































{*
<h1 class="page-title"> Bienvenido
    <small></small>
</h1>
{if $msjC eq 'si'}
<div class="alert alert-info alert-dismissable">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong>El perfil se actualizo correctamente</strong>
</div>
{/if}

{if $msjCc eq 'si'}
<div class="alert alert-info alert-dismissable">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong>La contrasela se actualizo correctamente</strong>
</div>
{/if}
<div class="row">
    <div class="col-md-12">
        <div class="profile-sidebar">
            <div class="portlet light profile-sidebar-portlet ">
                <div class="profile-userpic">
                    <img src="{{$infoStudent.imagen}}" class="img-responsive" alt=""> </div>
                <div class="profile-usertitle">
                    <div class="profile-usertitle-name"> {$User.username} </div>
                    <div class="profile-usertitle-job"> Alumno </div>
                </div>
                <div class="profile-usermenu">
                    <ul class="nav">
						<li>
                            <a href="#" >
                               <i class="fa fa-user" aria-hidden="true"></i>Perfil
							</a>
                        </li>
                        <li class="">
                            <a href="# ">
                                <i class="icon-settings"></i> Actualizar Información</a>
                        </li>

						<li>
						<a href="#" data-target="#ajax" data-toggle="modal" data-width="1000px">
						   <i class="fa fa-unlock-alt"></i>Cambiar Contraseña
						</a>
						</li>
						
                    </ul>
                </div>
            </div>
            <div class="portlet light ">
                <div>
                    <h4 class="profile-desc-title">Acerca del IAP Chiapas</h4>
                    <span class="profile-desc-text"> El <b>Instituto de Administración Pública del Estado de Chiapas, A. C.</b><br />te da la mas cordial bienvenida a nuestro Sistema de Educación en Línea.</span>
                    <div class="margin-top-20 profile-desc-link">
                        <i class="fa fa-globe"></i>
                        <a href="http://www.iapchiapas.org.mx">www.iapchiapas.edu.mx</a>
                    </div>
                    <div class="margin-top-20 profile-desc-link">
                        <i class="fa fa-facebook"></i>
                        <a href="https://www.facebook.com/IAPChiapas">iapchiapas</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="profile-content">
            <div class="row">
                <div class="col-md-12">
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
                                <li >
                                    <a href="#tab_1_2" data-toggle="tab"> Avisos </a>
                                </li>
                            </ul>
                        </div>
                        <div class="portlet-body">
                            <div class="tab-content">
                                <div class="tab-pane " id="tab_1_2">
                                    <div class="scroller" style="height: 320px;" data-always-visible="1" data-rail-visible1="0" data-handle-color="#D7DCE2">
                                        <ul class="feeds">

                                            {foreach from=$announcements item=item}
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-success">
                                                                <i class="fa fa-bell-o"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">
                                                                <b>{$item.title}</b>: {$item.description}
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date"> {$item.date|date_format:"%d %b '%y"} </div>
                                                </div>
                                            </li>
                                            {/foreach}

                                        </ul>
                                    </div>
                                </div>
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
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="portlet light ">
                        <div class="portlet-title">
                            <div class="caption caption-md">
                                <i class="icon-bar-chart theme-font hide"></i>
                                <span class="caption-subject font-blue-madison bold uppercase">Curricula Activa</span>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-scrollable table-scrollable-borderless">
                                <table class="table table-hover table-light" >
                                    <thead>
                                    <tr class="uppercase">

                                        <th style="text-align: center"> Tipo </th>
                                        <th style="text-align: center"> Nombre </th>
										 <th style="text-align: center"> Grupo </th>
                                        <th style="text-align: center"> Modalidad </th>
                                        <th style="text-align: center"> Fecha Inicial </th>
                                        <th style="text-align: center"> Fecha Final </th>
                                        <th style="text-align: center"> Modulos </th>

                                        <th style="text-align: center"> Acciones </th>
                                    </tr>
                                    </thead>
                                    {foreach from=$activeCourses item=subject}
                                    <tr>

                                        <td align="center">{$subject.majorName}</td>
                                        <td align="center">{$subject.name}</td>
										  <td align="center">{$subject.group}
                                        <td align="center">{$subject.modality}</td>
                                        <td align="center">{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
                                        <td align="center">{$subject.finalDate|date_format:"%d-%m-%Y"}</td>
                                        <td align="center">{$subject.courseModule}
                                        <td align="center">
                                            <a href="{$WEB_ROOT}/graybox.php?page=view-modules-course-student&id={$subject.courseId}" data-target="#ajax" data-toggle="modal" data-width="1000px">
                                            <i class="fa fa-sign-in fa-lg"></i>
                                            </a>
                                        </td>
                                     </tr>
                                        {foreachelse}
                                        <tr>
                                            <td colspan="12" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
                                        </tr>

                                    {/foreach}

                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="portlet light ">
                        <div class="portlet-title">
                            <div class="caption caption-md">
                                <i class="icon-bar-chart theme-font hide"></i>
                                <span class="caption-subject font-blue-madison bold uppercase">Curricula Inactiva</span>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-scrollable table-scrollable-borderless">
                                <table class="table table-hover table-light">
                                    <thead>
                                    <tr class="uppercase">
                                        <th style="text-align: center"> Clave </th>
                                        <th style="text-align: center"> Tipo </th>
                                        <th style="text-align: center"> Nombre </th>
                                        <th style="text-align: center"> Modalidad </th>
                                        <th style="text-align: center"> Fecha Inicial </th>
                                        <th style="text-align: center"> Fecha Final </th>
                                        <th style="text-align: center"> Dias Activo </th>
                                        <th style="text-align: center"> Modulos </th>
                                    </tr>
                                    </thead>
                                    {foreach from=$inactiveCourses item=subject}

                                    <tr>
                                        <td align="center">{$subject.clave}</td>
                                        <td align="center">{$subject.majorName}</td>
                                        <td align="center">{$subject.name}</td>
                                        <td align="center">{$subject.modality}</td>
                                        <td align="center">{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
                                        <td align="center">{$subject.finalDate|date_format:"%d-%m-%Y"}</td>
                                        <td align="center">{$subject.daysToFinish}</td>
                                        <td align="center">{$subject.courseModule}
                                        </tr>
                                        {foreachelse}
                                        <tr>
                                            <td colspan="12" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
                                        </tr>
                                        {/foreach}

                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="portlet light ">
                        <div class="portlet-title">
                            <div class="caption caption-md">
                                <i class="icon-bar-chart theme-font hide"></i>
                                <span class="caption-subject font-blue-madison bold uppercase">Curricula Finalizada</span>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-scrollable table-scrollable-borderless">
                                <table class="table table-hover table-light">
                                    <thead>
                                    <tr class="uppercase">
                                        <th style="text-align: center"> Clave </th>
                                        <th style="text-align: center"> Tipo </th>
                                        <th style="text-align: center"> Nombre </th>
                                        <th style="text-align: center"> Modalidad </th>
                                        <th style="text-align: center"> Fecha Inicial </th>
                                        <th style="text-align: center"> Fecha Final </th>
                                        <th style="text-align: center"> Dias Activo </th>
                                        <th style="text-align: center"> Modulos </th>
                                        <th style="text-align: center"> Calificación </th>
                                    </tr>
                                    </thead>
                                    {foreach from=$finishedCourses item=subject}

                                    <tr>
                                        <td style="text-align: center">{$subject.clave}</td>
                                        <td style="text-align: center">{$subject.majorName}</td>
                                        <td style="text-align: center">{$subject.name}</td>
                                        <td style="text-align: center">{$subject.modality}</td>
                                        <td style="text-align: center">{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
                                        <td style="text-align: center"style="text-align: center">{$subject.finalDate|date_format:"%d-%m-%Y"}</td>
                                        <td >{$subject.daysToFinish}</td>
                                        <td style="text-align: center">{$subject.courseModule}
                                        <td style="text-align: center">{$subject.mark}</td>
                                     </tr>
                                        {foreachelse}
                                        <tr>
                                            <td colspan="12" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
                                        </tr>
                                    {/foreach}

                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
*}