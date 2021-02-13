
<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-school"></i>                 
        </span>
        Alumnos
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>Catálogos
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>

<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-users"></i> Alumnos
        {include file="boxes/status_no_ajax.tpl"}
        <form method="post" name="frmReport" id="frmReport" action="">
            <input type="hidden" name="accion" value="export" />
            <input type="image" src="images/excel.gif"  title="Exportar alumnos a Excel" alt="Exportar alumnos a Excel">
        </form>
        <a href="{$WEB_ROOT}/graybox.php?page=add-alumno-admin&id={$item.userId}" class="btn btn-info float-right" data-target="#ajax" data-toggle="modal" data-width="1000px">
            <i class="fas fa-plus"></i> Agregar
        </a>
    </div>
    <div class="card-body">
        {include file="forms/search-student.tpl"}
        <div id="tblContent" class="table-responsive">
            {include file="lists/student.tpl"}
        </div>
        {if $studentsCount}
            <div id="pagination" class="lnkPages">
                {include file="footer-pages-links.tpl"}
            </div>
        {/if}
        <div id="loader2" ></div>
    </div>
</div>

<script type="text/javascript" charset="utf-8">
    $(document).observe('dom:loaded', function() {ldelim}
    {foreach from=$students item=item key=key}
        new FancyZoom('foto-{$item.userId}', {ldelim}width:400, height:300{rdelim});
    {/foreach}
    {rdelim});
</script>
