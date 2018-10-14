<!-- TinyMCE
<script type="text/javascript" src="{$WEB_ROOT}/tinymce/tiny_mce.js"></script>
<!-- /TinyMCE -->


    
    <div class="form-body">
	<form class="form-horizontal" id="frmGral" name="frmGral" method="post"  enctype="multipart/form-data">
	<input type="hidden" id="type" name="type" value="saveGuardarCertificacion"/>
    <input type="hidden" id="personalId" name="personalId" value="{$id}"/>
        <div class="form-group">
           

			<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
				<tr>
					<td>Certificación</td>
					<td></td>
				</tr>
				{foreach from=$lstSub item=item key=key}
				<tr>
					<td>{$item.name}</td>
					<td>
				
					<input type="checkbox" name="chek_{$item.courseModuleId}" id="" 	{if $item.countModule >0} checked {/if} >
					</td>
				</tr>
				{/foreach}
			</table>
            
        </div>
</form>
<div id="loader3" >
</div>
<div id="res_" >
</div>
        <div class="form-actions">
            <div class="row">
                <div class="col-md-offset-3 col-md-9">
                    <button  class="btn green" id="addMajor" name="addMajor" onClick="saveGuardarCertificacion()">Guardar</button>
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
