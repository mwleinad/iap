<form id="frmGral">
	<input type="hidden" name="course" value="{$courseId}" />
	<table class="table table-bordered table-striped">
		<thead>      
			{include file="{$DOC_ROOT}/templates/items/student-header1.tpl"}
		</thead>
		<tbody>
			{include file="{$DOC_ROOT}/templates/items/student-base1.tpl"}
		</tbody>
	</table>
</form>
<div id="msj"></div>
<div class="col-md-12 text-center mt-3">
	<button class="btn btn-danger" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
	{if $tipo eq 'matricula'}
		<button class="btn btn-success submitForm" onClick="saveMatricula()">
			Guardar
		</button>
	{else}
		<button class="btn btn-success submitForm" onClick="saveNumReferencia()">
			Guardar
		</button>
	{/if}
</div>