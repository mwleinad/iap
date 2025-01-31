<form class="form" id="form_register" method="POST" action="{$WEB_ROOT}/ajax/new/student.php">
    <input type="hidden" name="opcion" value="registro" />
    <span class="badge badge-dark"><i class="fas fa-user"></i> Información Personal</span>
    <hr />
    <div class="row">
        <div class="form-group col-md-4">
            <label for="names">Nombre:</label>
            <input type="text" name="names" id="names" class="form-control" />
        </div>
        <div class="form-group col-md-4">
            <label for="lastNamePaterno">Apellido Paterno:</label>
            <input type="text" name="lastNamePaterno" id="lastNamePaterno" value="" class="form-control" />
        </div>
        <div class="form-group col-md-4">
            <label for="lastNameMaterno">Apellido Materno:</label>
            <input type="text" name="lastNameMaterno" id="lastNameMaterno" class="form-control" />
        </div>
        <div class="form-group col-md-6">
            <label for="sexo">Sexo:</label>
            <select name="sexo" id="sexo" class="form-control">
                <option value="m">Masculino</option>
                <option value="f">Femenino</option>
            </select>
        </div>
    </div>
    <span class="badge badge-dark"><i class="fas fa-address-book"></i> Datos de Contacto</span>
    <hr />
    <div class="row">
        <div class="form-group col-md-6">
            <label for="email">Correo Electrónico:</label>
            <input type="text" name="email" id="email" class="form-control" />
        </div>
        <div class="form-group col-md-6">
            <label for="mobile">Celular:</label>
            <input type="text" name="mobile" id="mobile" class="form-control" />
        </div>
    </div>

    <span class="badge badge-dark"><i class="fas fa-briefcase"></i> Datos laborales</span>
    <hr />
    <div class="row">
        <div class="form-group col-md-4">
            <label for="workplaceOcupation">Ocupacion:</label>
            <select name="workplaceOcupation" id="workplaceOcupation" class="form-control">
                <option value="FUNCIONARIO PUBLICO MUNICIPAL"
                    {if $info.workplaceOcupation == "FUNCIONARIO PUBLICO MUNICIPAL"} selected="selected" {/if}>
                    FUNCIONARIO PUBLICO MUNICIPAL</option>
                <option value="FUNCIONARIO PUBLICO ESTATAL"
                    {if $info.workplaceOcupation == "FUNCIONARIO PUBLICO ESTATAL"} selected="selected" {/if}>FUNCIONARIO
                    PUBLICO ESTATAL</option>
                <option value="FUNCIONARIO PUBLICO FEDERAL"
                    {if $info.workplaceOcupation == "FUNCIONARIO PUBLICO FEDERAL"} selected="selected" {/if}>FUNCIONARIO
                    PUBLICO FEDERAL</option>
                <option value="OTROS" {if $info.workplaceOcupation == "OTROS"} selected="selected" {/if}>OTROS</option>
            </select>
        </div>
        <div class="form-group col-md-4">
            <label for="workplace">Lugar de Trabajo:</label>
            <input type="text" name="workplace" id="workplace" class="form-control" />
        </div>
        <div class="form-group col-md-4">
            <label for="workplacePosition">Puesto:</label>
            <input type="text" name="workplacePosition" id="workplacePosition" class="form-control" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-4">
            <label for="estadot">Estado:</label>
            <div id="Statepositiont">
                <select id="estadot" name="estadot" onChange="ciudad_dependenciat();" class="form-control">
                    <option value="0">Selecciona tu Estado</option>
                    {foreach from=$estados item=estado}
                        <option value="{$estado.estadoId}">{$estado.nombre}</option>
                    {/foreach}
                </select>
            </div>
        </div>
        <div class="form-group col-md-4">
            <label for="ciudadt"> Municipio:</label>
            <div id="Citypositiont">
                <select id="ciudadt" name="ciudadt" class="form-control">
                    <option value="0">Selecciona tu Ciudad</option>
                </select>
            </div>
        </div>
    </div>

    <span class="badge badge-dark"><i class="fas fa-graduation-cap"></i> Estudios</span>
    <hr />
    <div class="row">
        <div class="form-group col-md-6">
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
        <div class="form-group col-md-6">
            <label for="curricula">Programa al que se quiere inscribir</label>
            <select name="curricula" id="curricula" class="form-control">
                <option value="0">Selecciona un programa académico</option>
                {foreach from=$curriculas item=curricula}
                    <option value="{$curricula.subjectId}">{$curricula.majorName} {$curricula.name}</option>
                {/foreach}
            </select>
        </div>
    </div>
    <div class="form-group text-center">
        <button type="submit" class="btn btn-success">Guardar</button>
    </div>
</form>

<div class="row">
    <div class="col-md-12">
        <a href="https://iapchiapas.edu.mx/aviso_privacidad" target="_blank" title="Aviso de Privacidad">
            Aviso de Privacidad
        </a>
    </div>
</div>