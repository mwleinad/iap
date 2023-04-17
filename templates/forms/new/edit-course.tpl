<form id="editSubjectForm" name="editSubjectForm" method="post" action="{$WEB_ROOT}/edit-course/id/{$post.courseId}">
    <input type="hidden" id="courseId" name="courseId" value="{$post.courseId}"/>

    <div class="row">
        <div class="form-group col-md-6">
            <label for="subjectId">Selecciona Curso</label>
            <select name="subjectId" id="subjectId" class="form-control">
                {foreach from=$cursos item=curso}
                    <option value="{$curso.subjectId}" {if $post.subjectId == $curso.subjectId} selected="selected"{/if}>{$curso.name}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="modality">Modalidad</label>
            <select name="modality" id="modality"  class="form-control">
                <option value="Local" {if $post.modality == "Local"} selected="selected"{/if}>Escolar</option>
                <option value="Online" {if $post.modality == "Online"} selected="selected"{/if}>No Escolar</option>
                <option value="Mixto" {if $post.modality == "Mixto"} selected="selected"{/if}>Mixto</option>
            </select>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-6">
            <label for="initialDate">Fecha Inicial</label>
            <input type="text" name="initialDate" id="initialDate" size="10" class="form-control i-calendar" value="{$post.initialDate}" required />
        </div>
        <div class="form-group col-md-6">
            <label for="finalDate">Fecha Final</label>
            <input type="text" name="finalDate" id="finalDate" size="10" class="form-control i-calendar" value="{$post.finalDate}" required />
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-4">
            <label for="daysToFinish">Dias para terminar</label>
            <input type="text" name="daysToFinish" id="daysToFinish" value="{$post.daysToFinish}"  class="form-control"/>
        </div>
        <div class="form-group col-md-4">
            <label for="personalId">Personal Administrativo Asignado</label>
            <select name="personalId" id="personalId"  class="form-control">
                <option value="-1">Seleccione...</option>
                {foreach from=$empleados item=personal}
                    <option value="{$personal.personalId}" {if $post.access.0 == $personal.personalId} selected="selected"{/if}>{$personal.lastname_paterno} {$personal.lastname_materno} {$personal.name}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-4">
            <label for="active">Activo</label>
            <select name="active" id="active"  class="form-control">
                <option value="Si" {if $post.active == "Si"} selected="selected"{/if}>Si</option>
                <option value="No" {if $post.active == "No"} selected="selected"{/if}>No</option>
            </select>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-4">
            <label for="group">Grupo</label>
            <input type="text" name="group" id="group" value="{$post.group}" class="form-control"/>
        </div>
        <div class="form-group col-md-4">
            <label for="turn">Turno</label>
            <input type="text" name="turn" id="turn" value="{$post.turn}" class="form-control"/>
        </div>
        <div class="form-group col-md-4">
            <label for="scholarCicle">Ciclo Escolar</label>
            <input type="text" name="scholarCicle" id="scholarCicle" value="{$post.scholarCicle}" class="form-control"/>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-4">
            <label for="libro">Libro</label>
            <input type="text" name="libro" id="libro" value="{$post.libro}"  class="form-control"/>
        </div>
        <div class="form-group col-md-4">
            <label for="folio">Folio</label>
            <input type="text" name="folio" id="folio" value="{$post.folio}"  class="form-control"/>
        </div>
        <div class="form-group col-md-4">
            <label for="ponenteText">Texto Ponente</label>
            <input type="text" name="ponenteText" id="ponenteText" value="{$post.ponenteText}"  class="form-control"/>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-6">
            <label for="fechaDiploma">Fecha del Diploma</label>
            <input type="text" name="fechaDiploma" id="fechaDiploma" value="{$post.fechaDiploma}"  class="form-control i-calendar"/>
        </div>
        <div class="form-group col-md-6">
            <label for="backDiploma">Sede</label>
            <input type="text" name="backDiploma" id="backDiploma" value="{$post.backDiploma}"  class="form-control"/>
        </div>
    </div>

    <span class="badge badge-dark">Información para Constancias</span><hr />

    <div class="row">
        <div class="form-group col-md-6">
            <label for="dias"> Dias:</label>
            <input type="text" name="dias" id="dias" value="{$post.dias}" class="form-control"/>
        </div>
		<div class="form-group col-md-6">
            <label for="horario"> Horario:</label>
            <input type="text" name="horario" id="horario" value="{$post.horario}" class="form-control"/>
        </div>
    </div>

    <span class="badge badge-dark">Información para Configuración</span>
    <hr />

    <div class="row">
        <div class="form-group col-md-6">
            <label for="temporalGroup">Grupo Temporal <small>(Seleccione si se trata de un grupo oficial)</small>:</label>
            <select name="temporalGroup" id="temporalGroup" class="form-control">
                <option value="0" {if $post.temporalGroup == 0} selected {/if}>SIN GRUPO TEMPORAL</option>
                {foreach from=$activeCourses item=course}
                    <option value="{$course.courseId}" {if $post.temporalGroup == $course.courseId} selected {/if}>
                        {$course.majorName} - {$course.name} - {$course.group}
                    </option>
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="tipoCuatri">Tipo:</label>
            <select type="checkbox" name="tipoCuatri" id="tipoCuatri"   class="form-control">
                <option></option>
                <option {if $post.tipoCuatri == "Cuatrimestre"} selected="selected"{/if}>Cuatrimestre</option>
                <option {if $post.tipoCuatri == "Semestre"} selected="selected"{/if}>Semestre</option>
            </select >
        </div>
    </div>

    <div class="row">
		<div class="form-group col-md-6">
            <label for="apareceT">Aparece en Tabla:</label>
            <input type="checkbox" name="apareceT" id="apareceT" {if $post.apareceTabla eq 'si'} checked {/if} class="form-control"/>
        </div>
		<div class="form-group col-md-6">
            <label for="listar">Listar:</label>
            <input type="checkbox" name="listar" id="listar" {if $post.listar eq 'si'} checked {/if} class="form-control"/>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12 text-center">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
            <button type="submit" class="btn btn-success submitForm">Guardar</button>
        </div>
    </div>
</form>

<script>
    flatpickr('.i-calendar', {
        dateFormat: "Y-m-d"
    });
</script>