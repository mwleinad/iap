<form class="form" method="post" action="{$WEB_ROOT}/score-activity/id/{$id}" enctype="multipart/form-data"
	id="form_activities">
	<input type="hidden" name="type" id="type" value="" />
	<input type="hidden" name="id" id="id" value="{$id}" />
	<input type="hidden" name="modality" id="modality" value="Individual" />
	<input type="hidden" name="auxTpl" id="auxTpl" value="{$auxTpl}" />
	<input type="hidden" name="cId" id="cId" value="{$cId}" />
	<table class="table table-sm table-bordered table-striped">
		<thead>
			{include file="{$DOC_ROOT}/templates/items/score-header.tpl"}
		</thead>
		<tbody>
			{include file="{$DOC_ROOT}/templates/items/score-base.tpl"}
		</tbody>
	</table>
	<div class="col-md-12 text-center mt-4">
		<button type="submit" id="btnEnviar" class='btn btn-success'>
		   Actualizar Calificaciones
	   </button>
   </div>
</form>
<div> 