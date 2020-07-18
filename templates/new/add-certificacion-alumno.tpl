<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Certificaciones
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body">
	
	
	<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
				<thead>      
					 <tr>
						<th width="" height="28">Nombre</th>		
						<th width="" height="28">Grupo</th>				
					</tr>
				</thead>
				<tbody>
				{foreach from=$registros item=item key=key}
				
				    <tr>
					<td align="center" class="id">{$item.certificacion}</td>       
					<td align="center" class="id">{$item.group}</td>            				
					</tr>
					<tr>
						<td colspan="5" style="display:none" id="r_{$item.subjectId}">
						
						</td>
					</tr>
					{/foreach}
				</tbody>
			</table>
	
		<form name="frmGral2" id="frmGral2">
		<input type="hidden" name="alumnoId" value="{$id}">
		Certificacion:
        <select name="certificacionId" class="form-control" onChange="buscarGrupoModal()">
        <option></option>
		{foreach from=$lstCertificaciones item=item}
		<option value="{$item.subjectId}">{$item.name}</option>
		{/foreach}
        </select>
		<br>
		Grupo:
		<div id="divGps">
		</div>
		</form>
		<div id="msj">
		</div>
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


