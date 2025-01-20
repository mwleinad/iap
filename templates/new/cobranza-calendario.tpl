<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-cash"></i>                 
        </span>
        Instancias de Curricula
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>Cobranza
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>

<div class="card mb-4">
    <div class="card-header bg-primary text-white header_main">
        <div class="sub_header"><i class="fas fa-calendar-alt"></i> Instancias de Curricula</div>
    </div>
    <div class="card-body">
        {if $msj == 'si'}
            <div class="row">
                <div class="col-md-12">
                    <div class="alert alert-info alert-dismissible fade show" role="alert">
                        Los datos se guardaron correctamente.
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </div>
            </div>
        {/if}
        {if $perfil ne 'Docente'}
            <form id="frmFlt1">
                <div class="row">
                    <div class="form-group col-md-4">
                        <label for="activo">Activo:</label>
                        <select id="activo" class="form-control" onClick="onBuscar()" name="activo">
                            <option value="">-- Seleccionar --</option>
                            <option>si</option>
                            <option>no</option>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="modalidad">Modalidad:</label>
                        <select id="modalidad" class="form-control" onClick="onBuscar()" name="modalidad">
                            <option value="">-- Seleccionar --</option>
                            <option value="Online">No Escolar</option>
                            <option value="Local">Escolar</option>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="curricula">Tipo Curricula:</label>
                        <select id="curricula" class="form-control" onClick="onBuscar()" name="curricula">
                            <option value="">-- Seleccionar --</option>
                            {foreach from=$lstMajor item=subject}
                                <option value="{$subject.majorId}">{$subject.name}</option>
                            {/foreach}
                        </select>
                    </div>
                </div>
            </form>
		{/if}
        <div class="row">
            <div class="col-md-12">
                <div id="tblContent" class="table-responsive">
                    {include file="lists/new/calendar-courses.tpl"}
                </div>
            </div>
        </div>
        {if $coursesCount}
            <div class="row">
                <div class="col-md-12">
                    <div id="pagination" class="lnkPages">
                        {include file="footer-pages-links.tpl"}
                    </div>
                </div>
            </div>
        {/if}
    </div>
</div>
<input type="hidden" id="viewPage" name="viewPage" value="{$arrPage.currentPage}" />


