<div class="portlet box {$PORTLET_COLOR}" >
    <div class="portlet-title" >
        <div class="caption">
            <i class="fa fa-bullhorm"></i>
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body" >
        <div id="tblContent">
			
			<form id="frmGral">
			
			<br>
			<br>
			<center>
			<b>{$infoSol.observacion}</b>
			</center>
			<br>
			<br>
		
			<input  type="hidden" name="solicitudId" id="solicitudId"  value="{$solicitudId}" >
			<input  type="hidden" name="courseId" id="courseId"  value="{$courseId}" >

			</form>
			<div id="msjgg"></div>
			<center><button class="btn  submitForm" onClick="closeModal()">Cerrar</button> </center>
			
        </div>
    </div>
</div>

