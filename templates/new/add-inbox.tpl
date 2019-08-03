<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Nuevo Mensaje</b> {$myModule.name|truncate:65:"..."} &raquo;
        </div>
        <div class="actions">

        </div>
    </div>
    <div class="portlet-body">

		<div id='contenido'>
		<form id="frmGral">
		<textarea class='form-control' name="mensaje"></textarea>
		<input type='hidden' value='' name="type" id="type">
		<input type='hidden' value='{$profId}' name="profId" id="profId">
		<input type='hidden' value="{$c5Id}" name="c5Id" id="c5Id">
		</form>
		<center><button type="submit" class="btn {$BUTTON_COLOR} submitForm" onClick='saveMsj()'>Enviar</button></center>
		</div>
    </div>
</div>