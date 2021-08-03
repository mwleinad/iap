<form id="addRoleForm" name="addRoleForm" method="post">
    <input type="hidden" id="type" name="type" value="saveAddRole" />
    <input type="hidden" id="list_modules" name="list_modules" value="" />
    <div class="row">
        <div class="form-group col-md-6">
            <label for="clave">Clave:</label>
            <input type="text" name="clave" id="clave" class="form-control" placeholder="Clave" />
        </div>
        <div class="form-group col-md-6">
            <label for="name">Nombre:</label>
            <input type="text" name="name" id="name" class="form-control" placeholder="Nombre" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-12">
            <label for="description">Descripción:</label>
            <textarea name="description" id="description" cols="50" rows="6" class="form-control"></textarea>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-12">
            <table class="table" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td>
                        <label>Módulos de Acceso:</label>
                    </td>
                    <td class="text-center">
                        <select class="textfield" style="width:160px" name="module_from" size="6" multiple>
                            {foreach from=$modules item=item key=key}
                                <option value="{$item.moduleId}">{$item.name}</option>
                            {/foreach}
                        </select>
                    </td>
                    <td class="text-center" width="20">
                        <div style="width:60px;">
                            <input type="button" class="button" onclick="javascript:MoveModule(document.addRoleForm.module_from,document.addRoleForm.module_to)" value="&gt;&gt;">
                            <br />
                            <input type="button" class="button" onclick="javascript:MoveModule(document.addRoleForm.module_to,document.addRoleForm.module_from)" value="&lt;&lt;">
                        </div>
                    </td>
                    <td class="text-center">
                        <select class="textfield" style="width:160px" name="module_to" size="6" multiple ></select>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-12 text-center">
            <button type="button" class="btn btn-success submitForm">Guardar</button>
            <button type="button" class="btn btn-danger closeModal">Cancelar</button>
        </div>
    </div>
</form>
