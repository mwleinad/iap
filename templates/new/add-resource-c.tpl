<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Agregar Recurso
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body">
        <div id="tblContent">
           <!-- TinyMCE -->
			<script type="text/javascript" src="{$WEB_ROOT}/tinymce/tiny_mce.js"></script>
			<script type="text/javascript">
				tinyMCE.init({
					mode : "textareas",
					theme : "advanced",
					skin : "o2k7"

				});
			</script>
			<!-- /TinyMCE -->
			<form class="form-horizontal" id="frmGral" name="frmGral" >
				<input type="hidden" id="type" name="type" value="saveAddMajor"/>
				<input type="hidden" id="resourceId" name="resourceId" value="{$resourceId}"/>
				<input type="hidden" id="auxTpl" name="auxTpl" value="{$auxTpl}"/>
				<input type="hidden" id="cId" name="cId" value="{$id}"/>
				<div class="form-body">
					<div class="form-group">
						<label class="col-md-3 control-label">Nombre:</label>
						<div class="col-md-8">
							<input type="text" name="name" id="name" value="{$infoT.name}" class="form-control" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label">Descripcion:</label>
						<div class="col-md-8">
							<input type="text" name="description" id="description" value="{$infoT.description}" class="form-control" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label">Archivo:</label>
						<div class="col-md-8">
							<input type="file" name="path" id="path" value="" maxlength="30" class="form-control"/>
						</div>
					</div>

					
				</div>
			</form>
        </div>
		
		<div class="form-actions">
						<div class="row">
							<div class="col-md-offset-3 col-md-9"><!--
								<input type="submit" class="btn green submitForm" id="addMajor" name="addMajor"/>-->
								<button type="button" onClick="saveRecursos()" class="btn green submitForm">Guardar</button>
								{*
													<button type="submit" class="btn green submitForm">Guardar</button>
								*}
								<button type="button" class="btn default closeModal">Cancelar</button>
							</div>
						</div>
					</div>
    </div>
</div>
