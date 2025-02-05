<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-school"></i>
        </span>
        Instancias de Currícula
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>Currícula
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>
<div class="card mb-4">
    <div class="card-header bg-primary text-white header_main">
        <span class="sub_header"><i class="fas fa-list"></i> Instancias de Currícula</span>
        {if $User['perfil'] != "Docente"}
            <a href="{$WEB_ROOT}/graybox.php?page=open-subject" class="btn btn-info float-right" data-target="#ajax"
                data-toggle="modal">
                <i class="fas fa-plus"></i> Agregar
            </a>
        {/if}
    </div>
    <div class="card-body">
        {if $perfil ne 'Docente'}
            <form method="POST" action="{$WEB_ROOT}/curriculas" id="form_search">
                <div class="row">
                    <div class="form-group col-md-4">
                        <label for="curricula">Tipo Currícula</label>
                        <select class="form-control auto-submit" name="curricula" id="curricula">
                            <option value="0" disabled selected>-- Seleccionar --</option>
                            {if $User.userId != 253}
                                <option value="">Todo el Historial</option>
                            {/if}
                            {foreach from=$major item=subject}
                                <option value="{$subject.majorId}" {($curricula == $subject.majorId) ? "selected" : ""}>
                                    {$subject.majorName}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="modalidad">Modalidad</label>
                        <select class="form-control auto-submit" name="modalidad" id="modalidad">
                            <option></option>
                            <option value="Online" {($modalidad == "Online") ? "selected" : ""}>No Escolar</option>
                            <option value="Local" {($modalidad == "Local") ? "selected" : ""}>Escolar</option>
                            <option value="Mixta" {($modalidad == "Mixta") ? "selected" : ""}>Mixta</option>
                        </select>
                    </div>
                </div>
            </form>
        {/if} 
        <div id="accordion">
            {foreach from=$subjects item=item}
                <div class="card">
                    <div class="card-header collapsed card-link pointer" data-toggle="collapse"
                        href="#collapse{$item.subjectId}">
                        [{$item.majorName}] {$item.name} </div>
                    <div id="collapse{$item.subjectId}" class="collapse" data-parent="#accordion">
                        <div class="col-md-12 py-4 w-100">
                            <table class="table datatable" style="width:100%;" id="datatable{$item.subjectId}"
                                data-url="{$WEB_ROOT}/curriculas/id/{$item.subjectId}">
                                <thead>
                                    <tr>
                                        <td>ID</td>
                                        <td>RVOE</td>
                                        <td>Nombre</td>
                                        <td>Grupo</td>
                                        <td>Modalidad</td>
                                        <td>Fecha Inicial</td>
                                        <td>Fecha Final</td>
                                        <td>Módulos</td>
                                        <td>Alumnos(A/I)</td>
                                        <td>Acciones</td>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>
    </div>
</div>
<input type="hidden" id="viewPage" name="viewPage" value="{$arrPage.currentPage}" />
{literal}
    <style>
        .compact {
            white-space: break-spaces !important;
        }
    </style>
{/literal}