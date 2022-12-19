<form class="form" id="form_add_activity" method="post" action="{$WEB_ROOT}/edit-activity/id/{$id}">
    <input type="hidden" id="auxTpl" name="auxTpl" value="{$auxTpl}" />
    <input type="hidden" id="cId" name="cId" value="{$cId}" />
    <input type="hidden" id="type" name="type" value="saveAddMajor" />
	
    <div class="row">
        <div class="form-group col-md-12">
            <label for="activityType">Tipo de Actividad:</label>
            <select id="activityType" name="activityType" class="form-control">
                <option value="Lectura" {if $actividad.activityType == "Lectura"} selected="selected"{/if}>Lectura</option>
                <option value="Tarea" {if $actividad.activityType == "Tarea"} selected="selected"{/if}>Tarea</option>
                <option value="Examen" {if $actividad.activityType == "Examen"} selected="selected"{/if}>Examen</option>
                <option value="Foro" {if $actividad.activityType == "Foro"} selected="selected"{/if}>Foro</option>
                <option value="Otro" {if $actividad.activityType == "Otro"} selected="selected"{/if}>Otro</option>
            </select>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="initialDate">Fecha Inicial:</label>
            <input type="text" name="initialDate" id="initialDate" value="{$actividad.initialDate}" class="form-control i-calendar" />
        </div>
		<div class="form-group col-md-6">
            <label for="horaInicial">Hora Inicial:</label>
            <input type="time" name="horaInicial" id="horaInicial" value="{$actividad.horaInicial}" class="form-control" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="finalDate">Fecha Final:</label>
            <input type="text" name="finalDate" id="finalDate" value="{$actividad.finalDate}" class="form-control i-calendar" />
        </div>
		<div class="form-group col-md-6">
            <label for="hora">Hora Final:</label>
            <input type="time" name="hora" id="hora" value="{$actividad.horaFinal}" class="form-control" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="modality">Modalidad:</label>
            <select id="modality" name="modality" class="form-control">
                <option value="Individual" {if $actividad.modality == "Individual"} selected="selected"{/if}>Individual</option>
                <option value="Por Equipo" {if $actividad.modality == "Por Equipo"} selected="selected"{/if}>Por Equipo</option>
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="resumen">Titulo:</label>
            <input type="text" name="resumen" id="resumen" value="{$actividad.resumen}" maxlength="30" class="form-control"/>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-12">
            <label for="description">Descripcion:</label>
            <textarea name="description" id="description">{$actividad.description}</textarea>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="requiredActivity">Actividad Requerida:</label>
            <select id="requiredActivity" name="requiredActivity" class="form-control">
                <option value="0">Ninguna</option>
                {foreach from=$actividades item=item}
                    <option value="{$item.activityId}" {if $actividad.requiredActivity == $item.activityId} selected="selected"{/if}>{$item.resumen}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="ponderation">Ponderacion:</label>
            <input type="number" name="ponderation" id="ponderation" value="{$actividad.ponderation}" maxlength="3" class="form-control" min="0"/>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-12 text-center">
            <input type="submit" class="btn btn-success submitForm" id="addMajor" name="addMajor" value="Guardar" />
            <button type="button" class="btn btn-danger closeModal">Cancelar</button>
        </div>
    </div>
</form>
<script type="text/javascript">
    var editor = new Jodit('#description', {
        language: "es",
        toolbarButtonSize: "small",
        autofocus: true,
        toolbarAdaptive: false
    });
    $('.modal').removeAttr('tabindex');

    flatpickr('.i-calendar', {
        dateFormat: "d-m-Y"
    });
</script>