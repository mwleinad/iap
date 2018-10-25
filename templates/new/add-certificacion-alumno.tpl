<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Certificaciones
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body">
		<form name="frmGral2" id="frmGral2">
		<input type="hidden" name="alumnoId" value="{$id}">
        <select name="courseId" class="form-control">
        <option></option>
		{foreach from=$lstCertificaciones item=item}
		<option value="{$item.courseId}">{$item.name}</option>
		{/foreach}
        </select>
		</form>
	 <div class="form-actions">
            <div class="row">
                <div class="col-md-offset-3 col-md-9">
                    <button  class="btn green" id="addMajor" name="addMajor" onClick="addCertificacion()">Guardar</button>
                    <button type="button" class="btn default closeModal" onClick="closeModal()">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
</div>


