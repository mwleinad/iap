<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="far fa-folder"></i> Agregar
    </div>
    <div class="card-body">
        <form id="frmDoc_" name="frmDoc_" method="post" enctype="multipart/form-data">
            <input type="hidden" id="type" name="type" value="enviarArchivoRepo" />
            <div class="row">
                <div class="col-md-12">
                    <label for="nombre">Nombre</label>
                    <input type="text" id="nombre" name="nombre" class="form-control" />
                </div>
            </div>
            <input type="hidden" id="solicitudId" name="solicitudId" value="{$id}" />
            <div class="row mt-3">
                <div class="col-md-12">
                    <label for="comprobante">Documento:</label>
                    <input type="file" id="comprobante" name="comprobante" />
                </div>
            </div>
        </form>
        <div id="loader3" class="my-3"></div>
        <div class="row">
            <div class="col-md-12 text-center">
                <button class="btn btn-primary" id="addMajor" name="addMajor" onClick="enviarArchivo()">Enviar</button>
                <button type="button" class="btn btn-danger closeModal" onClick="btnClose()">Cancelar</button>
            </div>
        </div>
    </div>
</div>














<div class="portlet box red">
    <div class="portlet-body">

<!-- TinyMCE
<script type="text/javascript" src="{$WEB_ROOT}/tinymce/tiny_mce.js"></script>
<!-- /TinyMCE -->


    
    


<script type="text/javascript">
    tinyMCE.init({
        mode : "textareas",
        theme : "advanced",
        skin : "o2k7"

    });
</script>


    </div>
</div>