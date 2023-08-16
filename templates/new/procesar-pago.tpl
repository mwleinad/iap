<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-credit-card"></i>                 
        </span>
        Pago en Línea
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
    <div class="card-header text-white {if $success} bg-success {else} bg-danger {/if}">
        <i class="fas fa-credit-card"></i> Pago {if $success} Exitoso {else} Declinado {/if}
    </div>
    <div class="card-body">
        <div class="row d-flex justify-content-center">
            <div class="col-md-8 col-md-offset-2 text-center">
                {if $success}

                {else}
                    <p>{$message}</p>
                {/if}
                <a href="{$WEB_ROOT}" class="btn btn-success mt-3">Volver</a>
            </div>
        </div>
    </div>
</div>