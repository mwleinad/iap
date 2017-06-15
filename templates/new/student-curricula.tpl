<div>
	{include file="{$DOC_ROOT}/templates/forms/add-curricula-to-student2.tpl"}
</div>
<div style="clear:both"></div>
<div>

 {if $positionId==1} {include file="{$DOC_ROOT}/templates/lists/student-curricula.tpl"}{/if}
</div>

<script >
x=$('addCurricula').value;
//alert("hola mundo");

ShowStatus(x);
</script >
