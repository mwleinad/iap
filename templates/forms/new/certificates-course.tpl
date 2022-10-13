<form action="{$WEB_ROOT}/ajax/certificado-calificaciones.php" method="POST" target="_blank">
    <input type="hidden" id="course" name="course" value="{$info.courseId}" />

    <div class="row">
        <div class="form-group col-md-6">
            <label for="student">Selecciona Alumno</label>
            <select name="student" id="student" class="form-control">
                <option value="0">-- Todos los Alumnos --</option>
                {foreach from=$students item=item}
                    <option value="{$item.userId}" class="text-capitalize">
                        {$item.lastNamePaterno|upper} {$item.lastNameMaterno|upper} {$item.names|upper}
                    </option>
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="date">Fecha de Boleta</label>
            <input type="text" name="date" id="date" class="form-control i-calendar" autocomplete="off" required />
        </div>
    </div>

    <div class="row d-flex justify-content-center">
        <div class="form-group col-md-6">
            <label for="folio">Folio</label>
            <input type="text" name="folio" id="folio" class="form-control" required />
        </div>
        <div class="form-group col-md-6">
            <label for="period">Periodo</label>
            <input type="text" name="period" id="period" class="form-control" required />
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h4>Datos del Rector(a)</h4>
        </div>
    </div>
    <div class="row d-flex justify-content-center">
        <div class="form-group col-md-8">
            <label for="rName">Nombre</label>
            <input type="text" name="rName" id="rName" class="form-control" required />
        </div>
        <div class="form-group col-md-4">
            <label for="rGender">Género</label>
            <select id="rGender" name="rGener" class="form-control">
                <option value="M">Masculino</option>
                <option value="F">Femenino</option>
            </select>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h4>Datos del Secretario(a) Académico</h4>
        </div>
    </div>
    <div class="row d-flex justify-content-center">
        <div class="form-group col-md-8">
            <label for="saName">Nombre</label>
            <input type="text" name="saName" id="saName" class="form-control" required />
        </div>
        <div class="form-group col-md-4">
            <label for="saGender">Género</label>
            <select id="saGender" name="saGener" class="form-control">
                <option value="M">Masculino</option>
                <option value="F">Femenino</option>
            </select>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h4>Datos del Jefe(a) del Departamento de Servicios Escolares</h4>
        </div>
    </div>
    <div class="row d-flex justify-content-center">
        <div class="form-group col-md-8">
            <label for="jdseName">Nombre</label>
            <input type="text" name="jdseName" id="jdseName" class="form-control" required />
        </div>
        <div class="form-group col-md-4">
            <label for="jdseGender">Género</label>
            <select id="jdseGender" name="jdseGener" class="form-control">
                <option value="M">Masculino</option>
                <option value="F">Femenino</option>
            </select>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h4>Datos del Director(a) de Educación Superior</h4>
        </div>
    </div>
    <div class="row d-flex justify-content-center">
        <div class="form-group col-md-8">
            <label for="desName">Nombre</label>
            <input type="text" name="desName" id="desName" class="form-control" required />
        </div>
        <div class="form-group col-md-4">
            <label for="desGender">Género</label>
            <select id="desGender" name="desGener" class="form-control">
                <option value="M">Masculino</option>
                <option value="F">Femenino</option>
            </select>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h4>Datos del Coordinador(a) de Asuntos Jurídicos de Gobierno</h4>
        </div>
    </div>
    <div class="row d-flex justify-content-center">
        <div class="form-group col-md-8">
            <label for="cajgName">Nombre</label>
            <input type="text" name="cajgName" id="cajgName" class="form-control" required />
        </div>
        <div class="form-group col-md-4">
            <label for="cajgGender">Género</label>
            <select id="cajgGender" name="cajgGener" class="form-control">
                <option value="M">Masculino</option>
                <option value="F">Femenino</option>
            </select>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h4>Datos de la Persona que Cotejó</h4>
        </div>
    </div>
    <div class="row d-flex justify-content-center">
        <div class="form-group col-md-12">
            <label for="cName">Nombre</label>
            <input type="text" name="cName" id="cName" class="form-control" required />
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h4>Datos del Jefe(a) de la Oficina</h4>
        </div>
    </div>
    <div class="row d-flex justify-content-center">
        <div class="form-group col-md-8">
            <label for="joName">Nombre</label>
            <input type="text" name="joName" id="joName" class="form-control" required />
        </div>
        <div class="form-group col-md-4">
            <label for="joGender">Género</label>
            <select id="joGender" name="joGener" class="form-control">
                <option value="M">Masculino</option>
                <option value="F">Femenino</option>
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