<form id="frmModal" method="post" action="{$WEB_ROOT}/score-activity/id/{$id}" enctype="multipart/form-data">
	<input type="hidden" name="modality" id="modality" value="Por Equipo" />
	<input type="hidden" name="id" id="id" value="{$id}" />
	<input type="hidden" name="type" id="type" value="saveCalificacion" />

	<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
		<thead>      
			{include file="{$DOC_ROOT}/templates/items/score-team-header.tpl"}
		</thead>
		<tbody>
			{include file="{$DOC_ROOT}/templates/items/score-team-base.tpl"}
		</tbody>
	</table>
</form>
<div id='msjdiv'></div>
<div id='loader'></div>
<div class="col-md-12 text-center">
 	<button type="submit" id="btnEnviar" class="btn btn-success" onClick="saveCalificacion()">
	 	Actualizar Calificaciones
	</button>
</div>