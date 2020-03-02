<form class="form-horizontal" id="addSubjectForm" name="addSubjectForm" method="post" action="{$WEB_ROOT}/new-module/id/{$id}">
    <input type="hidden" name="subjectId" id="subjectId" value="{$id}" />
    <div class="form-body">
        <div class="form-group">
            <label class="col-md-3 control-label">Nombre:</label>
            <div class="col-md-8">
                <input type="text" name="frmName" id="frmName" class="form-control" value="" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Clave:</label>
            <div class="col-md-8">
                <input type="text" name="frmClave" id="frmClave" class="form-control" value="" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Cuatrimestre/Semestre:</label>
            <div class="col-md-8">
                <input type="text" name="semesterId" id="semesterId" class="form-control" value="1" maxlength="2" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Texto de Bienvenida:</label>
            <div class="col-md-8">
                <textarea id="welcomeText" name="welcomeText" rows="15" cols="80" style=""  ></textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Introducción:</label>
            <div class="col-md-8">
                <textarea id="introduction" name="introduction" rows="15" cols="80" style=""  ></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Intenciones:</label>
            <div class="col-md-8">
                <textarea id="intentions" name="intentions" rows="15" cols="80" style=""  ></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Objetivos:</label>
            <div class="col-md-8">
                <textarea id="objectives" name="objectives" rows="15" cols="80" style=""  ></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Temario:</label>
            <div class="col-md-8">
                <textarea id="themes" name="themes" rows="15" cols="80" style=""  ></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Esquema:</label>
            <div class="col-md-8">
                <textarea id="scheme" name="scheme" rows="15" cols="80" style="" ></textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Metodología:</label>
            <div class="col-md-8">
                <textarea id="methodology" name="methodology" rows="15" cols="80" style="" ></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Políticas:</label>
            <div class="col-md-8">
                <textarea id="politics" name="politics" rows="15" cols="80" style="" ></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Evaluación:</label>
            <div class="col-md-8">
                <textarea id="evaluation" name="evaluation" rows="15" cols="80" style="" ></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Bibliografía:</label>
            <div class="col-md-8">
                <textarea id="bibliography" name="bibliography" rows="15" cols="80" style="" ></textarea>
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


<script type="text/javascript">
    tinyMCE.init({
        mode : "textareas",
        theme : "advanced",
        skin : "o2k7"

    });
</script>