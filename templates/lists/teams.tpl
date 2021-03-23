<form method="post" action="">
   <input type="hidden" name="auxTpl" id="auxTpl" value="{$auxTpl}">
   <table class="table table-sm table-bordered table-striped">
      <thead>      
         {include file="{$DOC_ROOT}/templates/items/team-header.tpl"}
      </thead>
      <tbody>
         {include file="{$DOC_ROOT}/templates/items/team-base.tpl"}
      </tbody>
   </table>
</form>