<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-school"></i>                 
        </span>
        Instancias de Curricula
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>Curricula
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>

<div class="card mb-4">
    <div class="card-header bg-primary text-white header_main p-2"> 
		{if $docente != 1}
			<a href="{$WEB_ROOT}/graybox.php?page=open-subject" class="btn btn-info float-right d-inline" data-target="#ajax" data-toggle="modal">
				<i class="fas fa-plus"></i> Agregar
			</a>
		{/if}
    </div>
    <div class="card-body">
		{if $msj == 'si'}
			<div class="alert alert-info alert-dismissible fade show" role="alert">
				Los datos se guardaron correctamente
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		{/if}
		{if $perfil ne 'Docente'}
			<form id="frmFlt1">
				<div class="row">
					<div class="form-group col-md-4">
						<label for="curricula">Tipo Curricula</label>
						<select class="form-control" onchange="onBuscar()" name="curricula" id="curricula">
							<option value="0" disabled selected>-- Seleccionar --</option>
							{if $User.userId != 253}
								<option value="">Todo el Historial</option>
							{/if}
							{foreach from=$lstMajor item=subject}
								<option value="{$subject.majorId}">{$subject.name}</option>
							{/foreach}
						</select>
					</div>
					<div class="form-group col-md-4">
						<label for="activo">Activo</label>
						<select class="form-control" onchange="onBuscar()" name="activo" id="activo">
							<option></option>
							<option>si</option>
							<option>no</option>
						</select>
					</div>
					<div class="form-group col-md-4">
						<label for="modalidad">Modalidad</label>
						<select class="form-control" onchange="onBuscar()" name="modalidad" id="modalidad">
							<option></option>
							<option>No Escolar</option>
							<option value="Local">Escolar</option>
						</select>
					</div>
				</div>
			</form>
		{/if}
        <div id="tblContent" class="table-responsive">
			{include file="lists/new/courses.tpl"}
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