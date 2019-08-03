<form  id='frmGral_4'>
<input type="hidden" name="personalId" class='form-control' value='{$info.personalId}'>
Si usted impartirá clases presenciales y llevará su automóvil al IAP-Chiapas los dias de clase, le pedimos de favor
llenar la siguiente información para poder apartarle un cajón el dia de sus clases
<br>
<br>
<b>Modelo automóvil</b>
<input type="text" name="modeloAuto" class='form-control' {if $cId eq 'si'} disabled {/if} value='{$infoBasic.infoAuto.0.modelo}'><br>
<b>Color automóvil</b>
<input type="text" name="colorAuto" class='form-control' {if $cId eq 'si'} disabled {/if} value='{$infoBasic.infoAuto.0.color}'><br>
<b>Placas automóvil</b>
<input type="text" name="placasAuto" class='form-control' {if $cId eq 'si'} disabled {/if} value='{$infoBasic.infoAuto.0.placas}'><br>
</form>
<div id="msj_4">
</div>
{if $cId ne 'si'}

<center>
<button onClick='guardarInformacion(4)' class="btn {$BUTTON_COLOR}" >
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
	<button onClick='guardarInformacion(4)' class="btn {$BUTTON_COLOR}" >Guardar</button>
</div>
</center>