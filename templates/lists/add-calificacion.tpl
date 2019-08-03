<form method="post" id="frmCal" >
<input type="hidden" name="type" id="type" class="type" value="addCalificacion">
<input type="hidden" name="id" id="id" value="{$id}">
<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
<thead>      
   <tr><!--
      <th width="100" height="28">ID</th>-->
      <th width="80"><center>No. Control</center></th>
      <th width="200"><center>Nombre</center></th>
      <th width="200" ><center>Acumulado</center></th>
      <th width="200" ><center>Calificacion Final</center></th>
	</tr>
</thead>
<tbody>
  {foreach from=$noTeam item=item key=key}
        <tr id="1"><!--
        <td align="center">{$item.alumnoId}</td>-->
        <td align="center">{$item.controlNumber}</td> 
        <td align="center">{$item.lastNamePaterno|upper} {$item.lastNameMaterno|upper} {$item.names|upper}</td> 
		<td align="center">
           <input type="text"  readonly name="pro_{$item.alumnoId}" id="pro_{$item.alumnoId}" value="{$item.addepUp}" class="form-control" style="width:60px">
        </td>
        <td align="center">
           <input type="text"  {if $info.habilitarCalificar eq 'no'} readonly {/if} maxlength="2"  
		   onkeypress="return soloLetras(event)"  
		   {if $item.score < 7 and $majorName eq 'MAESTRIA'} 
		   style="background:#ff00004f; width:60px" 
		   {else if $item.score < 8 and $majorName eq 'DOCTORADO'} style="background:#ff00004f; width:60px"   {/if} 
		   name="cal_{$item.alumnoId}"   id="cal_{$item.alumnoId}" value="{$item.score}" class="form-control" style="width:60px">
        </td>
    </tr>
{foreachelse}
	<tr><td colspan="4" align="center">No se encontr&oacute; ning&uacute;n registro.</td></tr>
{/foreach}

        <tr>
        <td colspan="4" align="center">

			
        </td>
    </tr>

</tbody>
</table>
</form>
<center>
<div id="loader"></div>
<div id="msjd"></div>
<button class="btn " onClick="closeModal()">Cerrar</button>
{if $info.habilitarCalificar eq 'si'}
<button class="btn {$BUTTON_COLOR}" style='background:#4CAF50' onClick="SaveCalificacion({$id})" id="btnSave">Guardar</button>
{/if}

{if $infoUser.perfil eq 'Administrador' or $infoUser.personalId eq 1}
<button class="btn {$BUTTON_COLOR}" style='background:#d7ad03;border-color:#d7ad03' onClick="habilitarEdicion({$id})" id="btnSave">Habilitar Edición</button>
<button class="btn {$BUTTON_COLOR}" style='background:#4CAF50' onClick="validarCal({$id})" id="btnSave">Publicar</button>
{/if}

<br>
<br>
{if $info.habilitarCalificar eq 'no'}
	{if $info.rutaActa eq ''}
		<button  class="btn {$BUTTON_COLOR} submitForm" onClick="descargarActa({$id})">Descargar Acta</button>
		<span class="btn btn-default btn-file" style="width:150px; height:35px !important">

		<form method="post" id="frmFile" >
		<input type="hidden" name="type" id="type" class="type" value="addCalificacion">
		<input type="hidden" name="id" id="id" value="{$id}">
		<input type="file" name="archivos" id="archivos" class="btn-file" style="width:888px !important" onChange="upFile({$id})">
		</form>
		<input type="hidden" name="archivosh" id="archivosh" class="btn-file" >
		Subir Acta
		</span>
	{/if}
{/if}
{if $info.rutaActa ne ''}
 <a href="{$WEB_ROOT}/docentes/calificaciones/{$info.rutaActa}" target='_blank' class="btn {$BUTTON_COLOR} submitForm" >Visualizar Acta Final</a>
{/if}
 <br>
 <progress id='progress' name='progress' {if $info.rutaActa eq ''} value="0" {else} value="100" {/if}  min="0" max="100"></progress>
 <div id='porcentaje' name='porcentaje'>{if $info.rutaActa eq ''} 0 {else} 100% {/if}</div>
</center>