<!-- BEGIN SIDEBAR -->
<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
<!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
<div class="page-sidebar navbar-collapse collapse ">
    <!-- BEGIN SIDEBAR MENU -->
    <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
    <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
    <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
    <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
    <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
    <ul class="page-sidebar-menu  page-header-fixed {if $User.type == "student" ||  $User.type == "Docente"} page-sidebar-menu-closed {/if}" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
        <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
        <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
        <li class="sidebar-toggler-wrapper hide">
            <div class="sidebar-toggler">
                <span></span>
            </div>
        </li>
        <!-- END SIDEBAR TOGGLER BUTTON -->
        <li class="nav-item start ">
            <a href="{$WEB_ROOT}" class="nav-link">
                <i class="icon-home"></i>
                <span class="title">Inicio</span>
            </a>

        </li>
		
        {if $AccessMod[32] == 1 || $AccessMod[33] == 1}
{*
        <li class="nav-item start ">
            <a href="{$WEB_ROOT}/alumn-services" class="nav-link">
                <i class="icon-settings"></i>
                <span class="title">Mis Datos</span>
            </a>
        </li>
*}
        {/if}

{if $User.positionId == 1 || $AccessMod[38] == 1 || $AccessMod[38] == 1 || $AccessMod[1] == 1 || $AccessMod[2] == 1  || $AccessMod[3] == 1 || $AccessMod[4] == 1 || $AccessMod[5] == 1 || $AccessMod[6] == 1 || $AccessMod[7] == 1 || $AccessMod[9] == 1 || $AccessMod[10] == 1}
{if !$docente}
{if $vistaPrevia ne 1}
        
        <li class="nav-item {if  $page == "personal1"} active {/if} ">
            <a href="javascript:;" class="nav-link nav-toggle">
                <i class="icon-diamond"></i>
                <span class="title">Catálogos</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
			
				{if $AccessMod[38] != 1}
                <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/major" class="nav-link ">
                        <span class="title">Programas Académicos</span>
                    </a>
                </li>
                <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/personal1" class="nav-link ">
                        <span class="title">Personal</span>
                    </a>
                </li>
				{/if}
                <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/student" class="nav-link ">
                        <span class="title">Alumnos</span>
                    </a>
                </li>
				{if $AccessMod[38] != 1}
				<!--
                <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/position" class="nav-link ">
                        <span class="title">Puestos</span>
                    </a>
                </li>
				-->
                <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/role" class="nav-link ">
                        <span class="title">Roles</span>
                    </a>
                </li>
				{if $AccessMod[39] != 1}
                        <li class="nav-item  ">
                            <a href="{$WEB_ROOT}/subject" class="nav-link ">
                                <span class="title">Certificaciones</span>
                            </a>
                        </li>
						{/if}
				<li class="nav-item  ">
                            <a href="{$WEB_ROOT}/history-subject" class="nav-link ">
                                <span class="title">Historial</span>
                            </a>
                        </li>
				<!--
                <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/profesion" class="nav-link ">
                        <span class="title">Profesiones</span>
                    </a>
                </li>
                <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/recording" class="nav-link ">
                        <span class="title">Videoconferencias</span>
                    </a>
                </li>-->
				{/if}
			 {/if}
            </ul>
        </li>
       
        {/if}
        {/if}

        {if $AccessMod[34] == 1 || $User.positionId == 1}
		{if $vistaPrevia ne 1}
		<!--
        <li class="nav-item  ">
            <a href="javascript:;" class="nav-link nav-toggle">
                <i class="fa fa-book" aria-hidden="true"></i>
                <span class="title">Cobranza</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/invoices" class="nav-link ">
                        <span class="title">Recibos</span>
                    </a>
                </li>
                <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/consultar-facturas" class="nav-link ">
                        <span class="title">Consultar Facturas</span>
                    </a>
                </li>
            </ul>
        </li>-->
        {/if}
        {/if}

        {if $AccessMod[11] == 1 || $User.positionId == 1 || $AccessMod[31] == 1 || $AccessMod[8] == 1 ||  $AccessMod[39] == 1}
            {if !$docente}
			{if $vistaPrevia ne 1}<!--
                <li class="nav-item   {if $page == "subject" || $page == "history-subject"} active {/if} ">
                    <a href="javascript:;" class="nav-link nav-toggle">
                        <i class="icon-settings"></i>
                        <span class="title">Currícula</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
						{if $AccessMod[39] != 1}
                        <li class="nav-item  ">
                            <a href="{$WEB_ROOT}/subject" class="nav-link ">
                                <span class="title">Currícula</span>
                            </a>
                        </li>
						{/if}
                        <li class="nav-item  ">
                            <a href="{$WEB_ROOT}/history-subject" class="nav-link ">
                                <span class="title">Historial</span>
                            </a>
                        </li>
                    </ul>
                </li>-->
			{/if}
            {else}
                <li class="nav-item ">
                    <a href="{$WEB_ROOT}/history-subject" class="nav-link nav-toggle">
                        <i class="icon-settings"></i>
                        <span class="title">Currícula</span>
                    </a>
                </li>
				
            {/if}

        {/if}


        {if $User.positionId == 1 || $AccessMod[40] == 1 || $AccessMod[1] == 1 || $AccessMod[2] == 1  || $AccessMod[3] == 1 || $AccessMod[4] == 1 || $AccessMod[5] == 1 || $AccessMod[6] == 1 || $AccessMod[7] == 1 || $AccessMod[9] == 1 || $AccessMod[10] == 1}
        {if $vistaPrevia ne 1}
		 {if !$docente}
		 {if $AccessMod[40] != 1}
		 <!--
		<li class="nav-item  ">
            <a href="javascript:;" class="nav-link nav-toggle">
                <i class="fa fa-video-camera"></i>
                <span class="title">Videoconferencias</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/tv" class="nav-link ">
                        <span class="title">Videoconferencias en vivo</span>
                    </a>
                </li>
                <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/recorded" class="nav-link ">
                        <span class="title">Grabaciones</span>
                    </a>
                </li>
            </ul>
        </li>-->
		{/if}<!--
		<li class="nav-item  ">
            <a href="{$WEB_ROOT}/solicitud" class="nav-link nav-toggle">
                <i class="fa fa-folder-open" aria-hidden="true"></i>
                <span class="title">Solicitudes</span>
                <span class="arrow"></span>
            </a>
        </li>-->
		{if $AccessMod[40] != 1}
		 <!--<li class="nav-item  ">
            <a href="javascript:;" class="nav-link nav-toggle">
               <i class="fa fa-money" aria-hidden="true"></i>
                <span class="title">Finanzas</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/concepto" class="nav-link ">
                        <span class="title">Conceptos</span>
                    </a>
                </li>
				 <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/sincronizar" class="nav-link ">
                        <span class="title">Sincronizar DB</span>
                    </a>
                </li>
            </ul>
        </li>-->
		{/if}
		<!--
		<li class="nav-item  ">
            <a href="{$WEB_ROOT}/lst-docentes" class="nav-link nav-toggle">
                <i class="fa fa-folder-open" aria-hidden="true"></i>
                <span class="title">Docentes</span>
               
            </a>
        </li>-->
		
		
		<!--
		<li class="nav-item  ">
            <a href="javascript:;" class="nav-link nav-toggle">
               <i class="fa fa-user" aria-hidden="true"></i>
                <span class="title">Docentes</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/alta-docente" class="nav-link ">
                        <span class="title">Alta</span>
                    </a>
                </li>
				 <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/lst-docentes" class="nav-link ">
                        <span class="title">Lista de Docentes</span>
                    </a>
                </li>
            </ul>
        </li>-->
		{/if}<!--
		<li class="nav-item  ">
            <a href="{$WEB_ROOT}/inbox/or/h" class="nav-link nav-toggle">
               <i class="fa fa-comments"></i>
                <span class="title">Inbox</span>  
                <span class="arrow"></span>
            </a>
        </li>
		-->
		
	<!--
		 <li class="nav-item {if $page == "doc-docente" 
		 || $page == "info-docente" 
		 || $page == "repositorio" 
		 || $page == "doc-docente" 
		 || $page == "add-cat-doc-docente" 
		 || $page == "info-docente" 
		 || $page == "lst-docentes" 
		 || $page == "repositorio" 
		 || $page == "prog-academico" 
		 || $page == "msj" 
		 || $page == "materias" 
		 || $page == "cat-doc-docente" 
		 || $page == "prog-materia" 
		 || $page == "tabla-costo" 
		 || $page == "repositorio"} active {/if} ">

            <a href="javascript:;" class="nav-link nav-toggle">
                <i class="fa fa-user" aria-hidden="true"></i>
                <span class="title">Docente</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
				{if $docente}
                <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/info-docente" class="nav-link ">
                        <span class="title">Información Personal</span>
                    </a>
                </li>
				 <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/doc-docente" class="nav-link ">
                        <span class="title">Documentos Docente</span>
                    </a>
                </li>
				 <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/repositorio" class="nav-link ">
                        <span class="title">Repositorio Docente</span>
                    </a>
                </li>
				{/if}
				{if !$docente}
				 <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/lst-docentes" class="nav-link ">
                        <span class="title">Lista de Docentes</span>
                    </a>
                </li>
				<li class="nav-item  ">
                    <a href="{$WEB_ROOT}/msj" class="nav-link ">
                        <span class="title">Mensajes</span>
                    </a>
                </li>
				 <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/cat-doc-docente" class="nav-link ">
                        <span class="title">Documentos Docente</span>
                    </a>
                </li>
				 <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/tabla-costo" class="nav-link ">
                        <span class="title">Tabla de Costos</span>
                    </a>
                </li>
				 <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/prog-academico" class="nav-link ">
                        <span class="title">Programas Académicos</span>
                    </a>
                </li>
				 <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/repositorio" class="nav-link ">
                        <span class="title">Repositorio Docente</span>
                    </a>
                </li>
				{/if}
            </ul>
        </li>-->
		{if !$docente}
		<!--<li class="nav-item {if  $page == "vehiculos" || $page == "report-materia" || $page == "doc-mat"  || $page == "report-docentes"} active {/if} "> 

            <a href="javascript:;" class="nav-link nav-toggle">
                <i class="fa fa-desktop" aria-hidden="true"></i>
                <span class="title">Reportes</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
				{if !$docente}
				 <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/vehiculos" class="nav-link ">
                        <span class="title">Vehiculos</span>
                    </a>
                </li>
				 <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/report-materia" class="nav-link ">
                        <span class="title">Materias</span>
                    </a>
                </li>
				 <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/report-docentes" class="nav-link ">
                        <span class="title">Docentes</span>
                    </a>
                </li>
				 <li class="nav-item  ">
                    <a href="{$WEB_ROOT}/doc-mat" class="nav-link ">
                        <span class="title">Docentes/Materias</span>
                    </a>
                </li>
				
				<li class="nav-item  ">
					<a href="{$WEB_ROOT}/reporte-general" class="nav-link">
						<span class="title">Reportes General</span>
					</a>
				</li>
				{/if}
            </ul>
        </li>-->
			{/if}
		<!--<li class="nav-item  ">
            <a href="{$WEB_ROOT}/mensaje" class="nav-link nav-toggle">
                <i class="fa fa-video-camera"></i>
                <span class="title">Mensajes</span>
                <span class="arrow"></span>
            </a>
        </li>-->
        {/if}
        {/if}

        {if $User.positionId == 1 || $AccessMod[13] == 1 || $AccessMod[14] == 1  || $AccessMod[15] == 1 || $AccessMod[16] == 1}
			 {if $vistaPrevia ne 1}
			<!--
			<li class="nav-item  ">
				<a href="{$WEB_ROOT}/institution" class="nav-link ">
					<i class="icon-wallet"></i>
					<span class="title">Configuración</span>
					<span class="arrow"></span>
				</a>
			</li>-->
			{/if}
        {/if}
		
		

        {if $mnuMain == "modulo1" || $mnuMain == "modulo"}
		<!--
		<li class="nav-item {if $page == "view-modules-student"} active {/if} ">
                <a href="{$WEB_ROOT}/view-modules-student/id/{$id}" class="nav-link nav-toggle">
                    <i class="fa fa-bullhorn"></i>
                    <span class="title">Anuncios</span>
                </a>
            </li>
		
		
			
            
            <li class="nav-item {if $page == "information-modules-student"} active {/if} ">
                <a href="{$WEB_ROOT}/information-modules-student/id/{$id}" class="nav-link nav-toggle">
                    <i class="fa fa-info"></i>
                    <span class="title">Información</span>
                </a>
            </li>
			
		 <li class="nav-item {if $page == "grupo"} active {/if}">
            <a href="{$WEB_ROOT}/grupo/id/{$id}" class="nav-link nav-toggle">
                <i class="fa fa-graduation-cap"></i>
                <span class="title">Grupo</span>
            </a>
        </li>	

        <li class="nav-item {if $page == "docente"} active {/if}">
            <a href="{$WEB_ROOT}/docente/id/{$id}" class="nav-link nav-toggle">
                <i class="fa fa-user"></i>
                <span class="title">Asesor</span>
            </a>
        </li>-->
<!--
		<li class="nav-item {if $page == "personal-academico"} active {/if}">
            <a href="{$WEB_ROOT}/personal-academico/id/{$id}" class="nav-link nav-toggle">
                <i class="fa fa-sitemap"></i>
                <span class="title">Personal Académico</span>
            </a>
        </li>-->
<!--
        {if $mnuMain == "modulo"}
            <li class="nav-item {if $page == "calendar-image-modules-student"} active {/if} ">
                <a href="{$WEB_ROOT}/calendar-image-modules-student/id/{$id}" class="nav-link nav-toggle">
                    <i class="fa fa-calendar"></i>
                    <span class="title">Calendario</span>
                </a>
            </li>
            {/if}

            <li class="nav-item {if $page == "calendar-modules-student"} active {/if} ">
                <a href="{$WEB_ROOT}/calendar-modules-student/id/{$id}" class="nav-link nav-toggle">
                    <i class="fa fa-list"></i>
                    <span class="title">Actividades</span>
                </a>
            </li>

            {if $mnuMain == "modulo"}
            <li class="nav-item {if $page == "presentation-modules-student"} active {/if} ">
                <a href="{$WEB_ROOT}/presentation-modules-student/id/{$id}" class="nav-link nav-toggle">
                    <i class="fa fa-slideshare"></i>
                    <span class="title">Clase</span>
                </a>
            </li>
            {/if}
-->
			{if $infoUSubject.acuseDerecho eq "si"}
            <li class="nav-item {if $page == "examen-modules-student"} active {/if} ">
                <a href="{$WEB_ROOT}/examen-modules-student/id/{$id}" class="nav-link nav-toggle">
                    <i class="fa fa-check-square-o"></i>
                    <span class="title">Examenes</span>
                </a>
            </li>
			{/if}
<!--
            <li class="nav-item {if $page == "resources-modules-student"} active {/if} ">
                <a href="{$WEB_ROOT}/resources-modules-student/id/{$id}" class="nav-link nav-toggle">
                    <i class="fa fa-files-o"></i>
                    <span class="title">Recursos de Apoyo</span>
                </a>
            </li>
			
			<li class="nav-item {if $page == "reply-inbox"} active {/if} ">
                <a href="{$WEB_ROOT}/reply-inbox/id/{$id}/cId/0" class="nav-link nav-toggle">
                    <i class="fa fa-envelope-o"></i>
                    <span class="title">Inbox</span>
                </a>
            </li>

            <li class="nav-item {if $page == "forum-modules-student"} active {/if} ">
                <a href="{$WEB_ROOT}/forum-modules-student/id/{$id}" class="nav-link nav-toggle">
                    <i class="fa fa-comments"></i>
                    <span class="title">Foro</span>
                </a>
            </li>

            <li class="nav-item {if $page == "team-modules-student"} active {/if} ">
                <a href="{$WEB_ROOT}/team-modules-student/id/{$id}" class="nav-link nav-toggle">
                    <i class="fa fa-users"></i>
                    <span class="title">Mi Equipo</span>
                </a>
            </li>

            <li class="nav-item ">
                <a href="{$WEB_ROOT}/wiki/index.php/Página_principal" class="nav-link nav-toggle">
                    <i class="fa fa-wikipedia-w"></i>
                    <span class="title">Wiki</span>
                </a>
            </li>-->
			<!-- 
			 <li class="nav-item {if $page == "inbox"} active {/if} ">
                <a href="{$WEB_ROOT}/inbox/id/{$id}" class="nav-link nav-toggle">
                    <i class="fa fa-comments"></i>
                    <span class="title">Inbox</span>
                </a>
            </li>-->
			


        {/if}

    </ul>
    <!-- END SIDEBAR MENU -->
    <!-- END SIDEBAR MENU -->
</div>
<!-- END SIDEBAR -->