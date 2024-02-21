<form id="form_student" action="{$WEB_ROOT}/ajax/new/student.php" method="POST" class="form">
    <input type="hidden" name="opcion" value="registro-cobach" />
    <span class="badge badge-dark"><i class="fas fa-user"></i> Información Personal</span>
    <hr />
    <div class="row">
        <div class="form-group col-md-4">
            <label for="name">Nombre:</label>
            <input type="text" name="name" id="name" class="form-control" />
            <span class="invalid-feedback"></span>
        </div>
        <div class="form-group col-md-4">
            <label for="firstSurname">Apellido Paterno:</label>
            <input type="text" name="firstSurname" id="firstSurname" value="" class="form-control" />
            <span class="invalid-feedback"></span>
        </div>
        <div class="form-group col-md-4">
            <label for="secondSurname">Apellido Materno:</label>
            <input type="text" name="secondSurname" id="secondSurname" class="form-control" />
            <span class="invalid-feedback"></span>
        </div>
        <div class="form-group col-md-4">
            <label for="email">Correo Electrónico:</label>
            <input type="email" name="email" id="email" class="form-control" />
            <span class="invalid-feedback"></span>
        </div>
        <div class="form-group col-md-4">
            <label for="phone">Celular:</label>
            <input type="text" name="phone" id="phone" class="form-control" />
            <span class="invalid-feedback"></span>
        </div>
        <div class="form-group col-md-4">
            <label for="password">Contraseña del Sistema (Mínimo 6 caracteres):</label>
            <input type="password" name="password" id="password" class="form-control" autocomplete="new-password" />
            <span class="invalid-feedback"></span>
        </div>
    </div>
    <span class="badge badge-dark"><i class="fas fa-user"></i> Información Laboral y Académica</span>
    <hr />
    <div class="row">
        <div class="form-group col-md-4">
            <label for="ciudad"> Ciudad:</label>
            <select id="ciudad" name="ciudad" class="form-control">
                <option value="0">Selecciona tu Ciudad</option>
                {foreach from=$ciudades item=item}
                    <option value="{$item.municipioId}">{$item.nombre}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-4">
            <label for="workplacePosition">Puesto:</label>
            <input type="text" name="workplacePosition" id="workplacePosition" class="form-control" />
        </div>
        <div class="form-group col-md-4">
            <label for="schoolNumber">Número de Plantel:</label>
            <input type="number" name="schoolNumber" id="schoolNumber" class="form-control" />
        </div>
        <div class="form-group col-md-4">
            <label for="academicDegree">Grado Académico:</label>
            <select name="academicDegree" id="academicDegree" class="form-control">
                <option value="UNIVERSITARIO" {if $info.academicDegree == "UNIVERSITARIO"} selected="selected" {/if}>
                    UNIVERSITARIO</option>
                <option value="LICENCIATURA" {if $info.academicDegree == "LICENCIATURA"} selected="selected" {/if}>
                    LICENCIATURA</option>
                <option value="MAESTRIA" {if $info.academicDegree == "MAESTRIA"} selected="selected" {/if}>MAESTRIA
                </option>
                <option value="DOCTORADO" {if $info.academicDegree == "DOCTORADO"} selected="selected" {/if}>DOCTORADO
                </option>
                <option value="OTROS" {if $info.academicDegree == "OTROS"} selected="selected" {/if}>OTROS</option>
            </select>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 text-center">
            <button class="btn btn-success" type="submit">Guardar</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <a href="https://iapchiapas.edu.mx/aviso_privacidad" target="_blank" title="Aviso de Privacidad">
                Aviso de Privacidad
            </a>
        </div>
    </div>
</form>
<script>
    flatpickr('.i-calendar', {
        dateFormat: "Y-m-d"
    });
</script>