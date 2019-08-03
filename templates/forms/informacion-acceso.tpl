<center>
<form  id='frmGral_5'>
<input type="hidden" name="personalId" class='form-control' value='{$info.personalId}'>
<br>
<br>
<b>Usuario</b>
<input type="text" style="width:555px" name="user" class='form-control'    {if $cId eq 'si' or $Usertype  eq 'Docente'} disabled {/if} value='{$info.username}'><br>
<b>Contraseña</b>
<input type="password" style="width:555px" name="pass" id="pass1" class='form-control' {if $cId eq 'si'} disabled {/if} value='{$info.passwd}'>
<input type="text" style="width:555px; display:none" name="pass" id="pass2"  class='form-control' {if $cId eq 'si'} disabled {/if} value='{$info.passwd}'>
<a href="javascript:void(0)" onClick="onVerPass()">
<i class="material-icons md-16 icon-green"  >visibility</i>
</a>
<br>
<br>
</form>
</center>
<div id="msj_5">
</div>
{if $cId ne 'si'}
<center>
<button onClick='guardarInformacion(5)' class="btn {$BUTTON_COLOR}" >
Guardar
</button>
</center>
{else}
	<center>
	<button onClick='activaEdicion()' class="btn yellow" >
						Activar Edicion
	</button>
	<!--<button onClick='pdfDatos({$info.personalId})' class="btn blue" >Imprimir</button>-->
	</center>
{/if}
<center>
<div class="divControls" style="display:none">
	<button onClick='guardarInformacion(5)' class="btn {$BUTTON_COLOR}" >Guardar</button>
</div>
</center>