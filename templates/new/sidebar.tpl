<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        {*<li class="nav-item nav-profile">
            <a href="#" class="nav-link">
                <div class="nav-profile-image">
                    <img src="images/faces/face1.jpg" alt="profile">
                    <span class="login-status online"></span>             
                </div>
                <div class="nav-profile-text d-flex flex-column">
                    <span class="font-weight-bold mb-2">David Grey. H</span>
                    <span class="text-secondary text-small">Project Manager</span>
                </div>
                <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
            </a>
        </li>*}
        <li class="nav-item {if $page == "homepage"} active {/if}">
            <a class="nav-link" href="{$WEB_ROOT}">
                <span class="menu-title">Inicio</span>
                <i class="mdi mdi-home menu-icon"></i>
            </a>
        </li>
        {if $User.positionId == 1 || $AccessMod[38] == 1 || $AccessMod[38] == 1 || $AccessMod[1] == 1 || $AccessMod[2] == 1 || $AccessMod[3] == 1 || $AccessMod[4] == 1 || $AccessMod[5] == 1 || $AccessMod[6] == 1 || $AccessMod[7] == 1 || $AccessMod[9] == 1 || $AccessMod[10] == 1}
            {if !$docente}
                {if $vistaPrevia ne 1}
                    <li class="nav-item {if $page == "major" or $page == "personal1" or $page == "student" or $page == "position" or $page == "role" or $page == "profesion" or $page == "recording"}active{/if}">
                    <a class="nav-link" data-toggle="collapse" href="#m-catalogos" aria-expanded="{if $page == "major" or $page == "personal1" or $page == "student" or $page == "position" or $page == "role" or $page == "profesion" or $page == "recording"}true{else}false{/if}" aria-controls="m-catalogos">
                            <span class="menu-title">Catálogos</span>
                            <i class="menu-arrow"></i>
                            <i class="mdi mdi-library-books menu-icon"></i>
                        </a>
                        <div class="collapse {if $page == "major" or $page == "personal1" or $page == "student" or $page == "position" or $page == "role" or $page == "profesion" or $page == "recording"}show{/if}" id="m-catalogos">
                            <ul class="nav flex-column sub-menu">
                                {if $AccessMod[38] != 1}
                                    <li class="nav-item">
                                        <a class="nav-link {if $page == "major"}active{/if}" href="{$WEB_ROOT}/major">Programas Académicos</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link {if $page == "personal1"}active{/if}" href="{$WEB_ROOT}/personal1">Personal</a>
                                    </li>
                                {/if}
                                <li class="nav-item">
                                    <a class="nav-link {if $page == "student"}active{/if}" href="{$WEB_ROOT}/student">Alumnos</a>
                                </li>
                                {if $AccessMod[38] != 1}
                                    <li class="nav-item">
                                        <a class="nav-link {if $page == "position"}active{/if}" href="{$WEB_ROOT}/position">Puestos</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link {if $page == "role"}active{/if}" href="{$WEB_ROOT}/role">Roles</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link {if $page == "profesion"}active{/if}" href="{$WEB_ROOT}/profesion">Profesiones</a>
                                    </li>
                                    {*<li class="nav-item">
                                        <a class="nav-link {if $page == "recording"}active{/if}" href="{$WEB_ROOT}/recording">Videoconferencias</a>
                                    </li>*}
                                {/if}
                                <li class="nav-item">
                                    <a class="nav-link" href="{$WEB_ROOT}/cat-doc-alumno">Documentos Alumnos</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                {/if}
            {/if}
        {/if}
        {if $AccessMod[34] == 1 || $User.positionId == 1}
            {if $vistaPrevia ne 1}
                <li class="nav-item {if $page == "configurar-calendario" or $page == "cobranza-calendario"}active{/if}">
                    <a class="nav-link" data-toggle="collapse" href="#m-cobranza" aria-expanded="{if $page == "configurar-calendario" or $page == "cobranza-calendario"}true{else}false{/if}" aria-controls="m-cobranza">
                        <span class="menu-title">Cobranza</span>
                        <i class="menu-arrow"></i>
                        <i class="mdi mdi-cash-usd menu-icon"></i>
                    </a>
                    <div class="collapse {if $page == "configurar-calendario" or $page == "cobranza-calendario"}show{/if}" id="m-cobranza">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item">
                                <a class="nav-link {if $page == "cobranza-calendario"}active{/if}" href="{$WEB_ROOT}/cobranza-calendario">Calendario de Pagos</a>
                            </li>
                        </ul>
                    </div>
                </li>
            {/if}
        {/if}
        {if $AccessMod[11] == 1 || $User.positionId == 1 || $AccessMod[31] == 1 || $AccessMod[8] == 1 || $AccessMod[39] == 1}
            {if !$docente}
                {if $vistaPrevia ne 1}
                    <li class="nav-item {if $page == "subject" or $page == "history-subject" or $page == "edit-module"}active{/if}">
                        <a class="nav-link" data-toggle="collapse" href="#m-curricula" aria-expanded="{if $page == "subject" or $page == "history-subject"}true{else}false{/if}" aria-controls="m-curricula">
                            <span class="menu-title">Currícula</span>
                            <i class="menu-arrow"></i>
                            <i class="mdi mdi-school menu-icon"></i>
                        </a>
                        <div class="collapse {if $page == "subject" or $page == "history-subject" or $page == "edit-module"}show{/if}" id="m-curricula">
                            <ul class="nav flex-column sub-menu">
                                {if $AccessMod[39] != 1}
                                    <li class="nav-item">
                                        <a class="nav-link {if $page == "subject" or $page == "edit-module"}active{/if}" href="{$WEB_ROOT}/subject">Currícula</a>
                                    </li>
                                {/if}
                                <li class="nav-item">
                                    <a class="nav-link {if $page == "history-subject"}active{/if}" href="{$WEB_ROOT}/history-subject">Historial</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                {else}
                    <li class="nav-item">
                        <a class="nav-link" href="{$WEB_ROOT}/history-subject">
                            <span class="menu-title">Currícula</span>
                            <i class="mdi mdi-school menu-icon"></i>
                        </a>
                    </li>
                {/if}
            {/if}
        {/if}



        {if $User.positionId == 1 || $AccessMod[40] == 1 || $AccessMod[1] == 1 || $AccessMod[2] == 1 || $AccessMod[3] == 1 || $AccessMod[4] == 1 || $AccessMod[5] == 1 || $AccessMod[6] == 1 || $AccessMod[7] == 1 || $AccessMod[9] == 1 || $AccessMod[10] == 1}
            {if $vistaPrevia ne 1}
                {*if !$docente}
                    <li class="nav-item">
                        <a class="nav-link" href="{$WEB_ROOT}/solicitud">
                            <span class="menu-title">Solicitudes</span>
                            <i class="mdi mdi-file-document menu-icon"></i>
                        </a>
                    </li>
                {/if*}
                <li class="nav-item">
                    <a class="nav-link" href="{$WEB_ROOT}/inbox/or/h">
                        <span class="menu-title">Inbox</span>
                        <i class="mdi mdi-email menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#m-docente" aria-expanded="false" aria-controls="m-docente">
                        <span class="menu-title">Docente</span>
                        <i class="menu-arrow"></i>
                        <i class="mdi mdi-ruler menu-icon"></i>
                    </a>
                    <div class="collapse" id="m-docente">
                        <ul class="nav flex-column sub-menu">
                            {if $docente}
                                <li class="nav-item">
                                    <a class="nav-link" href="{$WEB_ROOT}/info-docente">Información Personal</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{$WEB_ROOT}/doc-docente">Documentos Docente</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{$WEB_ROOT}/repositorio">Repositorio Docente</a>
                                </li>
                            {/if}
                            {if !$docente}
                                <li class="nav-item">
                                    <a class="nav-link" href="{$WEB_ROOT}/lst-docentes">Lista de Docentes</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{$WEB_ROOT}/msj">Mensajes</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{$WEB_ROOT}/cat-doc-docente">Documentos Docente</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{$WEB_ROOT}/tabla-costo">Tabla de Costos</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{$WEB_ROOT}/prog-academico">Programas Académicos</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{$WEB_ROOT}/repositorio">Repositorio Docente</a>
                                </li>
                            {/if}
                        </ul>
                    </div>
                </li>
                {if !$docente}
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#m-reportes" aria-expanded="false" aria-controls="m-reportes">
                            <span class="menu-title">Reportes</span>
                            <i class="menu-arrow"></i>
                            <i class="mdi mdi-chart-bar menu-icon"></i>
                        </a>
                        <div class="collapse" id="m-reportes">
                            <ul class="nav flex-column sub-menu">
                                {if !$docente}
                                    {*<li class="nav-item">
                                        <a class="nav-link" href="{$WEB_ROOT}/vehiculos">Vehículos</a>
                                    </li>*}
                                    <li class="nav-item">
                                        <a class="nav-link" href="{$WEB_ROOT}/report-materia">Materias</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="{$WEB_ROOT}/reporte-indicadores">Indicadores</a>
                                    </li>
                                    {*<li class="nav-item">
                                        <a class="nav-link" href="{$WEB_ROOT}/report-docentes">Docentes</a>
                                    </li>*}
                                    {*<li class="nav-item">
                                        <a class="nav-link" href="{$WEB_ROOT}/doc-mat">Docentes/Materias</a>
                                    </li>*}
                                    {*<li class="nav-item">
                                        <a class="nav-link" href="{$WEB_ROOT}/reporte-general">Reporte General</a>
                                    </li>*}
                                {/if}
                            </ul>
                        </div>
                    </li>
                {/if}
            {/if}
        {/if}

        {if $User.positionId == 1 || $AccessMod[13] == 1 || $AccessMod[14] == 1 || $AccessMod[15] == 1 || $AccessMod[16] == 1 || $AccessMod[38] == 1}
            {if $vistaPrevia ne 1}
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#m-configuraciones" aria-expanded="false" aria-controls="m-configuraciones">
                        <span class="menu-title">Configuraciones</span>
                        <i class="menu-arrow"></i>
                        <i class="mdi mdi-settings menu-icon"></i>
                    </a>
                    <div class="collapse" id="m-configuraciones">
                        <ul class="nav flex-column sub-menu">
                            {if $AccessMod[38] != 1}
                            <li class="nav-item">
                                <a class="nav-link" href="{$WEB_ROOT}/institution"> Institución </a>
                            </li>
                            {/if} 
                            <li class="nav-item">
                                <a class="nav-link" href="{$WEB_ROOT}/configuracion-certificados"> Certificados </a>
                            </li>
                        </ul>
                    </div> 
                </li>
            {/if}
        {/if}

        {if $mnuMain == "modulo1" || $mnuMain == "modulo"}
            <li class="nav-item">
                <a class="nav-link" href="{$WEB_ROOT}/view-modules-student/id/{$id}">
                    <span class="menu-title">Anuncios</span>
                    <i class="mdi mdi-message menu-icon"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{$WEB_ROOT}/information-modules-student/id/{$id}">
                    <span class="menu-title">Información</span>
                    <i class="mdi mdi-information menu-icon"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{$WEB_ROOT}/grupo/id/{$id}">
                    <span class="menu-title">Grupo</span>
                    <i class="mdi mdi-account-multiple menu-icon"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{$WEB_ROOT}/docente/id/{$id}">
                    <span class="menu-title">Asesor</span>
                    <i class="mdi mdi-help-circle menu-icon"></i>
                </a>
            </li>
            {if $mnuMain == "modulo"}
                <li class="nav-item">
                    <a class="nav-link" href="{$WEB_ROOT}/calendar-image-modules-student/id/{$id}">
                        <span class="menu-title">Calendario</span>
                        <i class="mdi mdi-calendar menu-icon"></i>
                    </a>
                </li>
            {/if}
            <li class="nav-item">
                <a class="nav-link" href="{$WEB_ROOT}/calendar-modules-student/id/{$id}">
                    <span class="menu-title">Actividades</span>
                    <i class="mdi mdi-checkbox-multiple-marked-outline menu-icon"></i>
                </a>
            </li>
            {if $mnuMain == "modulo"}
                <li class="nav-item">
                    <a class="nav-link" href="{$WEB_ROOT}/presentation-modules-student/id/{$id}">
                        <span class="menu-title">Clase</span>
                        <i class="mdi mdi-bookmark menu-icon"></i>
                    </a>
                </li>
            {/if}
            <li class="nav-item">
                <a class="nav-link" href="{$WEB_ROOT}/examen-modules-student/id/{$id}">
                    <span class="menu-title">Exámenes</span>
                    <i class="mdi mdi-library menu-icon"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{$WEB_ROOT}/resources-modules-student/id/{$id}">
                    <span class="menu-title">Recursos de Apoyo</span>
                    <i class="mdi mdi-dropbox menu-icon"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{$WEB_ROOT}/reply-inbox/id/{$id}/cId/0">
                    <span class="menu-title">Inbox</span>
                    <i class="mdi mdi-email menu-icon"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{$WEB_ROOT}/forum-modules-student/id/{$id}">
                    <span class="menu-title">Foro</span>
                    <i class="mdi mdi-message-processing menu-icon"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{$WEB_ROOT}/team-modules-student/id/{$id}">
                    <span class="menu-title">Mi Equipo</span>
                    <i class="mdi mdi-apps menu-icon"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{$WEB_ROOT}/wiki/index.php/Página_principal">
                    <span class="menu-title">Wiki</span>
                    <i class="mdi mdi-wikipedia menu-icon"></i>
                </a>
            </li>
        {/if}
    </ul>
</nav>