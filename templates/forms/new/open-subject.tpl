<form class="form" id="form_modal" method="post" action="{$WEB_ROOT}/open-subject">
    <div class="row">
        <div class="form-group col-md-6">
            <label for="subjectId">Selecciona Curricula:</label>
            <select name="subjectId" id="subjectId" class="form-control">
                {foreach from=$cursos item=curso}
                <option value="{$curso.subjectId}">{$curso.majorName} - {$curso.name} {if $curso.rvoe != ""} [{$curso.rvoe}] {/if}</option>
                {/foreach}
            </select>
            <span class="invalid-feedback"></span>
        </div>
        <div class="form-group col-md-6">
            <label for="modality">Modalidad:</label>
            <select name="modality" id="modality" class="form-control">
                <option value="Local">Escolar (Presencial)</option>
                <option value="Online">No Escolar (En Línea)</option>
                <option value="Mixta">Mixta</option>
            </select>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-6">
            <label for="initialDate">Fecha Inicial:</label>
            <input type="text" name="initialDate" id="initialDate" size="10" class="form-control i-calendar" required/>
        </div>
        <div class="form-group col-md-6">
            <label for="finalDate"> Fecha Final:</label>
            <input type="text" name="finalDate" id="finalDate" size="10"  class="form-control i-calendar"/>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-4">
            <label for="daysToFinish"> Dias para terminar:</label>
            <input type="text" name="daysToFinish" id="daysToFinish" class="form-control"/>
        </div>
        <div class="form-group col-md-4">
            <label for="personalId">Personal Administrativo Asignado:</label>
            <select name="personalId" id="personalId" class="form-control">
                <option value="-1">Seleccione...</option>
                {foreach from=$empleados item=personal}
                    <option value="{$personal.personalId}">
                        {$personal.lastname_paterno} {$personal.lastname_materno} {$personal.name}
                    </option>
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-4">
            <label for="active">Activo:</label>
            <select name="active" id="active" class="form-control">
                <option value="Si">Si</option>
                <option value="No">No</option>
            </select>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-4">
            <label for="group"> Grupo:</label>
            <input type="text" name="group" id="group" value="{$post.group}"  class="form-control"/>
        </div>
        <div class="form-group col-md-4">
            <label for="turn"> Turno:</label>
            <input type="text" name="turn" id="turn" value="{$post.turn}"  class="form-control"/>
        </div>
        <div class="form-group col-md-4">
            <label for="scholarCicle"> Ciclo Escolar:</label>
            <input type="text" name="scholarCicle" id="scholarCicle" value="{$post.scholarCicle}"  class="form-control"/>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-6">
            <label for="libro"> Libro:</label>
            <input type="text" name="libro" id="libro" value="{$post.libro}"  class="form-control"/>
        </div>
        <div class="form-group col-md-6">
            <label for="folio">Folio:</label>
            <input type="text" name="folio" id="folio" value="{$post.folio}"  class="form-control"/>
        </div>
    </div>

    <span class="badge badge-dark">Información para Constancias</span>
    <hr />

    <div class="row">
		<div class="form-group col-md-6">
            <label for="dias">Dias:</label>
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
                <option value="0">SIN GRUPO TEMPORAL</option>
                {foreach from=$activeCourses item=course}
                    <option value="{$course.courseId}">{$course.majorName} - {$course.name} - {$course.group}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="tipoCuatri">Tipo:</label>
            <select type="checkbox" name="tipoCuatri" id="tipoCuatri" class="form-control">
                <option></option>
                <option>Cuatrimestre</option>
                <option>Semestre</option>
            </select >
            <span class="invalid-feedback"></span>
        </div>
    </div>

    <div class="row">
		<div class="form-group col-md-6">
            <label for="apareceT">Aparece en Tabla:</label>
            <input type="checkbox" name="apareceT" id="apareceT" class="form-control"/>
        </div>
		<div class="form-group col-md-6">
            <label for="listar">Listar:</label>
            <input type="checkbox" name="listar" id="listar" class="form-control"/>
        </div>
    </div>
    
    <div class="row">
        <div class="form-group col-md-12 text-center">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
            <button type="submit" class="btn btn-success">Guardar</button>
        </div>
    </div>
</form>

<script>
    flatpickr('.i-calendar', {
        dateFormat: "Y-m-d"
    });
</script>