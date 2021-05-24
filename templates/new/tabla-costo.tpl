<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-cash"></i>                 
        </span>
        Tabla de Costos
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>Docente
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>

<div class="card mb-4">
    <div class="card-header bg-primary text-white">
		<i class="fas fa-money-bill-wave"></i> Tabla de Costos
    </div>
    <div class="card-body">
        {if $msj == 'si'}
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                Los datos se guardaron correctamente.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
		{/if}
        <div id="tblContent" class="table-responsive">
            {include file="lists/new/tabla-costo.tpl"}
        </div>
        {if $coursesCount}
            <div id="pagination" class="lnkPages">
                {include file="footer-pages-links.tpl"}
            </div>
        {/if}
    </div>
</div>
<input type="hidden" id="viewPage" name="viewPage" value="{$arrPage.currentPage}" />
