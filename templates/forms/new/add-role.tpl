<form class="form-horizontal" id="addRoleForm" name="addRoleForm" method="post">
    <input type="hidden" id="type" name="type" value="saveAddRole"/>
    <input type="hidden" id="list_modules" name="list_modules" value="" />

    <div class="form-body">
        <div class="form-group">
            <label class="col-md-3 control-label">Clave:</label>
            <div class="col-md-8">
                <input type="text" name="clave" id="clave" class="form-control" placeholder="Clave"  />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Nombre:</label>
            <div class="col-md-8">
                <input type="text" name="name" id="name" class="form-control" placeholder="Nombre"  />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Descripción:</label>
            <div class="col-md-8">
                <textarea name="description" id="description" cols="50" rows="6" class="form-control" ></textarea>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-8">
            <table width="92%" cellpadding="0" cellspacing="0" border="0">
                <tr><td colspan="4" height="10"></td></tr>
                <tr>
                    <td width="300"><label class="col-md-3 control-label">Módulos de Acceso:</label></td>
                    <td align="center">
                        <select class="textfield" style="width:160px" name="module_from" size="6" multiple >
                            {foreach from=$modules item=item key=key}
                                <option value="{$item.moduleId}">{$item.name}</option>
                            {/foreach}
                        </select>
                    </td>
                    <td align="center" width="20">
                        <div style="width:60px;">
                            <input type="button" class="button" onclick="javascript:MoveModule(document.addRoleForm.module_from,document.addRoleForm.module_to)" value="&gt;&gt;">
                            <br />
                            <input type="button" class="button" onclick="javascript:MoveModule(document.addRoleForm.module_to,document.addRoleForm.module_from)" value="&lt;&lt;">
                        </div>
                    </td>
                    <td align="center">
                        <select class="textfield" style="width:160px" name="module_to" size="6" multiple ></select>
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
                <button type="button" class="btn {$BUTTON_COLOR} submitForm">Guardar</button>
                <button type="button" class="btn default closeModal">Cancelar</button>
            </div>
        </div>
    </div>

</form>
