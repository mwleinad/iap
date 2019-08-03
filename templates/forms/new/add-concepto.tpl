<!-- TinyMCE
<script type="text/javascript" src="{$WEB_ROOT}/tinymce/tiny_mce.js"></script>
<!-- /TinyMCE -->


    
    <div class="form-body">
	<form class="form-horizontal" id="frmGral" name="frmGral" method="post"  enctype="multipart/form-data">
	<input type="hidden" id="type" name="type" value="enviarArchivo"/>
    <input type="hidden" id="solicitudId" name="solicitudId" value="{$id}"/>
        <div class="form-group">
            <label class="col-md-3 control-label">Nombre:</label>
            <div class="col-md-8">
               <input type="text" name="nombre" class="form-control" value="{$info.nombre}">
			   <br>
			   <br>
            </div>

            <label class="col-md-3 control-label">Precio:</label>
            <div class="col-md-8">
               <input type="text" name="precio" class="form-control" value="{$info.precio}">
			   <br>
			   <br>
            </div>
			
			
            <label class="col-md-3 control-label">ID School Manager:</label>
            <div class="col-md-8">
               <input type="text" name="id" class="form-control" value="{$info.idfire}">
			   <br>
			   <br>
            </div>
        </div>
</form>
<div id="loader3" >
</div>
<div id="res_" >
</div>
        <div class="form-actions">
            <div class="row">
                <div class="col-md-offset-3 col-md-9">
                    <button  class="btn {$BUTTON_COLOR}" id="addMajor" name="addMajor" onClick="saveConcepto()">Enviar</button>
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
