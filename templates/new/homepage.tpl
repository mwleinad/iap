{if $User.type == 'student'}
    {include file='templates/new/student_profile.tpl'}
{else if $User.type == 'Docente'}
    {include file='templates/new/docente_profile.tpl'}
{else}


    {* BEGIN PAGE TITLE *}
    <div class="page-header">
        <h3 class="page-title">
            <span class="page-title-icon bg-gradient-primary text-white mr-2">
                <i class="mdi mdi-home"></i>
            </span>
            Inicio
        </h3>
        <nav aria-label="breadcrumb">
            <ul class="breadcrumb">
                <li class="breadcrumb-item active" aria-current="page">
                    <span></span>Inicio
                    <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
                </li>
            </ul>
        </nav>
    </div>
    {* END PAGE TITLE *}


    {* BEGIN Portlet PORTLET *}
    <div class="card mb-4">
        <div class="card-header bg-primary text-white header_main">
            {if $User.type == "student"}
                <img alt="" width="32px" class="img-circle" src="{$infoStudent.imagen}">
            {else}
                <i class="fa fa-gift"></i>
            {/if}
            <div class="sub_header">Bienvenido(a) {$User.username}</div>
        </div>
        <div class="card-body">
            <script src="https://unpkg.com/@lottiefiles/lottie-player@2.0.8/dist/lottie-player.js"></script>
            <lottie-player src="https://lottie.host/43d8bea4-6e31-48b0-a330-8cbf06cd32f4/4wNH2bwwMg.json"
                background="##FFFFFF" speed="1" style="width: 100%; height: 300px" loop autoplay direction="1"
                mode="normal"></lottie-player>
            <p>
                El <b>Instituto de Administración Pública del Estado de Chiapas, A. C.</b><br />te da la mas cordial
                bienvenida a nuestro Sistema de Educación en Línea.
            </p>
            <p>
                El <b>IAP Chiapas</b> coadyuva desde 1977 en el fortalecimiento de la gestión pública de los tres órdenes de
                gobierno, así como con la realización de investigación, consultoría y difusión del desarrollo de las
                ciencias administrativas, en beneficio de la sociedad.
            </p>
        </div>
    </div>
    {* END Portlet PORTLET *}

    {if $User.type != "student"}
        <div id="ac1" class="mb-4">
            <div class="card">
                <div class="card-header bg-primary text-white header_main">
                    <div class="sub_header"><i class="fas fa-bell"></i> Notificaciones</div>
                    <a class="card-link text-white float-right" data-toggle="collapse" href="#collapseOne">
                        <i class="fas fa-caret-down fa-lg"></i>
                    </a>
                </div>
                <div id="collapseOne" class="card-body collapse show" data-parent="#ac1">
                    <div class="table-responsive">
                        {include file="{$DOC_ROOT}/templates/lists/notificacionesadmin.tpl"}
                    </div>
                </div>
            </div>
        </div>
    {/if}

    {*<div id="ac2" class="mb-4">
        <div class="card">
            <div class="card-header bg-primary text-white">
                <i class="far fa-newspaper"></i> Noticias
                {if $User.positionId == "1"}
                    | <a href="{$WEB_ROOT}/add-noticia/id/0" class="btn btn-light btn-sm" onclick="return parent.GB_show('Agregar Noticia', this.href,650,700) ">
                        Agregar Noticia
                    </a>
                {/if}
                <a class="card-link text-white float-right" data-toggle="collapse" href="#collapseTwo">
                    <i class="fas fa-caret-down fa-lg"></i>
                </a>
            </div>
            <div id="collapseTwo" class="card-body collapse show" data-parent="#ac2">
                <div class="table-responsive">
                    {include file="{$DOC_ROOT}/templates/lists/module-announcements.tpl"}
                </div>
            </div>
        </div>
    </div>*}


    {if $User.type == "student"}
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-bullhorm"></i>Curricula Activa
                </div>
                <div class="tools">
                    <a href="javascript:;" class="collapse"> </a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="table-responsive">
                    {include file="{$DOC_ROOT}/templates/lists/student-curricula-activa.tpl"}
                </div>
            </div>
        </div>

        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-bullhorm"></i>Curricula Inactiva (Falta de pago, baja, etc)
                </div>
                <div class="tools">
                    <a href="javascript:;" class="collapse"> </a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="table-responsive">
                    {include file="{$DOC_ROOT}/templates/lists/student-curricula-inactiva.tpl"}
                </div>
            </div>
        </div>

        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-bullhorm"></i>Curricula Finalizada
                </div>
                <div class="tools">
                    <a href="javascript:;" class="collapse"> </a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="table-responsive">
                    {include file="{$DOC_ROOT}/templates/lists/student-curricula-finalizada.tpl"}
                </div>
            </div>
        </div>
        <input type="hidden" value="0" id="recarga" name="recarga">
    {/if}
{/if}