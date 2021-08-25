<form action="{$WEB_ROOT}/ajax/certificado.php" method="GET" target="_blank">
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
            <label for="fe">Fecha de Certificado</label>
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