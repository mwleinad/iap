<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Agregar Periodos
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body">
        <div id="tblContent">
			<form id="frmGral">
			<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
				<thead>
					<tr>
					<th width="40">Cuat.</th>
					<th width="200">Nombre</th>
					<th width="80">Fecha Inicio</th>
					<th width="80">Fecha Fin</th>
					<th width="60">Periodo</th>
				</tr>
				</thead>
				<tbody>
				{foreach from=$subjects item=subject}
						<tr>
							<td align="center">{$subject.semesterId}</td>
							<td align="left">{$subject.name}</td>
							<td align="left">{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
							<td align="left">{$subject.finalDate|date_format:"%d-%m-%Y"}</td>
							<td align="left"><input type="text" name="periodo_{$subject.courseModuleId}" class="form-control" value="{$subject.periodo}"></td>
						
					{foreachelse}
						<tr>
							<td colspan="12" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
						</tr>
					{/foreach}

				</tbody>
			</table>
			</form>
			<center>
				<button onClick='savePeriodos()' class="btn {$BUTTON_COLOR} submitForm" >Solicitar</button>
			</center>
		</div>
    </div>
</div>
