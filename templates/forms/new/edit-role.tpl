<form class="form-horizontal" id="editRoleForm" name="editRoleForm" method="post">
    <input type="hidden" id="type" name="type" value="saveEditRole"/>
    <input type="hidden" id="id" name="id" value="{$info.roleId}" />
    <input type="hidden" id="list_modules" name="list_modules" value="" />

    <div class="form-body">
        <div class="form-group">
            <label class="col-md-3 control-label">Clave:</label>
            <div class="col-md-8">
                <input type="text" name="clave" id="clave" class="form-control" placeholder="Clave" value="{$info.clave}" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Nombre:</label>
            <div class="col-md-8">
                <input type="text" name="name" id="name" class="form-control" placeholder="Nombre"  value="{$info.name}" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Descripción:</label>
            <div class="col-md-8">
                <textarea name="description" id="description" cols="50" rows="6" class="form-control" >{$info.description}</textarea>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-8">
                <table width="92%" cellpadding="0" cellspacing="0" border="0">
                    <tr><td colspan="4" height="10"></td></tr>
                    <tr>
                        <td width="300">Módulos de Acceso:</td>
                        <td align="center">
                            <select class="textfield" style="width:160px;height:80px;" name="module_from" size="6" multiple >
                                {foreach from=$modules item=item key=key}
                                    <option value="{$item.moduleId}">{$item.name}</option>
                                {/foreach}
                            </select>
                        </td>
                        <td align="center" width="20">
                            <div style="width:60px;">
                                <input type="button" width="60px"  style="width:60px;" class="button" onclick="javascript:MoveModule(document.editRoleForm.module_from,document.editRoleForm.module_to)" value="&gt;&gt;">
                                <br />
                                <input type="button" width="60px"  style="width:60px;" class="button" onclick="javascript:MoveModule(document.editRoleForm.module_to,document.editRoleForm.module_from)" value="&lt;&lt;">
                            </div>
                        </td>
                        <td align="center">
                            <select class="textfield" style="width:160px;height:80px;" name="module_to" size="6" multiple >
                                {foreach from=$roleModules item=item key=key}
                                    <option value="{$item.moduleId}">{$item.name}</option>
                                {/foreach}
                            </select>
                        </td>
                    </tr>
                    <tr><td colspan="4" height="10"></td></tr>
                </table>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
                <button type="button" class="btn green submitForm">Guardar</button>
                <button type="button" class="btn default closeModal">Cancelar</button>
            </div>
        </div>
    </div>

</form>