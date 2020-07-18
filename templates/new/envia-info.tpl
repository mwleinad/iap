<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Información de registro
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body">
        <div id="tblContent" class="content-in">
            
		<form id="frmGral">	     
       <div class="content-settings-row">
            <label for="f1"><span class="reqField">*</span> Usuario:</label>
            <input type="text" name="names" id="names" readonly value="{$info.controlNumber}" class="form-control"/>                      
      </div>
	  
	   <div class="content-settings-row">
            <label for="f1"><span class="reqField">*</span> Contraseña:</label>
            <input type="text" name="pass" id="pass" readonly value="{$info.password}" class="form-control"/>                      
      </div>
	  </form>
	  <br>
	  <br>
	  <center><button type="button" class="btn default" data-dismiss="modal">Cerrar</button>
	  <button type="submit" class="btn green submitForm" onClick="sendInfo()">Enviar</button>
	  </center>
        </div>
    </div>
</div>


