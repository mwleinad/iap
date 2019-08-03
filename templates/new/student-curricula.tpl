{if $auxTpl eq 1}
<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-user-plus "></i>Ver curricula estudiante
        </div>
    </div>
    <div class="portlet-body">
        <div id="">
{/if}
	<div>
		{include file="{$DOC_ROOT}/templates/forms/add-curricula-to-student2.tpl"}
	</div>
	<div style="clear:both"></div>
	<div>
	{if $auxTpl ne 1}
		{if $positionId==1} {include file="{$DOC_ROOT}/templates/lists/student-curricula.tpl"}{/if}
	{/if}
	</div>
{if $auxTpl ne 1}
	<script >
	x=$('addCurricula').value;
	//alert("hola mundo");
	ShowStatus(x);
	</script >
{/if}
{if $auxTpl eq 1}
		</div>
    </div>
</div>
{/if}
