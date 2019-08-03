<div  >
<form id="frmModal" method="post" action="{$WEB_ROOT}/score-activity/id/{$id}" enctype= "multipart/form-data">
<input type="hidden" name="type" id="type" value="" />
<input type="hidden" name="id" id="id" value="{$id}" />
<input type="hidden" name="modality" id="modality" value="Individual" />
<input type="hidden" name="auxTpl" id="auxTpl" value="{$auxTpl}" />
<input type="hidden" name="cId" id="cId" value="{$cId}" />
<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
<thead>      
   {include file="{$DOC_ROOT}/templates/items/score-header.tpl"}
</thead>
<tbody>
   {include file="{$DOC_ROOT}/templates/items/score-base.tpl"}
</tbody>
</table>
</form>
<div>
<div id='msjdiv'></div>
<div id='loader'></div>
<center>
 <button type="submit" id="btnEnviar"  class='btn {$BUTTON_COLOR}' onClick = 'saveCalificacion()'>Actualizar Calificaciones</button>
 </center>
</div>