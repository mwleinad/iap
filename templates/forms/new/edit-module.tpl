<form id="formModule" class="form" method="post" action="{$WEB_ROOT}/edit-module/id/{$post.subjectModuleId}">
    <input type="hidden" id="subjectModuleId" name="subjectModuleId" value="{$post.subjectModuleId}" />
    <input type="hidden" id="subjectId" name="subjectId" value="{$post.subjectId}" />
    <input type="hidden" id="curso" name="curso" value="{$curso}">
    {if $urlBack}
        <input type="hidden" value="{$urlBack}" name="urlBack">
    {/if}
    <div class="row">
        <div class="form-group col-md-4">
            <label for="frmName">Nombre:</label>
            <input type="text" name="frmName" id="frmName" class="form-control" value="{$post.name}" {if $docente}
                readonly="readonly" {/if} />
        </div>
        <div class="form-group col-md-4">
            <label for="frmClave">Clave:</label>
            <input type="text" name="frmClave" id="frmClave" class="form-control" value="{$post.clave}" {if $docente}
                readonly="readonly" {/if} />
        </div>
        <div class="form-group col-md-2">
            <label for="semesterId">Cuatrimestre/Semestre:</label>
            <input type="text" name="semesterId" id="semesterId" class="form-control" value="{$post.semesterId}"
                {if $docente} readonly="readonly" {/if} />
        </div>
        <div class="form-group col-md-2">
            <label for="creditos">Créditos</label>
            <input type="text" name="creditos" id="creditos" class="form-control" value="{$post.credits}" {if $docente}
                readonly="readonly" {/if} />
        </div>
        <div class="col-md-2 form-group">
            <label for="tipo">¿Es parte de la currícula?</label>
            <select class="form-control" name="tipo" id="tipo">
                <option value="1">Sí</option>
                <option value="0" {($post.tipo == 0) ? "selected" : ""}>No</option>
            </select>
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
            <button type="submit" class="btn btn-success">Guardar</button>
            <a href="{if $urlBack} {$urlBack} {else} {$url} {/if}" class="btn btn-danger">Regresar</a>
        </div>
    </div>
</form>

<script type="text/javascript">
    $(function() {
        $('textarea').each(function() {
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