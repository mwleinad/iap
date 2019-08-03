<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorn"></i>Agregar 
        </div>
        <div class="actions">

        </div>
    </div>
    <div class="portlet-body">

<!-- TinyMCE
<script type="text/javascript" src="{$WEB_ROOT}/tinymce/tiny_mce.js"></script>
<!-- /TinyMCE -->


    
    <div class="form-body">
	<form class="form-horizontal" id="frmDoc_" name="frmDoc_" method="post"  enctype="multipart/form-data">
	<input type="hidden" id="type" name="type" value="enviarArchivoRepo"/>
	
	<b>Nombre</b><br>
	<input type="text" name="nombre" class="form-control">
	<br>
    <input type="hidden" id="solicitudId" name="solicitudId" value="{$id}"/>

         <b>Documento:</b>
      
               <input type="file" name="comprobante">
			   <br>
			   <br>
          
  
</form>
<div id="loader3" >
</div>
        <div class="form-actions">
            <div class="row">
                <div class="col-md-offset-3 col-md-9">
                    <button  class="btn {$BUTTON_COLOR}" id="addMajor" name="addMajor" onClick="enviarArchivo()">Enviar</button>
                    <button type="button" class="btn default closeModal" onClick="closeModal()">Cancelar</button>
                </div>
            </div>
        </div>
    </div>


<script type="text/javascript">
    tinyMCE.init({
        mode : "textareas",
        theme : "advanced",
        skin : "o2k7"

    });
</script>


    </div>
</div>