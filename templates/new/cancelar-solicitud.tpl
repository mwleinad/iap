<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorn"></i>Cancelar Solicitud 
        </div>
        <div class="actions">

        </div>
    </div>
    <div class="portlet-body">
	<!-- TinyMCE
	<script type="text/javascript" src="{$WEB_ROOT}/tinymce/tiny_mce.js"></script>
	<!-- /TinyMCE -->
    <div class="form-body">
		<form class="form-horizontal" id="addMajorForm" name="addMajorForm" method="post"  enctype="multipart/form-data">
		<input type="hidden" id="type" name="type" value="cancelar"/>
		<input type="hidden" id="solicitudId" name="solicitudId" value="{$id}"/>
			<div class="form-group">
				¿Seguro que desea cancelar la solicitud?
			</div>
		</form>
	<div id="loader3" >
	</div>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-offset-3 col-md-9">
						<button  class="btn {$BUTTON_COLOR}" id="addMajor" name="addMajor" onClick="cancelarSolicitud()">Si</button>
						<button type="button" class="btn default closeModal" onClick="closeModal()">No</button>
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