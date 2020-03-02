<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorn"></i>Adjuntar Documento
        </div>
        <div class="actions">

        </div>
    </div>
    <div class="portlet-body">
         <div class="form-body">
					<form class="form-horizontal" id="frmGral" method="post"  >
					<input type="hidden" id="type" name="type" value="adjuntarDocDocente"/>
					<input type="hidden"  name="personalId" value="{$personalId}"/>
					<input type="hidden" id="solicitudId" name="catId" value="{$catId}"/>
						<div class="form-group">
							<label class="col-md-3 control-label">Archivo:</label>
							<div class="col-md-8">
							   <input type="file" name="comprobante">
							   <br>
							   <br>
							</div>
						</div>
					</form>
					<div class="form-actions">
						<div class="row">
							<div class="col-md-offset-3 col-md-9">
								<button  class="btn green" id="addMajor" name="addMajor" onClick="enviarArchivo()">Enviar</button>
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