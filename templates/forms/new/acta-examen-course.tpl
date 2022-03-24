<form action="{$WEB_ROOT}/ajax/acta-examen.php" method="POST" target="_blank">
    <input type="hidden" id="course" name="course" value="{$info.courseId}" />

    <div class="row">
        <div class="form-group col-md-6">
            <label for="student">Selecciona Alumno</label>
            <select name="student" id="student" class="form-control" required>
                <option value="0">-- Todos los Alumnos --</option>
                {foreach from=$students item=item}
                    <option value="{$item.userId}" class="text-capitalize">
                        {$item.lastNamePaterno|upper} {$item.lastNameMaterno|upper} {$item.names|upper}
                    </option>
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="fecha">Fecha</label>
            <input type="text" name="fecha" id="fecha" class="form-control i-calendar" required />
        </div>
    </div>

    <div id="additional" class="row"></div>

    <div class="row d-flex justify-content-center">
        <div class="form-group col-md-6">
            <label for="folio">Folio SEP</label>
            <input type="text" name="folio" id="folio" class="form-control" required />
        </div>
        <div class="form-group col-md-6">
            <label for="noActa">Número de Acta</label>
            <input type="text" name="noActa" id="noActa" class="form-control" required />
        </div>
    </div>

    <div class="row d-flex justify-content-center">
        <div class="form-group col-md-6">
            <label for="noAutorizacion">Número de Autorización</label>
            <input type="text" name="noAutorizacion" id="noAutorizacion" class="form-control" onkeyup="this.value = this.value.toUpperCase()" required />
        </div>
        <div class="form-group col-md-6">
            <label for="hora">Hora (En Letras)</label>
            <input type="text" name="hora" id="hora" class="form-control" onkeyup="this.value = this.value.toUpperCase()" required />
        </div>
    </div>

    <div class="row d-flex justify-content-center">
        <div class="form-group col-md-6">
            <label for="ubicacion">Ubicación</label>
            <input type="text" name="ubicacion" id="ubicacion" class="form-control" onkeyup="this.value = this.value.toUpperCase()" required />
        </div>
        <div class="form-group col-md-6">
            <label for="opcionExamen">Opción de Examen</label>
            <select name="opcionExamen" id="opcionExamen" class="form-control" required>
                <option value="Promedio">Promedio</option>
                <option value="Tesis">Tesis de Grado</option>
            </select>
        </div>
    </div>

    <div class="row d-flex justify-content-center">
        <div class="form-group col-md-12">
            <label for="tesis">Tesis de Grado (Ingrese el Nombre de la Tesis)</label>
            <input type="text" name="tesis" id="tesis" class="form-control" onkeyup="this.value = this.value.toUpperCase()" required />
        </div>
    </div>

    <div class="row d-flex justify-content-center">
        <div class="form-group col-md-6">
            <label for="nombrePresidente">Nombre del Presidente</label>
            <input type="text" name="nombrePresidente" id="nombrePresidente" class="form-control" onkeyup="this.value = this.value.toUpperCase()" required />
        </div>
        <div class="form-group col-md-6">
            <label for="cedulaPresidente">Cédula del Presidente</label>
            <input type="text" name="cedulaPresidente" id="cedulaPresidente" class="form-control" onkeyup="this.value = this.value.toUpperCase()" required />
        </div>
    </div>

    <div class="row d-flex justify-content-center">
        <div class="form-group col-md-6">
            <label for="nombreSecretario">Nombre del Secretario</label>
            <input type="text" name="nombreSecretario" id="nombreSecretario" class="form-control" onkeyup="this.value = this.value.toUpperCase()" required />
        </div>
        <div class="form-group col-md-6">
            <label for="cedulaSecretario">Cédula del Secretario</label>
            <input type="text" name="cedulaSecretario" id="cedulaSecretario" class="form-control" onkeyup="this.value = this.value.toUpperCase()" required />
        </div>
    </div>

    <div class="row d-flex justify-content-center">
        <div class="form-group col-md-6">
            <label for="nombreVocal">Nombre del Vocal</label>
            <input type="text" name="nombreVocal" id="nombreVocal" class="form-control" onkeyup="this.value = this.value.toUpperCase()" required />
        </div>
        <div class="form-group col-md-6">
            <label for="cedulaVocal">Cédula del Vocal</label>
            <input type="text" name="cedulaVocal" id="cedulaVocal" class="form-control" onkeyup="this.value = this.value.toUpperCase()" required />
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