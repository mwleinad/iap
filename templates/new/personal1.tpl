<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Personal
        </div>
        <div class="actions">
            <a href="javascript:;" class="btn green" id="btnAddPersonal">
                <i class="fa fa-plus"></i> Agregar
            </a>
        </div>
    </div>
    <div class="portlet-body">
		<form id="frmBuscar" >
		<div style="display:-webkit-inline-box">
		<input type="hidden" name="type" value="buscarPersonal">
		Rol:<select name="role" class="form-control" style="width:200px">
			<option></option>
			{foreach from=$lstRol item=item}
			<option value="{$item.roleId}">{$item.name}</option>
			{/foreach}
			
		</select>
		Nombre:<input type="text" name="nombre" class="form-control" style="width:200px">
        </form>
		</div>
		<button type="button" class="btn green submitForm" onclick="buscarPersonal()">Buscar</button>
		<div id="tblContent">{include file="lists/personal.tpl"}</div>
    </div>
</div>