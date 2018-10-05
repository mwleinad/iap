<form class="form-horizontal" id="addPersonalForm" name="addPersonalForm" method="post">
    <input type="hidden" id="type" name="type" value="saveAddPersonal"/>
    <input type="hidden" id="personalId" name="personalId" value="{$info.personalId}"/>
    <input type="hidden" id="list_roles" name="list_roles" value="" />

    <div class="form-body">
		 <!--<div class="form-group">
            <label class="col-md-3 control-label">Profesion:</label>
            <div class="col-md-8">
                <select class="form-control">
						<option></option>
					 {foreach from=$lstPd item=item key=key}
						<option>{$item.abreviacion}</option>
					 {/foreach}
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Puesto:</label>
            <div class="col-md-8">
                <select name="positionId" id="positionId" style="width:250px" class="form-control" placeholder="Seleccione">
                    <option value="">Seleccione</option>
                    {include file="{$DOC_ROOT}/templates/lists/enum-position.tpl"}
                </select>
            </div>
        </div>-->
        <div class="form-group">
            <label class="col-md-3 control-label">Nombre:</label>
            <div class="col-md-8">
                <input type="text" name="name" id="name" class="form-control" placeholder="Nombre" value="{$info.name}"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Apellido Paterno:</label>
            <div class="col-md-8">
                <input type="text" name="lastname_paterno" id="lastname_paterno" class="form-control" value="{$info.lastname_paterno}" placeholder="Apellido Paterno" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Apellido Materno:</label>
            <div class="col-md-8">
                <input type="text" name="lastname_materno" id="lastname_materno" class="form-control" value="{$info.lastname_materno}" placeholder="Apellido Materno" />
            </div>
        </div>
		<div class="form-group">
            <label class="col-md-3 control-label">Correo:</label>
            <div class="col-md-8">
                <input type="text" name="correo" id="correo" class="form-control" placeholder="Correo" value="{$info.correo}"/>
            </div>
        </div>
		<!--
        <div class="form-group">
            <label class="col-md-3 control-label">Estado:</label>
            <div class="col-md-8">
                <select name="stateId" id="stateId" style="width:250px" class="form-control" placeholder="Seleccione">
                    <option value="">Seleccione</option>
                    {include file="{$DOC_ROOT}/templates/lists/enum-state.tpl"}
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Sexo:</label>
            <div class="col-md-8">
                <select name="sexo" id="sexo" class="form-control" placeholder="Seleccione">
                    <option value="">Seleccione</option>
                    {include file="{$DOC_ROOT}/templates/lists/enum-sexo.tpl"}
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Fecha de Nacimiento:</label>
            <div class="col-md-8">
                <input type="text" name="fecha_nacimiento" id="fecha_nacimiento" value="" maxlength="10" class="form-control" placeholder="dd-mm-AAAA" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">CURP:</label>
            <div class="col-md-8">
                <input type="text" name="curp" id="curp" class="form-control" placeholder="CURP" />

            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">RFC:</label>
            <div class="col-md-8">
                <input type="text" name="rfc" id="rfc" class="form-control" placeholder="RFC" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Perfil:</label>
            <div class="col-md-8">
                <input type="text" name="perfil" id="perfil" class="form-control" placeholder="Perfil" />
            </div>
        </div>
		-->
        <div class="form-group">
            <label class="col-md-3 control-label">Usuario:</label>
            <div class="col-md-8">
                <input type="text" name="username" id="username" class="form-control" placeholder="Usuario" value="{$info.username}"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Contraseña:</label>
            <div class="col-md-8">
                <input type="password" name="passwd" id="passwd" class="form-control" placeholder="Contraseña" value="{$info.passwd}"/>
            </div>
        </div>
		<!--
        <div class="form-group">
            <label class="col-md-3 control-label">Descripción:</label>
            <div class="col-md-8">
                <textarea name="description" id="description" cols="50" rows="6" class="form-control" ></textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-md-3">Default</label>
            <div class="col-md-9">
                <select multiple="multiple" class="multi-select" id="role_from" name="role_from[]">
                    {foreach from=$roles item=item key=key}
                        <option {if $item.selected} selected="selected" {/if} value="{$item.roleId}">{$item.name}</option>
                    {/foreach}
                </select>
            </div>
        </div>
		
		
		
		  <div class="form-group">
            <label class="col-md-3 control-label">Mostrar personal:</label>
            <div class="col-md-8" >
				<div style="float:left">
				
					<input type="checkbox" name="mostrarP" id="mostrarP"  class="form-control" >
					&nbsp;
					&nbsp;
					&nbsp;
				</div>
				
            </div>
        </div>
		
		 <div class="form-group">
            <label class="col-md-3 control-label">número:</label>
            <div class="col-md-8" >
				<div style="float:left">
					<input type="text" name="numeroP" id="numeroP"  class="form-control" >
				</div>
				
            </div>
        </div>-->
		<div class="form-group">
            <label class="col-md-3 control-label">Fotografia:</label>
            <div class="col-md-8" >
				<div style="float:left">
					<input type="file" name="foto" id="foto"  class="form-control" >
				</div>
				
            </div>
        </div>
    </div>
    

</form>
<div class="form-actions">
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
                <button type="button" class="btn green submitForm" onClick="savePersonal()">Guardar</button>
                <button type="button" class="btn default closeModal">Cancelar</button>
            </div>
        </div>
    </div>
<script>
    $( document ).ready(function() {
        $('#role_from').multiSelect();
    });
</script>