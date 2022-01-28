<form action="{$WEB_ROOT}/ajax/certificado-calificaciones.php" method="GET" target="_blank">
    <input type="hidden" id="co" name="co" value="{$info.courseId}" />

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
            <label for="fe">Fecha de Boleta</label>
            <input type="text" name="fe" id="fe" class="form-control i-calendar" required />
        </div>
    </div>

    <div id="additional" class="row"></div>

    <div class="row d-flex justify-content-center">
        <div class="form-group col-md-6">
            <label for="fo">Folio</label>
            <input type="text" name="fo" id="fo" class="form-control" required />
        </div>
        <div class="form-group col-md-6">
            <label for="pe">Periodo</label>
            <input type="text" name="pe" id="pe" class="form-control" required />
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