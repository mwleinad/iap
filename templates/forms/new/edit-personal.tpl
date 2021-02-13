

<form id="editPersonalForm" name="editPersonalForm" method="post" action="{$WEB_ROOT}/personal1" enctype="multipart/form-data">
    <input type="hidden" id="type" name="type" value="saveEditPersonal"/>
    <input type="hidden" id="id" name="id" value="{$info.personalId}" />
    <input type="hidden" id="list_roles" name="list_roles" value="" />
    <div class="row">
        <div class="form-group col-md-6">
            <label for="prof">Profesion:</label>
            <select class="form-control" id="prof" name="prof">
                <option></option>
                {foreach from=$lstPd item=item key=key}
                <option {if $item.abreviacion eq $info.profesion} selected {/if} >{$item.abreviacion}</option>
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
            <input type="text" name="name" id="name" class="form-control" placeholder="Nombre" value="{$info.name}"  />
        </div>
        <div class="form-group col-md-4">
            <label for="lastname_paterno">Apellido Paterno:</label>
            <input type="text" name="lastname_paterno" id="lastname_paterno" class="form-control" placeholder="Apellido Paterno" value="{$info.lastname_paterno}" />
        </div>
        <div class="form-group col-md-4">
            <label for="lastname_materno">Apellido Materno:</label>
            <input type="text" name="lastname_materno" id="lastname_materno" class="form-control" placeholder="Apellido Materno" value="{$info.lastname_materno}"/>
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
            <input type="text" name="fecha_nacimiento" id="fecha_nacimiento" value="{$info.fecha_nacimiento}" maxlength="10" class="form-control" placeholder="dd-mm-AAAA" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-4">
            <label for="curp">CURP:</label>
            <input type="text" name="curp" id="curp" class="form-control" placeholder="CURP" value="{$info.curp}"/>
        </div>
        <div class="form-group col-md-4">
            <label for="rfc">RFC:</label>
            <input type="text" name="rfc" id="rfc" class="form-control" placeholder="RFC" value="{$info.rfc}"/>
        </div>
        <div class="form-group col-md-4">
            <label for="perfil">Perfil:</label>
            <input type="text" name="perfil" id="perfil" class="form-control" placeholder="Perfil" value="{$info.perfil}" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="username">Usuario:</label>
            <input type="text" name="username" id="username" class="form-control" placeholder="Usuario" value="{$info.username}"/>
        </div>
        <div class="form-group col-md-6">
            <label for="passwd">Contraseña:</label>
            <input type="password" name="passwd" id="passwd" class="form-control" placeholder="Contraseña" value="{$info.passwd}"  />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="description">Descripción:</label>
            <textarea name="description" id="description" class="form-control" >{$info.description}</textarea>
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
            <input type="checkbox" name="mostrarP" id="mostrarP" {if $info.mostrar eq 'si'} checked {/if}  class="form-control" >
        </div>
        <div class="form-group col-md-6">
            <label for="numeroP">Número:</label>
            <input type="text" name="numeroP" id="numeroP"  class="form-control" value="{$info.numero}">
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-4">
            <label for="foto">Foto:</label>
            <input type="file" name="foto" id="foto" class="form-control" />
        </div>
        <div class="form-group col-md-4">
            <label for="correo">Correo:</label>
            <input type="text" name="correo" id="correo" class="form-control"  value="{$info.correo}" />
        </div>
        <div class="form-group col-md-4">
            <label for="celular">Celular:</label>
            <input type="text" name="celular" id="celular" class="form-control" value="{$info.celular}" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="firmaConstancia">Firma Constancia:</label>
            <select name="firmaConstancia" id="firmaConstancia" class="form-control" onChange="compruebaFirma()">
                <option ></option>
                <option {if $info.firmaConstancia eq 'si'} selected {/if}>si</option>
                <option {if $info.firmaConstancia eq 'no'} selected {/if}>no</option>
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="firma">Imagen de Firma:</label>
            <input type="file" name="firma" id="firma" class="form-control" />
            <img src="{$WEB_ROOT}/images/docente/firmas/{$info.rutaFirma}" style="max-width:99px" />
        </div>
    </div>
    <div class="form-group text-center">
		<div id='divMsj'></div>
        <input type="submit" class="btn btn-success" value="Guardar" id='btnEdit'/>
        <button type="button" class="btn btn-danger closeModal">Cancelar</button>
    </div>
</form>

<script>
    $( document ).ready(function() {
        $('#role_from').multiSelect();
        var editor = new Jodit('#description', {
            language: "es",
            toolbarButtonSize: "small",
            autofocus: true,
            toolbarAdaptive: false
        });
    });
</script>
