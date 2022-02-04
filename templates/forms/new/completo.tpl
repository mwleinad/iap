<form id="editStudentForm" name="editStudentForm" method="post">
    <input type="hidden" name="cancelPeriodoId" id="cancelPeriodoId" value="{$info.cancelPeriodoId}" />
    <input type="hidden" id="type" name="type" value="saveEditStudentAlumn"/>
    <input type="hidden" id="id" name="id" value="{$info.userId}"/>
    <input type="hidden" id="tam" name="tam" value="1"/>
    <input type="hidden" id="semestreId" name="semestreId" value="{$sId}"/>
    <input type="hidden" id="courseMxId" name="courseMxId" value="{$courseMId}"/>
    <input type="hidden" id="subjecxtId" name="subjecxtId" value="{$subjectId}"/>
	<input type="hidden" id="coursexId" name="coursexId" value="{$courseId}"/>
    <span class="badge badge-dark"><i class="fas fa-user"></i> Información Personal</span><hr />
    <div class="row">
        <div class="form-group col-md-4">
            <label for="names">Nombre:</label>
            <input type="text" name="names" id="names" class="form-control" value="{$info.names}" />
        </div>
        <div class="form-group col-md-4">
            <label for="lastNamePaterno">Apellido Paterno:</label>
            <input type="text" name="lastNamePaterno" id="lastNamePaterno" class="form-control" value="{$info.lastNamePaterno}" />
        </div>
        <div class="form-group col-md-4">
            <label for="lastNameMaterno">Apellido Materno:</label>
            <input type="text" name="lastNameMaterno" id="lastNameMaterno" class="form-control" value="{$info.lastNameMaterno}" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="sexo">Sexo:</label>
            <select name="sexo" id="sexo" class="form-control">
                <option value="m"  {if $info.sexo == "m"}selected{/if}>Masculino</option>
                <option value="f"  {if $info.sexo == "f"}selected{/if}>Femenino</option>
            </select>
        </div>
        <div class="form-group col-md-6">
            {* day-month-year *}
            <label for="birthday">Fecha de Nacimiento:</label>
            <input type="text" id="birthday" name="birthday" class="form-control i-calendar" value="{$info.yearBirthdate}-{$info.monthBirthdate}-{$info.dayBirthdate}" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="maritalStatus">Estado Civil:</label>
            {include file="{$DOC_ROOT}/templates/forms/maritalStatus.tpl" selected=$info.maritalStatus}
        </div>
        <div class="form-group col-md-6">
            <label for="password">Contraseña del Sistema (Minimo 6 caracteres):</label>
            <input type="password" name="password" id="password" class="form-control" value="{$info.password}" />
        </div>
    </div>

    <span class="badge badge-dark"><i class="fas fa-map-marked-alt"></i> Domicilio</span><hr />
    <div class="row">
        <div class="form-group col-md-4">
            <label for="street">Calle:</label>
            <input type="text" name="street" id="street" class="form-control" value="{$info.street}" />
        </div>
        <div class="form-group col-md-4">
            <label for="number">Número:</label>
            <input type="text" name="number" id="number" class="form-control" value="{$info.number}" />
        </div>
        <div class="form-group col-md-4">
            <label for="colony">Colonia:</label>
            <input type="text" name="colony" id="colony" class="form-control" value="{$info.colony}" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-3">
            <label for="pais">País:</label>
            <select id="pais" name="pais" onChange="estado_dependencia();" class="form-control" >
                <option value="0">Selecciona Tu Pa&iacute;s</option>
                {foreach from=$paises item=pais}
                    {if $pais.paisId == $info.pais}
                        <option selected="selected" value="{$pais.paisId}">{$pais.nombre} </option>
                    {else}
                        <option value="{$pais.paisId}">{$pais.nombre} </option>
                    {/if}
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-3">
            <label for="estado">Estado:</label>
            <div id="Stateposition">
                <select id="estado" name="estado" onChange="ciudad_dependencia();" class="form-control">
                    <option value="0">Selecciona Tu Estado</option>
                    {foreach from=$estados item=estado}
                        {if $estado.estadoId == $info.estado}
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
                <select id="ciudad" name="ciudad" class="form-control" >
                    <option value="0">Selecciona Tu ciudad</option>
                    {foreach from=$ciudades item=ciudad}
                        {if $ciudad.municipioId == $info.ciudad}
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
            <input type="text" name="postalCode" id="postalCode" class="form-control" value="{$info.postalCode}" />
        </div>
    </div>

    <span class="badge badge-dark"><i class="fas fa-address-book"></i> Datos de Contacto</span><hr />
    <div class="row">
        <div class="form-group col-md-4">
            <label for="email">Email:</label>
            <input type="text" name="email" id="email" class="form-control" value="{$info.email}" />
        </div>
        <div class="form-group col-md-4">
            <label for="mobile">Celular:</label>
            <input type="text" name="mobile" id="mobile" class="form-control" value="{$info.mobile}" />
        </div>
        <div class="form-group col-md-4">
            <label for="phone">Teléfono local</label>
            <input type="text" name="phone" id="phone" class="form-control" value="{$info.phone}" />
        </div>
    </div>

    <span class="badge badge-dark"><i class="fas fa-briefcase"></i> Datos laborales</span><hr />
    <div class="row">
        <div class="form-group col-md-4">
            <label for="workplaceOcupation">Ocupación</label>
            <select name="workplaceOcupation" id="workplaceOcupation" class="form-control">
                <option value="FUNCIONARIO PUBLICO MUNICIPAL" {if $info.workplaceOcupation == "FUNCIONARIO PUBLICO MUNICIPAL"} selected="selected" {/if}>FUNCIONARIO PUBLICO MUNICIPAL</option>
                <option value="FUNCIONARIO PUBLICO ESTATAL" {if $info.workplaceOcupation == "FUNCIONARIO PUBLICO ESTATAL"} selected="selected" {/if}>FUNCIONARIO PUBLICO ESTATAL</option>
                <option value="FUNCIONARIO PUBLICO FEDERAL" {if $info.workplaceOcupation == "FUNCIONARIO PUBLICO FEDERAL"} selected="selected" {/if}>FUNCIONARIO PUBLICO FEDERAL</option>
                <option value="OTROS" {if $info.workplaceOcupation == "OTROS"} selected="selected" {/if}>OTROS</option>
            </select>
        </div>
        <div class="form-group col-md-4">
            <label for="workplace">Lugar de trabajo:</label>
            <input type="text" name="workplace" id="workplace" class="form-control" value="{$info.workplace}" />
        </div>
        <div class="form-group col-md-4">
            <label for="workplaceAddress">Domicilio:</label>
            <input type="text" name="workplaceAddress" id="workplaceAddress" class="form-control" value="{$info.workplaceAddress}" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-4">
            <label for="paist">País</label>
            <select id="paist" name="paist" onChange="estado_dependenciat();" class="form-control">
                <option value="0">Selecciona Tu Pa&iacute;s</option>
                {foreach from=$paisest item=pais}
                    {if $pais.paisId == $info.paist}
                        <option selected="selected" value="{$pais.paisId}">{$pais.nombre} </option>
                    {else}
                        <option value="{$pais.paisId}">{$pais.nombre} </option>
                    {/if}
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-4">
            <label for="estadot" >Estado:</label>
            <div id="Statepositiont">
                <select id="estadot" name="estadot" onChange="ciudad_dependenciat();" class="form-control">
                    <option value="0">Selecciona Tu Estado</option>
                    {foreach from=$estadost item=estado}
                        {if $estado.estadoId == $info.estadot}
                            <option selected="selected" value="{$estado.estadoId}">{$estado.nombre} </option>
                        {else}
                            <option value="{$estado.estadoId}">{$estado.nombre} </option>
                        {/if}
                    {/foreach}
                </select>
            </div>
        </div>
        <div class="form-group col-md-4">
            <label for="ciudadt">Municipio</label>
            <div id="Citypositiont">
                <select id="ciudadt" name="ciudadt" class="form-control">
                    <option value="0">Selecciona Tu ciudad</option>
                    {foreach from=$ciudadest item=ciudad}
                        {if $ciudad.municipioId == $info.ciudadt}
                            <option selected="selected" value="{$ciudad.municipioId}">{$ciudad.nombre} </option>
                        {else}
                            <option value="{$ciudad.municipioId}">{$ciudad.nombre} </option>
                        {/if}
                    {/foreach}
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-4">
            <label for="workplaceArea">Area:</label>
            <input type="text" name="workplaceArea" id="workplaceArea" class="form-control" value="{$info.workplaceArea}" />
        </div>
        <div class="form-group col-md-4">
            <label for="workplacePhone">Teléfono de Oficina:</label>
            <input type="text" name="workplacePhone" id="workplacePhone" class="form-control" value="{$info.workplacePhone}" />
        </div>
        <div class="form-group col-md-4">
            <label for="workplaceEmail">Correo Oficial:</label>
            <input type="text" name="workplaceEmail" id="workplaceEmail" class="form-control" value="{$info.workplaceEmail}" />
        </div>
    </div>

    <span class="badge badge-dark"><i class="fas fa-graduation-cap"></i> Estudios</span><hr />
    <div class="row">
        <div class="form-group col-md-6">
            <label for="academicDegree">Grado Académico:</label>
            <select name="academicDegree" id="academicDegree" class="form-control">
                <option value="UNIVERSITARIO" {if $info.academicDegree == "UNIVERSITARIO"} selected="selected" {/if}>UNIVERSITARIO</option>
                <option value="LICENCIATURA" {if $info.academicDegree == "LICENCIATURA"} selected="selected" {/if}>LICENCIATURA</option>
                <option value="MAESTRIA" {if $info.academicDegree == "MAESTRIA"} selected="selected" {/if}>MAESTRIA</option>
                <option value="DOCTORADO" {if $info.academicDegree == "DOCTORADO"} selected="selected" {/if}>DOCTORADO</option>
                <option value="OTROS" {if $info.academicDegree == "OTROS"} selected="selected" {/if}>OTROS</option>
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="profesion">Profesión:</label>
            <select name="profesion" id="profesion" class="form-control">
                {foreach from=$prof item=item}
                    <option value="{$item.profesionId}" {if $info.profesion == $item.profesionId} selected="selected" {/if}>{$item.profesionName}</option>
                {/foreach}
            </select>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="school">Escuela o Institución  Universitaria:</label>
            <input type="text" name="school" id="school" class="form-control" value="{$info.school}" />
        </div>
        <div class="form-group col-md-6">
            <label for="masters">Maestría en:</label>
            <input type="text" name="masters" id="masters" class="form-control" value="{$info.masters}" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="mastersSchool">Escuela o Institución Maestría:</label>
            <input type="text" name="mastersSchool" id="mastersSchool" class="form-control" value="{$info.mastersSchool}" />
        </div>
        <div class="form-group col-md-6">
            <label for="highSchool">Escuela o Institución Bachillerato:</label>
            <input type="text" name="highSchool" id="highSchool" class="form-control" value="{$info.highSchool}" />
        </div>
    </div>
</form>
<div id="res_"></div>
<div class="form-group text-center">
    {if $alumnoSer eq "si"}
        <button type="button" onclick=" location.href='{$WEB_ROOT}/index' " class="btn btn-danger" data-dismiss="modal">Regresar</button>
    {else}
        <button type="button" class="btn btn-danger" data-dismiss="modal">Salir</button>
    {/if}
    <button type="submit" class="btn btn-success submitForm" onClick="saveEditStudentAlumn()">Guardar</button>
</div>

<script>
    flatpickr('.i-calendar', {
        dateFormat: "Y-m-d"
    });
</script>