<form id="frmModal" method="post" action="{$WEB_ROOT}/score-activity/id/{$id}" enctype= "multipart/form-data">
<input type="hidden" name="modality" id="modality" value="Individual" />
<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
<thead>      
   {include file="{$DOC_ROOT}/templates/items/score-header.tpl"}
</thead>
<tbody>
   {include file="{$DOC_ROOT}/templates/items/score-base.tpl"}
</tbody>
</table>
</form>