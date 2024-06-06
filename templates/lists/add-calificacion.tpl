<form method="post" id="frmCal">
    <input type="hidden" name="type" id="type" class="type" value="addCalificacion" />
    <input type="hidden" name="id" id="id" value="{$id}" />
    <table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
        <thead>      
            <tr class="text-center">
                <th>No. Control</th>
                <th>Nombre</th>
                <th>Acumulado</th>
                <th>Calificación Final</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th class="text-center table-success" colspan="4">Alumnos Ordinarios</th>
            </tr>
            {foreach from=$noTeam item=item key=key}
                <tr id="1">
                    <td class="text-center">{$item.controlNumber}</td> 
                    <td class="text-center">
                        {$item.lastNamePaterno|upper} {$item.lastNameMaterno|upper} {$item.names|upper}
                    </td> 
                    <td class="text-center">
                        <input type="text" readonly name="pro_{$item.alumnoId}" id="pro_{$item.alumnoId}" value="{$item.addepUp}" class="form-control" />
                    </td>
                    <td class="text-center">
                        <input {(in_array($item.alumnoId,[4336, 4531, 4570, 4576, 3983])) ? 'disabled' : ''} type="text" {if $info.habilitarCalificar eq 'no'} readonly {/if} maxlength="2" onkeypress="return soloLetras(event)" name="cal_{$item.alumnoId}" id="cal_{$item.alumnoId}" value="{if $item.score < 7 and $majorName eq 'MAESTRÍA' and $item.score != 0} 6 {else if $item.score < 8 and $majorName eq 'DOCTORADO' and $item.score != 0} 7 {else if $item.score eq 0} N/P {else} {$item.score} {/if}" class="form-control {if $item.score < 7 and $majorName eq 'MAESTRÍA'} bg-danger {else if $item.score < 8 and $majorName eq 'DOCTORADO'} bg-danger {/if}" {if $item.is_validated == 1} readonly {/if} />
                    </td>
                </tr>
            {foreachelse}
                <tr><td colspan="4" class="text-center">No se encontró ningún registro.</td></tr>
            {/foreach}
            <tr>
                <th class="text-center table-danger" colspan="4">Alumnos Recursadores</th>
            </tr>
            {foreach from=$studentsRepeat item=item key=key}
                <tr id="1">
                    <td class="text-center">{$item.controlNumber}</td> 
                    <td class="text-center">
                        {$item.lastNamePaterno|upper} {$item.lastNameMaterno|upper} {$item.names|upper}
                    </td> 
                    <td class="text-center">
                        <input type="text" readonly name="pro_{$item.alumnoId}" id="pro_{$item.alumnoId}" value="{$item.addepUp}" class="form-control" />
                    </td>
                    <td class="text-center">
                        <input type="text" {if $info.habilitarCalificar eq 'no'} readonly {/if} maxlength="2" onkeypress="return soloLetras(event)" name="cal_{$item.alumnoId}" id="cal_{$item.alumnoId}" value="{$item.score}" class="form-control {if $item.score < 7 and $majorName eq 'MAESTRÍA'} bg-danger {else if $item.score < 8 and $majorName eq 'DOCTORADO'} bg-danger {/if}" />
                    </td>
                </tr>
            {foreachelse}
                <tr><td colspan="4" class="text-center">No se encontró ningún registro.</td></tr>
            {/foreach}
        </tbody>
    </table>
</form>
<div id="loader" class="text-center"></div>
<div id="msjd" class="text-center"></div>
<div class="col-md-12 text-center my-4">
    <button class="btn btn-danger" onClick="btnClose()">Cerrar</button>
    {if $info.habilitarCalificar eq 'si'}
        <button class="btn btn-success" onClick="SaveCalificacion({$id})" id="btnSave">Guardar</button>
    {/if}
    {if $infoUser.perfil eq 'Administrador' or $infoUser.personalId eq 1 or $infoUser.positionId eq 2 or $infoUser.positionId eq 3 or $infoUser.positionId eq 5}
        <button class="btn btn-warning" onClick="habilitarEdicion({$id})" id="btnSave">
            Habilitar Edición
        </button>
        <button class="btn btn-success" onClick="validarCal({$id})" id="btnSave">Publicar</button>
    {/if}
</div>

<div class="col-md-12 text-center mb-4">
    {if $info.habilitarCalificar eq 'no'}
        {if $info.rutaActa eq ''}
            <button  class="btn btn-success submitForm" onClick="descargarActa({$id})">Descargar Acta</button>
            <span class="btn btn-info btn-file">
                <form method="post" id="frmFile" >
                    <input type="hidden" name="type" id="type" class="type" value="addCalificacion" />
                    <input type="hidden" name="id" id="id" value="{$id}" />
                    <input type="file" name="archivos" id="archivos" class="btn-file" onChange="upFile({$id})" />
                </form>
                <input type="hidden" name="archivosh" id="archivosh" class="btn-file" />
                Subir Acta
            </span>
        {/if}
    {/if}
</div>

<div class="col-md-12 text-center">
    {if $info.rutaActa ne ''}
        <a href="{$WEB_ROOT}/docentes/calificaciones/{$info.rutaActa}" target='_blank' class="btn btn-success submitForm">Visualizar Acta Final</a><br>
    {/if}
    <progress id='progress' name='progress' {if $info.rutaActa eq ''} value="0" {else} value="100" {/if}  min="0" max="100"></progress>
    <div id='porcentaje' name='porcentaje'>{if $info.rutaActa eq ''} 0 {else} 100% {/if}</div>
</div>