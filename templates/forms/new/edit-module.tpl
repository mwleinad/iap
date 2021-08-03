<form id="editSubjectForm" name="editSubjectForm" method="post" action="{$WEB_ROOT}/edit-module/id/{$post.subjectModuleId}">
    <input type="hidden" id="subjectModuleId" name="subjectModuleId" value="{$post.subjectModuleId}"/>
    <input type="hidden" id="subjectId" name="subjectId" value="{$post.subjectId}"/>
    
    <div class="row">
        <div class="form-group col-md-4">
            <label for="frmName">Nombre:</label>
            <input type="text" name="frmName" id="frmName" class="form-control" value="{$post.name}" {if $docente} readonly="readonly"{/if} />
        </div>
        <div class="form-group col-md-4">
            <label for="frmClave">Clave:</label>
            <input type="text" name="frmClave" id="frmClave" class="form-control"  value="{$post.clave}" {if $docente} readonly="readonly"{/if} />
        </div>
        <div class="form-group col-md-4">
            <label for="semesterId">Cuatrimestre/Semestre:</label>
            <input type="text" name="semesterId" id="semesterId" class="form-control" value="{$post.semesterId}" {if $docente} readonly="readonly"{/if} />
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="welcomeText">Texto de Bienvenida:</label>
            <textarea id="welcomeText" name="welcomeText" rows="15" cols="80">{$post.welcomeText}</textarea>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="introduction">Introducción:</label>
            <textarea id="introduction" name="introduction" rows="15" cols="80">{$post.introduction}</textarea>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="intentions">Intenciones:</label>
            <textarea id="intentions" name="intentions" rows="15" cols="80">{$post.intentions}</textarea>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="objectives">Objetivos:</label>
            <textarea id="objectives" name="objectives" rows="15" cols="80">{$post.objectives}</textarea>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="themes">Temario:</label>
            <textarea id="themes" name="themes" rows="15" cols="80">{$post.themes}</textarea>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="scheme">Esquema:</label>
            <textarea id="scheme" name="scheme" rows="15" cols="80">{$post.scheme}</textarea>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="methodology">Metodología:</label>
            <textarea id="methodology" name="methodology" rows="15" cols="80">{$post.methodology}</textarea>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="politics">Políticas:</label>
            <textarea id="politics" name="politics" rows="15" cols="80">{$post.politics}</textarea>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="evaluation">Evaluación:</label>
            <textarea id="evaluation" name="evaluation" rows="15" cols="80">{$post.evaluation}</textarea>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="bibliography">Bibliografía:</label>
            <textarea id="bibliography" name="bibliography" rows="15" cols="80">{$post.bibliography}</textarea>
        </div>
    </div>
    
    <div class="row">
        <div class="form-group col-md-12 text-center">
            <button type="submit" class="btn btn-success submitForm">Guardar</button>
            <button type="button" class="btn btn-danger closeModal">Cancelar</button>
        </div>
    </div>
</form>

{*<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-clipboard-list"></i> .:: Actividades ::.
        <a href="{$WEB_ROOT}/graybox.php?page=add-activity-c&id={$courseModuleId}&auxTpl=admin" class="btn btn-info float-right" data-target="#ajax" data-toggle="modal">
            <i class="fas fa-plus"></i> Agregar Actividad
        </a>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-12">
                <h4>Ponderación Total del Modulo: <b>{$totalPonderation}%</b></h4>
                {if $totalPonderation < 100}
                    <div class="alert alert-danger" role="alert">
                        La suma de las ponderaciones de las actividades es menor a 100%. Se recomienda que sea 100%
                    </div>
                {/if}
                {if $totalPonderation > 100}
                    <div class="alert alert-danger" role="alert">
                        La suma de las ponderaciones de las actividades es mayor a 100%. Se recomienda que sea 100%
                    </div>
                {/if}
            </div>
        </div>

        <div id="tblContent-activities" class="table-responsive">
            {include file="lists/new/activities.tpl"}
        </div>
    </div>
</div>

<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="far fa-folder-open"></i> .:: Recursos de Apoyo ::.
        <a href="{$WEB_ROOT}/graybox.php?page=add-resource-c&id={$courseModuleId}&auxTpl=admin&cId={$myModule.courseModuleId}" class="btn btn-info float-right" data-target="#ajax" data-toggle="modal">
            <i class="fas fa-plus"></i> Agregar Recurso de Apoyo
        </a>
    </div>
    <div class="card-body">
        <div id="tblContentResources" class="table-responsive">
            {include file="lists/new/resources.tpl"}
        </div>
    </div>
</div>*}

<script type="text/javascript">
    $(function() {
        $('textarea').each(function () {
            new Jodit(this, {
                language: "es",
                toolbarButtonSize: "small",
                autofocus: true,
                toolbarAdaptive: false
            });
            console.log("Activado");
        });
    });
</script>