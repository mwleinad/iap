<form action="{$WEB_ROOT}/ajax/constancia-calificaciones.php" method="GET" target="_blank">
    <input type="hidden" id="course" name="course" value="{$info.courseId}" />

    <div class="row">
        <div class="form-group col-md-4">
            <label for="student">Selecciona Alumno</label>
            <select name="student" id="student" class="form-control">
                <option value="0">-- Seleccionar Alumno --</option>
                {foreach from=$students item=item}
                    <option value="{$item.userId}" class="text-capitalize">
                        {$item.lastNamePaterno|upper} {$item.lastNameMaterno|upper} {$item.names|upper}
                    </option>
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-4">
            <label for="date">Fecha</label>
            <input type="text" name="date" id="date" class="form-control i-calendar" required />
        </div>
        <div class="form-group col-md-4">
            <label for="consecutive">Consecutivo</label>
            <input type="text" name="consecutive" id="consecutive" class="form-control" required />
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