<form id="frmGral">
<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
<thead>      
      {include file="{$DOC_ROOT}/templates/items/student-header1.tpl"}
</thead>
<tbody>
   {include file="{$DOC_ROOT}/templates/items/student-base1.tpl"}
</tbody>
</table>
</form>
<div id="msj">
</div>
<center>
<button class="btn default" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">cerrar</button>
{if $tipo eq 'matricula'}
<button class="btn {$BUTTON_COLOR} submitForm" onClick="saveMatricula()">
Guardar
</button>
{else}
<button class="btn {$BUTTON_COLOR} submitForm" onClick="saveNumReferencia()">
Guardar
</button>
{/if}
</center>