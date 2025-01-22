<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-white-balance-incandescent"></i>
        </span>
        Reglamento General de Posgrado
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>IAP Chiapas
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>

<div class="card mb-4">
    <div class="card-header bg-primary header_main">
        <div class="sub_header">
            <i class="fas fa-graduation-cap"></i> Reglamento General de Posgrado
        </div>
        {if $accepted}
            <a href="{$WEB_ROOT}/recursos/pdf/RGP.pdf" target="_blank" class="btn btn-info float-right" download>
                <i class="far fa-file-pdf"></i> Descargar Reglamento
            </a>
        {/if}
    </div>
    <div class="card-body">
        <div class="row d-flex justify-content-center">
            {if $accepted}
                <div class="col-md-8 col-md-offset-2">
                    <embed src="{$WEB_ROOT}/recursos/pdf/RGP.pdf" type="application/pdf" width="100%" height="800px" />
                </div>
            {else}
                <div class="col-md-8 col-md-offset-2 text-center">
                    <p class="text-justify">
                        Manifiesto por este medio, haber recibido de parte de la Dirección Académica del Instituto de
                        Administración Pública del Estado de Chiapas, el documento titulado:
                    </p>
                    <br /><br />
                    <h4><b>REGLAMENTO GENERAL DE POSGRADO</b></h4>
                    <br /><br />
                    <p class="text-justify">
                        El cual tendrá observancia durante todo mi proceso como estudiante en los programas del Instituto, y
                        cuyo contenido me permite conocer mis derechos y obligaciones académicas, y a la vez cumplir con mis
                        deberes.
                    </p>
                    <br /><br />
                    <p>{$nombre}</p>
                </div>
                <div class="col-md-12 text-center">
                    <form action="{$WEB_ROOT}/reglamento" method="POST">
                        <input type="hidden" name="accepted" value="1" />
                        <button type="submit" class="btn btn-success">
                            Acepto
                        </button>
                    </form>
                </div>
            {/if}
        </div>
    </div>
</div>