<form class="form-horizontal" id="editSubjectForm" name="editSubjectForm" method="post" action="{$WEB_ROOT}/edit-module/id/{$post.subjectModuleId}">
    <input type="hidden" id="subjectModuleId" name="subjectModuleId" value="{$post.subjectModuleId}"/>
    <input type="hidden" id="subjectId" name="subjectId" value="{$post.subjectId}"/>
    <div class="form-body">
        <div class="form-group">
            <label class="col-md-3 control-label">Nombre:</label>
            <div class="col-md-8">
                <input type="text" name="frmName" id="frmName" class="form-control" value="{$post.name}" {if $docente} readonly="readonly"{/if} />
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Clave:</label>
            <div class="col-md-8">
                <input type="text" name="frmClave" id="frmClave" class="form-control"  value="{$post.clave}" {if $docente} readonly="readonly"{/if} />
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Cuatrimestre/Semestre:</label>
            <div class="col-md-8">
                <input type="text" name="semesterId" id="semesterId" class="form-control" value="{$post.semesterId}" {if $docente} readonly="readonly"{/if} />
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Texto de Bienvenida:</label>
            <div class="col-md-8">
                <textarea id="welcomeText" name="welcomeText" rows="15" cols="80" style=""  >{$post.welcomeText}</textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Introducción:</label>
            <div class="col-md-8">
                <textarea id="introduction" name="introduction" rows="15" cols="80" style=""  >{$post.introduction}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Intenciones:</label>
            <div class="col-md-8">
                <textarea id="intentions" name="intentions" rows="15" cols="80" style=""  >{$post.intentions}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Objetivos:</label>
            <div class="col-md-8">
                <textarea id="objectives" name="objectives" rows="15" cols="80" style=""  >{$post.objectives}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Temario:</label>
            <div class="col-md-8">
                <textarea id="themes" name="themes" rows="15" cols="80" style=""  >{$post.themes}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Esquema:</label>
            <div class="col-md-8">
                <textarea id="scheme" name="scheme" rows="15" cols="80" style="" >{$post.scheme}</textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Metodología:</label>
            <div class="col-md-8">
                <textarea id="methodology" name="methodology" rows="15" cols="80" style="" >{$post.methodology}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Políticas:</label>
            <div class="col-md-8">
                <textarea id="politics" name="politics" rows="15" cols="80" style="" >{$post.politics}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Evaluación:</label>
            <div class="col-md-8">
                <textarea id="evaluation" name="evaluation" rows="15" cols="80" style="" >{$post.evaluation}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Bibliografía:</label>
            <div class="col-md-8">
                <textarea id="bibliography" name="bibliography" rows="15" cols="80" style="" >{$post.bibliography}</textarea>
            </div>
        </div>


        <div class="form-actions">
            <div class="row">
                <div class="col-md-offset-3 col-md-9">
                    <button type="submit" class="btn green submitForm">Guardar</button>
                    <button type="button" class="btn default closeModal">Cancelar</button>
                </div>
            </div>
        </div>




    </div>
</form>

<br>
<br>
<br>

<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-gift"></i>.:: Actividades ::.
        </div>
        <div class="actions">
            <a href="{$WEB_ROOT}/graybox.php?page=add-activity-c&id={$courseModuleId}&auxTpl=admin" data-target="#ajax" data-toggle="modal" class="btn green">
                &raquo; Agregar actividad
            </a>
        </div>
    </div>
    <div class="portlet-body">
        <div style="text-align:left">Ponderaci&oacute;n Total del Modulo: <b>{$totalPonderation}%</b>
            {if $totalPonderation < 100}
                <span style="color:#C00"> La suma de las ponderaciones de las actividades es menor a 100%. Se recomienda que sea 100%</span>
            {/if}
            {if $totalPonderation > 100}
                <span style="color:#C00"> La suma de las ponderaciones de las actividades es mayor a 100%. Se recomienda que sea 100%</span>
            {/if}        </div>
        <a href="{$WEB_ROOT}/add-activity/id/{$myModule.courseModuleId}" onclick="return parent.GB_show('Agregar Actividad', this.href,650,700) "><div class="btnAdd" id="btnAddSubject"></div></a>

        <div id="tblContent-activities">{include file="lists/new/activities.tpl"}</div>
    </div>
</div>

<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-gift"></i>.:: Recursos de Apoyo ::.
        </div>
        <div class="actions">
            <a href="{$WEB_ROOT}/graybox.php?page=add-resource-c&id={$courseModuleId}&auxTpl=admin&cId={$myModule.courseModuleId}" data-target="#ajax" data-toggle="modal" class="btn green">
                &raquo; Agregar Recurso de Apoyo
            </a>
        </div>

    </div>
    <div class="portlet-body">
        <div id="tblContentResources">{include file="lists/new/resources.tpl"}</div>
    </div>
</div>

<script type="text/javascript">
    tinyMCE.init({
        mode : "textareas",
        theme : "advanced",
        skin : "o2k7"

    });
</script>