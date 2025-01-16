<form id="formUpdate" method="post" class="form" action="{$WEB_ROOT}/ajax/new/student.php">
    <input type="hidden" name="opcion" value="updateStudentRegister" />
    <input type="hidden" id="id" name="id" value="{$dataStudent.userId}" />
    <span class="badge badge-dark"><i class="fas fa-user"></i> Información Personal</span>
    <hr />
    <div class="row">
        <div class="form-group col-md-6">
            <label for="names">Nombre:</label>
            <input type="text" name="names" id="names" class="form-control" value="{$dataStudent.names}" />
        </div>
        <div class="form-group col-md-6">
            <label for="lastNamePaterno">Apellido Paterno:</label>
            <input type="text" name="lastNamePaterno" id="lastNamePaterno" class="form-control"
                value="{$dataStudent.lastNamePaterno}" />
        </div>
        <div class="form-group col-md-6">
            <label for="lastNameMaterno">Apellido Materno:</label>
            <input type="text" name="lastNameMaterno" id="lastNameMaterno" class="form-control"
                value="{$dataStudent.lastNameMaterno}" />
        </div>
        <div class="form-group col-md-6">
            <label for="sexo">Sexo:</label>
            <select name="sexo" id="sexo" class="form-control">
                <option value="m" {if $dataStudent.sexo == "m"}selected{/if}>Masculino</option>
                <option value="f" {if $dataStudent.sexo == "f"}selected{/if}>Femenino</option>
            </select>
        </div>
        <div class="form-group col-md-6">
            {* day-month-year *}
            <label for="birthday">Fecha de Nacimiento:</label>
            <input type="text" id="birthday" name="birthday" class="form-control i-calendar"
                value="{$dataStudent.yearBirthdate}-{$dataStudent.monthBirthdate}-{$dataStudent.dayBirthdate}" />
        </div>
        <div class="form-group col-md-6">
            <label for="maritalStatus">Estado Civil:</label>
            {include file="{$DOC_ROOT}/templates/forms/maritalStatus.tpl" selected=$dataStudent.maritalStatus}
        </div>
        <div class="form-group col-md-6">
            <label for="habilidades">Principales habilidades o habilidades</label>
            <textarea class="form-control" id="habilidades" rows="6" name="habilidades">{$dataStudent.habilidades}</textarea>
        </div>
        <div class="form-group col-md-6">
            <label for="aspiraciones">Principales aspiraciones y proyectos de vida</label>
            <textarea class="form-control" id="aspiraciones" rows="6" name="aspiraciones">{$dataStudent.aspiraciones}</textarea>
        </div>
        <div class="form-group col-md-6">
            <label for="aficiones">Aficiones, gustos o pasatiempos</label>
            <textarea class="form-control" id="aficiones" rows="6" name="aficiones">{$dataStudent.aficiones}</textarea>
        </div>
    </div>

    <span class="badge badge-dark"><i class="fas fa-map-marked-alt"></i> Domicilio</span>
    <hr />
    <div class="row">
        <div class="form-group col-md-4">
            <label for="street">Calle:</label>
            <input type="text" name="street" id="street" class="form-control" value="{$dataStudent.street}" />
        </div>
        <div class="form-group col-md-4">
            <label for="number">Número:</label>
            <input type="text" name="number" id="number" class="form-control" value="{$dataStudent.number}" />
        </div>
        <div class="form-group col-md-4">
            <label for="colony">Colonia:</label>
            <input type="text" name="colony" id="colony" class="form-control" value="{$dataStudent.colony}" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-3">
            <label for="estado">Estado:</label>
            <div id="Stateposition">
                <select id="estado" name="estado" onChange="ciudad_dependencia();" class="form-control">
                    <option value="0">Selecciona Tu Estado</option>
                    {foreach from=$estados item=estado}
                        {if $estado.estadoId == $dataStudent.estado}
                            <option selected="selected" value="{$estado.estadoId}">{$estado.nombre} </option>
                        {else}
                            <option value="{$estado.estadoId}">{$estado.nombre} </option>
                        {/if}
                    {/foreach}
                </select>
            </div>
        </div>
        <div class="form-group col-md-3">
            <label for="ciudad">Municipio:</label>
            <div id="Cityposition">
                <select id="ciudad" name="ciudad" class="form-control">
                    <option value="0">Selecciona Tu ciudad</option>
                    {foreach from=$ciudades item=ciudad}
                        {if $ciudad.municipioId == $dataStudent.ciudad}
                            <option selected="selected" value="{$ciudad.municipioId}">{$ciudad.nombre} </option>
                        {else}
                            <option value="{$ciudad.municipioId}">{$ciudad.nombre} </option>
                        {/if}
                    {/foreach}
                </select>
            </div>
        </div>
        <div class="form-group col-md-3">
            <label for="postalCode">Código Postal:</label>
            <input type="text" name="postalCode" id="postalCode" class="form-control"
                value="{$dataStudent.postalCode}" />
        </div>
    </div>

    <span class="badge badge-dark"><i class="fas fa-address-book"></i> Datos de Contacto</span>
    <hr />
    <div class="row">
        <div class="form-group col-md-6">
            <label for="email">Correo Electrónico:</label>
            <input type="text" name="email" id="email" class="form-control" value="{$dataStudent.email}" />
        </div>
        <div class="form-group col-md-6">
            <label for="mobile">Celular:</label>
            <input type="text" name="mobile" id="mobile" class="form-control" value="{$dataStudent.mobile}" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="phone">Teléfono Local:</label>
            <input type="text" name="phone" id="phone" class="form-control" value="{$dataStudent.phone}" />
        </div>
        <div class="form-group col-md-6">
            <label for="fax">Teléfono Alternativo:</label>
            <input type="text" name="fax" id="fax" class="form-control" value="{$dataStudent.fax}" />
        </div>
    </div>

    <span class="badge badge-dark"><i class="fas fa-briefcase"></i> Datos Laborales</span>
    <hr />
    <div class="row">
        <div class="form-group col-md-6">
            <label for="workplaceOcupation">Ocupación</label>
            <select name="workplaceOcupation" id="workplaceOcupation" class="form-control">
                <option value="FUNCIONARIO PUBLICO MUNICIPAL"
                    {if $dataStudent.workplaceOcupation == "FUNCIONARIO PUBLICO MUNICIPAL"} selected="selected" {/if}>
                    FUNCIONARIO PUBLICO MUNICIPAL</option>
                <option value="FUNCIONARIO PUBLICO ESTATAL"
                    {if $dataStudent.workplaceOcupation == "FUNCIONARIO PUBLICO ESTATAL"} selected="selected" {/if}>
                    FUNCIONARIO PUBLICO ESTATAL</option>
                <option value="FUNCIONARIO PUBLICO FEDERAL"
                    {if $dataStudent.workplaceOcupation == "FUNCIONARIO PUBLICO FEDERAL"} selected="selected" {/if}>
                    FUNCIONARIO PUBLICO FEDERAL</option>
                <option value="OTROS" {if $dataStudent.workplaceOcupation == "OTROS"} selected="selected" {/if}>OTROS
                </option>
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="workplace">Lugar de trabajo:</label>
            <input type="text" name="workplace" id="workplace" class="form-control" value="{$dataStudent.workplace}" />
        </div>
        <div class="form-group col-md-6">
            <label for="workplaceAddress">Domicilio de Trabajo:</label>
            <input type="text" name="workplaceAddress" id="workplaceAddress" class="form-control"
                value="{$dataStudent.workplaceAddress}" />
        </div>

        <div class="form-group col-md-6">
            <label for="estadot">Estado:</label>
            <div id="Statepositiont">
                <select id="estadot" name="estadot" onChange="ciudad_dependenciat();" class="form-control">
                    <option value="0">Selecciona Tu Estado</option>
                    {foreach from=$estadost item=estado}
                        {if $estado.estadoId == $dataStudent.estadot}
                            <option selected="selected" value="{$estado.estadoId}">{$estado.nombre} </option>
                        {else}
                            <option value="{$estado.estadoId}">{$estado.nombre} </option>
                        {/if}
                    {/foreach}
                </select>
            </div>
        </div>
        <div class="form-group col-md-6">
            <label for="ciudadt">Municipio</label>
            <div id="Citypositiont">
                <select id="ciudadt" name="ciudadt" class="form-control">
                    <option value="0">Selecciona Tu ciudad</option>
                    {foreach from=$ciudadest item=ciudad}
                        {if $ciudad.municipioId == $dataStudent.ciudadt}
                            <option selected="selected" value="{$ciudad.municipioId}">{$ciudad.nombre} </option>
                        {else}
                            <option value="{$ciudad.municipioId}">{$ciudad.nombre} </option>
                        {/if}
                    {/foreach}
                </select>
            </div>
        </div>
        <div class="form-group col-md-6">
            <label for="workplaceArea">Area:</label>
            <input type="text" name="workplaceArea" id="workplaceArea" class="form-control"
                value="{$dataStudent.workplaceArea}" />
        </div>
        <div class="form-group col-md-6">
            <label for="workplacePosition">Puesto:</label>
            <input type="text" name="workplacePosition" id="workplacePosition" class="form-control"
                value="{$dataStudent.workplacePosition}" />
        </div>
        <div class="form-group col-md-12">
            <label for="actividades">Actividades que desempeña</label>
            <textarea name="actividades" id="actividades" class="form-control"
                rows="6">{$dataStudent.actividades}</textarea>
        </div>
        <div class="form-group col-md-6">
            <label for="workplacePhone">Teléfono de Oficina:</label>
            <input type="text" name="workplacePhone" id="workplacePhone" class="form-control"
                value="{$dataStudent.workplacePhone}" />
        </div>
        <div class="form-group col-md-6">
            <label for="workplaceEmail">Correo Institucional:</label>
            <input type="text" name="workplaceEmail" id="workplaceEmail" class="form-control"
                value="{$dataStudent.workplaceEmail}" />
        </div>
    </div>

    <span class="badge badge-dark"><i class="fas fa-graduation-cap"></i> Estudios</span>
    <hr />
    <div class="row">
        <div class="form-group col-md-6">
            <label for="academicDegree">Grado Académico:</label>
            <select name="academicDegree" id="academicDegree" class="form-control">
                <option value="UNIVERSITARIO" {if $dataStudent.academicDegree == "UNIVERSITARIO"} selected="selected"
                    {/if}>UNIVERSITARIO</option>
                <option value="LICENCIATURA" {if $dataStudent.academicDegree == "LICENCIATURA"} selected="selected"
                    {/if}>LICENCIATURA</option>
                <option value="MAESTRIA" {if $dataStudent.academicDegree == "MAESTRIA"} selected="selected" {/if}>
                    MAESTRIA</option>
                <option value="DOCTORADO" {if $dataStudent.academicDegree == "DOCTORADO"} selected="selected" {/if}>
                    DOCTORADO</option>
                <option value="OTROS" {if $dataStudent.academicDegree == "OTROS"} selected="selected" {/if}>OTROS
                </option>
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="profesion">Profesión:</label>
            <select name="profesion" id="profesion" class="form-control">
                {foreach from=$prof item=item}
                    <option value="{$item.profesionId}" {if $dataStudent.profesion == $item.profesionId} selected="selected"
                        {/if}>{$item.profesionName}</option>
                {/foreach}
            </select>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="school">Escuela o Institución Universitaria:</label>
            <input type="text" name="school" id="school" class="form-control" value="{$dataStudent.school}" />
        </div>
        <div class="form-group col-md-6">
            <label for="masters">Maestría en:</label>
            <input type="text" name="masters" id="masters" class="form-control" value="{$dataStudent.masters}" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="mastersSchool">Escuela o Institución Maestría:</label>
            <input type="text" name="mastersSchool" id="mastersSchool" class="form-control"
                value="{$dataStudent.mastersSchool}" />
        </div>
        <div class="form-group col-md-6">
            <label for="highSchool">Escuela o Institución Bachillerato:</label>
            <input type="text" name="highSchool" id="highSchool" class="form-control"
                value="{$dataStudent.highSchool}" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label>¿Has recibido algún reconocimiento o distinción?</label>
            <select class="form-control" id="reconocimiento" name="reconocimiento">
                <option value="1">Sí</option>
                <option value="0">No</option>
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="tipoReconocimiento">¿De qué tipo?</label>
            <input type="text" name="tipoReconocimiento" id="tipoReconocimiento" class="form-control"
                placeholder="Curso, Taller, Diplomado, etc." value="{$dataStudent.tipoReconocimiento}" />
        </div>
        <div class="form-group col-md-6">
            <label for="institutoReconocimiento">Instituto que lo emitió</label>
            <input type="text" name="institutoReconocimiento" id="institutoReconocimiento" class="form-control"
                placeholder="Ubicación del instituto..." value="{$dataStudent.institutoReconocimiento}" />
        </div>
        <div class="form-group col-md-6">
            <label for="lugarReconocimiento">Lugar donde fue emitido</label>
            <input type="text" name="lugarReconocimiento" id="lugarReconocimiento" class="form-control"
                placeholder="Nombre del instituto..." value="{$dataStudent.lugarReconocimiento}" />
        </div>
        <div class="form-group col-md-12">
            <label>¿Cuáles son tus expectativas del programa y qué esperas obtener o aportar?</label>
            <textarea name="expectativas" id="expectativas" class="form-control" rows="6">{$dataStudent.expectativas}</textarea>
        </div>
        <div class="form-group col-md-12">
            <label>¿Algo más que desees compartir?</label>
            <textarea name="comentarios" id="comentarios" class="form-control" rows="8">{$dataStudent.comentarios}</textarea>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-6 mx-auto">
            <button type="submit" class="btn btn-success btn-block">
                Guardar
            </button>
        </div>
    </div>
</form>

<script>
    flatpickr('.i-calendar', {
        dateFormat: "Y-m-d"
    });
</script>