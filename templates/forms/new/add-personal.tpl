<form id="addPersonalForm" name="addPersonalForm" method="post">
    <input type="hidden" id="type" name="type" value="saveAddPersonal"/>
    <input type="hidden" id="list_roles" name="list_roles" value="" />
    <div class="row">
        <div class="form-group col-md-6">
            <label for="prof">Profesion:</label>
            <select class="form-control" id="prof" name="prof">
                <option></option>
                {foreach from=$lstPd item=item key=key}
                <option>{$item.abreviacion}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="positionId">Puesto:</label>
            <select name="positionId" id="positionId" class="form-control" placeholder="Seleccione">
                <option value="">Seleccione</option>
                {include file="{$DOC_ROOT}/templates/lists/enum-position.tpl"}
            </select>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-4">
            <label for="name">Nombre:</label>
            <input type="text" name="name" id="name" class="form-control" placeholder="Nombre" />
        </div>
        <div class="form-group col-md-4">
            <label for="lastname_paterno">Apellido Paterno:</label>
            <input type="text" name="lastname_paterno" id="lastname_paterno" class="form-control" placeholder="Apellido Paterno" />
        </div>
        <div class="form-group col-md-4">
            <label for="lastname_materno">Apellido Materno:</label>
            <input type="text" name="lastname_materno" id="lastname_materno" class="form-control" placeholder="Apellido Materno" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-4">
            <label for="stateId">Estado:</label>
            <select name="stateId" id="stateId" class="form-control" placeholder="Seleccione">
                <option value="">Seleccione</option>
                {include file="{$DOC_ROOT}/templates/lists/enum-state.tpl"}
            </select>
        </div>
        <div class="form-group col-md-4">
            <label for="sexo">Sexo:</label>
            <select name="sexo" id="sexo" class="form-control" placeholder="Seleccione">
                <option value="">Seleccione</option>
                {include file="{$DOC_ROOT}/templates/lists/enum-sexo.tpl"}
            </select>
        </div>
        <div class="form-group col-md-4">
            <label for="fecha_nacimiento">Fecha de Nacimiento:</label>
            <input type="text" name="fecha_nacimiento" id="fecha_nacimiento" value="" maxlength="10" class="form-control i-calendar" placeholder="dd-mm-AAAA" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-4">
            <label for="curp">CURP:</label>
            <input type="text" name="curp" id="curp" class="form-control" placeholder="CURP" />
        </div>
        <div class="form-group col-md-4">
            <label for="rfc">RFC:</label>
            <input type="text" name="rfc" id="rfc" class="form-control" placeholder="RFC" />
        </div>
        <div class="form-group col-md-4">
            <label for="perfil">Perfil:</label>
            <input type="text" name="perfil" id="perfil" class="form-control" placeholder="Perfil" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="username">Usuario:</label>
            <input type="text" name="username" id="username" class="form-control" placeholder="Usuario" />
        </div>
        <div class="form-group col-md-6">
            <label for="passwd">Contraseña:</label>
            <input type="password" name="passwd" id="passwd" class="form-control" placeholder="Contraseña" autocomplete="new-password" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="description">Descripción:</label>
            <textarea name="description" id="description" cols="50" rows="12" class="form-control" ></textarea>
        </div>
        <div class="form-group col-md-6">
            <label for="role_from">Default</label>
            <select multiple="multiple" class="multi-select" id="role_from" name="role_from[]">
                {foreach from=$roles item=item key=key}
                    <option {if $item.selected} selected="selected" {/if} value="{$item.roleId}">{$item.name}</option>
                {/foreach}
            </select>
        </div>
    </div>
	<div class="row">
        <div class="form-group col-md-6">
            <label for="mostrarP">Mostrar personal:</label>
            <input type="checkbox" name="mostrarP" id="mostrarP"  class="form-control" >
        </div>
        <div class="form-group col-md-6">
            <label for="numeroP">Número:</label>
            <input type="text" name="numeroP" id="numeroP"  class="form-control" >
        </div>
    </div>
    <div class="form-group text-center">
        <button type="button" class="btn btn-success submitForm">Guardar</button>
        <button type="button" class="btn btn-danger closeModal">Cancelar</button>
    </div>
</form>

<script>
    $(function() {
        $('#role_from').multiSelect();
        var editor = new Jodit('#description', {
            language: "es",
            toolbarButtonSize: "small",
            autofocus: true,
            toolbarAdaptive: false
        });
        $('.modal').removeAttr('tabindex');

        flatpickr('.i-calendar', {
            dateFormat: "d-m-Y"
        });
    });
</script>