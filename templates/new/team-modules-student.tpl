<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Equipo {$myModule.name|truncate:45:"..."}
        </div>

    </div>
    <div class="portlet-body">


<form class="form-horizontal" id="addPersonalForm" name="addPersonalForm" method="post" enctype="multipart/form-data">
    <input type="hidden" id="type" name="type" value="saveAddPersonal"/>
    <input type="hidden" id="list_roles" name="list_roles" value="" />

    <div class="form-body">

        <table width="92%" cellpadding="0" cellspacing="5" border="0" class="tblGral table table-bordered table-striped table-condensed flip-content">

            <tr>
                <td width="180">Enviar Correo:</td>
                <td align="center">
                    <select class="textfield" style="width:250px" name="role_from" id="role_from" size="6" multiple >
                        {foreach from=$myTeam item=item key=key}
                            <option value="{$item.userId}">{$item.names} {$item.lastNamePaterno} {$item.lastNameMaterno}</option>
                        {/foreach}
                    </select>
                </td>
                <td align="center" width="20">
                    <div style="width:60px">
                        <input type="button" class="button" onclick="javascript:MoveRole(document.addPersonalForm.role_from,document.addPersonalForm.role_to)" value="&gt;&gt;">
                        <br />
                        <input type="button" class="button" onclick="javascript:MoveRole(document.addPersonalForm.role_to,document.addPersonalForm.role_from)" value="&lt;&lt;">
                    </div>
                </td>
                <td align="center">
                    <select class="textfield" style="width:250px" name="role_to" id="role_to" size="6" multiple >
                        {foreach from=$usrRoles item=item key=key}
                            <option value="{$item.roleId}">{$item.name}</option>
                        {/foreach}
                    </select>
                </td>
            </tr>
            <tr>
                <td width="180">Asunto:</td>
                <td colspan="3" height="10" align="center">
                    <input type="text" name="subject" id="subject" size="50" />
                </td></tr>
            <tr>
                <td width="180">Descripci&oacute;n:</td>
                <td colspan="4" height="10" align="center">
                    <textarea name="body" id="body" cols="50" rows="6"></textarea>
                </td></tr>
            <tr>
                <td width="180">Archivo:</td>
                <td colspan="4" height="10" align="center">
                    <input type="file" name="file" id="file" size="50" class="btn btn-circle default" />
                </td></tr>

    </div>
            <tr>

                <td colspan="4" height="10" align="center">

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="button" class="btn {$BUTTON_COLOR} submitForm" onclick="SubmitForm()">Enviar Correo</button>

                            </div>
                        </div>
                    </div>

                </td>
            </tr>
        </table>




</form>

    </div>
</div>