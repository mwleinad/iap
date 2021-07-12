<form action="{$WEB_ROOT}/ajax/boleta-calificaciones.php" method="GET" target="_blank">
    <input type="hidden" name="co" value="{$info.courseId}" />

    <div class="row">
        <div class="form-group col-md-6">
            <label for="al">Selecciona Alumno</label>
            <select name="al" id="al" class="form-control">
                <option value="0">-- Todos los Alumnos --</option>
                {foreach from=$students item=item}
                    <option value="{$item.userId}" class="text-capitalize">
                        {$item.lastNamePaterno|upper} {$item.lastNameMaterno|upper} {$item.names|upper}
                    </option>
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="cu">Cuatrimestre/Semestre</label>
            <select name="cu" id="cu" class="form-control">
                <option value="">-- Seleccionar --</option>
                {for $period=1 to $info.totalPeriods}
                    <option value="{$period}">{$period}</option>
                {/for}
            </select>
        </div>
    </div>

    <div class="row d-flex justify-content-center">
        {*<div class="form-group col-md-6">
            <label for="pe">Periodo</label>
            <select name="pe" id="pe" class="form-control">
            </select>
        </div>*}
        <div class="form-group col-md-6">
            <label for="fe">Fecha de Boleta</label>
            <input type="text" name="fe" id="fe" class="form-control i-calendar" required />
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