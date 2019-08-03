{if $User.type == 'student'}
    {include file='templates/new/student_profile.tpl'}
{else if $User.type == 'Docente'}	
	{include file='templates/new/docente_profile.tpl'}
{else}


<!-- BEGIN PAGE TITLE-->
<h1 class="page-title">
    <img src="{$WEB_ROOT}/images/icons/22/display.png" alt="" />
    Inicio
</h1>
<!-- END PAGE TITLE-->


<!-- BEGIN Portlet PORTLET-->
<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            {if $User.type == "student"}
                <img alt="" width="32px" class="img-circle" src="{$infoStudent.imagen}">
            {else}
                <i class="fa fa-gift"></i>
            {/if}
            Bienvenido(a) {$User.username}</div>
    </div>
    <div class="portlet-body">
        <div class="scroller" style="" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
            <p class="left">
                <b>{$institution.name_long}</b><br />te da la mas cordial bienvenida a nuestro Sistema de Educación en Línea
            </p>
            <p class="right">
                <b>{$INTRODUCTION}</b>
            </p>
        </div>
    </div>
</div>
<!-- END Portlet PORTLET-->

{if $User.type != "student"}
<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Notificaciones
        </div>
        <div class="tools">
            <a href="javascript:;" class="collapse"> </a>
        </div>
    </div>
    <div class="portlet-body">
        <div class="table-responsive">
            {include file="{$DOC_ROOT}/templates/lists/notificacionesadmin.tpl"}
        </div>
    </div>
</div>
{/if}

<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Noticias
            {if $User.positionId == "1"}
                | &raquo; <a style="color:#000000" href="{$WEB_ROOT}/add-noticia/id/0" onclick="return parent.GB_show('Agregar Noticia', this.href,650,700) ">Agregar Noticia</a>
            {/if}
        </div>
        <div class="tools">
            <a href="javascript:;" class="collapse"> </a>
        </div>
    </div>
    <div class="portlet-body">
        {include file="{$DOC_ROOT}/templates/lists/module-announcements.tpl"}
    </div>
</div>

{if $User.type == "student"}
    <div class="portlet box {$PORTLET_COLOR}">
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

    <div class="portlet box {$PORTLET_COLOR}">
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

    <div class="portlet box {$PORTLET_COLOR}">
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
