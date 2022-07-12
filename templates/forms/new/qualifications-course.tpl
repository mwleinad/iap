<form action="{$WEB_ROOT}/ajax/boleta-calificaciones.php" method="POST" target="_blank">
    <input type="hidden" id="course" name="course" value="{$info.courseId}" />

    <div class="row">
        <div class="form-group col-md-6">
            <label for="students">Selecciona Alumno <small>(Para seleccionar más de un alumno, manten presionada la tecla Ctrl y da click sobre los alumnos)</small></label>
            <select name="students[]" id="students" class="form-control" multiple>
                {foreach from=$students item=item}
                    <option value="{$item.userId}" class="text-capitalize">
                        {$item.lastNamePaterno|upper} {$item.lastNameMaterno|upper} {$item.names|upper}
                    </option>
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="semester">Cuatrimestre/Semestre</label>
            <select name="semester" id="semester" class="form-control" onchange="additional()">
                <option value="">-- Seleccionar --</option>
                {for $period=1 to $info.totalPeriods}
                    <option value="{$period}">{$period}</option>
                {/for}
            </select>
        </div>
    </div>

    <div id="additional" class="row"></div>

    <div class="row d-flex justify-content-center">
        <div class="form-group col-md-6">
            <label for="date">Fecha de Boleta</label>
            <input type="text" name="date" id="date" class="form-control i-calendar" required />
        </div>
        <div class="form-group col-md-6">
            <label for="notification">¿Notificar por Correo?</label>
            <select name="notification" id="notification" class="form-control">
                <option value="1">Si</option>
                <option value="0">No</option>
            </select>
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