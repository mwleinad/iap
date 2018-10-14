
<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
<thead>      
      {include file="{$DOC_ROOT}/templates/items/usuarios-header.tpl"}
</thead>
<tbody>
   {include file="{$DOC_ROOT}/templates/items/usuarios-base.tpl"}
</tbody>
</table>
{include file="{$DOC_ROOT}/templates/lists/pages_ok.tpl" pages=$registros.pages info=$registros.info}