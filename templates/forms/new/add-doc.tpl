<!-- TinyMCE
<script type="text/javascript" src="{$WEB_ROOT}/tinymce/tiny_mce.js"></script>
<!-- /TinyMCE -->


    
    <div class="form-body">
	<form class="form-horizontal" id="frmGral" name="frmGral" method="post"  enctype="multipart/form-data">
	<input type="hidden" id="type" name="type" value="enviarArchivo"/>
    <input type="hidden" id="" name="subjectId" value="{$cId}"/>
    <input type="hidden" id="tipoDocumentoId" name="tipoDocumentoId" value="{$auxTpl}"/>
    <input type="hidden" id="usuarioId" name="usuarioId" value="{$id}"/>
	
		{if $infoDoc}
		<center>
		<a type="button" target='_blank' href='{$WEB_ROOT}/alumnos/repositorio/{$infoDoc.ruta}'  class="btn default blue" style="width:211px">Visualizar</a><br>
		<br>
		<a type="button" href="javascript:void(0)" class="btn default red" style="width:211px" onClick="onDeleteCarta({$infoDoc.repositorioId})">Eliminar</a><br>
		</center>
		{else}
		 <div class="form-group">
            <label class="col-md-3 control-label">Documento:</label>
            <div class="col-md-8">
               <input type="file" name="comprobante">
			   <br>
			   <br>
            </div>
        </div>
		{/if}
       
</form>
<div id="loader3" >
</div>
	{if !$infoDoc}
        <div class="form-actions">
            <div class="row">
                <div class="col-md-offset-3 col-md-9">
                    <button  class="btn green" id="addMajor" name="addMajor" onClick="enviarArchivo()">Enviar</button>
                    <button type="button" class="btn default closeModal" onClick="closeModal()">Cancelar</button>
                </div>
            </div>
        </div>
		{/if}
    </div>


<script type="text/javascript">
    tinyMCE.init({
        mode : "textareas",
        theme : "advanced",
        skin : "o2k7"

    });
</script>
