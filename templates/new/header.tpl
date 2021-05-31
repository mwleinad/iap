<nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo" href="{$WEB_ROOT}">
            <img src="{$WEB_ROOT}/images/logos/Logo_3.png" alt="IAP Chiapas" class="img-fluid" />
        </a>
        <a class="navbar-brand brand-logo-mini" href="{$WEB_ROOT}">
            <img src="{$WEB_ROOT}/images/logos/iconIap.png" alt="IAP Chiapas" class="img-fluid" />
        </a>
    </div>
    <div class="navbar-menu-wrapper d-flex align-items-stretch">
        {if (($User.type ne "Docente") and ($User.type ne "student"))}
            <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                <span class="fas fa-bars text-white"></span>
            </button>
        {/if}
        <ul class="navbar-nav navbar-nav-right">
            <li class="nav-item nav-profile dropdown">
                <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                    <div class="nav-profile-img">
                        <i class="fas fa-user-circle fa-3x text-white"></i>
                        <span class="availability-status online"></span>             
                    </div>
                    <div class="nav-profile-text">
                        <p class="mb-1 text-black">{if $User.username}Bienvenido {$User.username} :: {/if}{$fechaHoy}</p>
                    </div>
                </a>
                <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                    <a class="dropdown-item" href="{$WEB_ROOT}/perfil">
                        <i class="mdi mdi-account mr-2 text-primary"></i>
                        Perfil
                    </a>
                    <a class="dropdown-item" href="{$WEB_ROOT}/alumn-services">
                        <i class="mdi mdi-information mr-2 text-primary"></i>
                        Actualizar Información
                    </a>
                    <a class="dropdown-item" href="{$WEB_ROOT}/graybox.php?page=contra" data-target="#ajax" data-toggle="modal" data-width="1000px">
                        <i class="mdi mdi-key mr-2 text-primary"></i>
                        Cambiar Contraseña
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="{$WEB_ROOT}/logout">
                        <i class="mdi mdi-logout mr-2 text-primary"></i>
                        Cerrar Sesión
                    </a>
                </div>
            </li>
            <li class="nav-item d-none d-lg-block full-screen-link">
                <a class="nav-link">
                    <i class="mdi mdi-fullscreen text-white" id="fullscreen-button"></i>
                </a>
            </li>
        </ul>
    </div>
</nav>