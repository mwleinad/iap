<div class="portlet box {$PORTLET_COLOR}" style='margin-top:5% !important; width:70%; margin-left:15% !important'>
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
			
			<b>Favor de indicar a detalle la información que requiere para la generación de su constancia</b>
			<br>
			<br>
			<center>
			<textarea class="form-control" name="observacions" id="observacions" style="width:500px"></textarea>
			</center>
			<br>
			<br>
		
			<input  type="hidden" name="solicitudId" id="solicitudId"  value="{$solicitudId}" >
			<input  type="hidden" name="courseId" id="courseId"  value="{$courseId}" >

			</form>
			<div id="msjgg"></div>
			<center><button onClick='addSaveSolicitudOk()' class="btn {$BUTTON_COLOR} submitForm" >Solicitar</button> </center>
			
        </div>
    </div>
</div>

