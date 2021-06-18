{if $auxTpl eq 1}
<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-user-plus"></i> Ver curricula estudiante
    </div>
    <div class="card-body">
{/if}
	<div>
		{include file="{$DOC_ROOT}/templates/forms/add-curricula-to-student2.tpl"}
	</div>
	<div style="clear:both"></div>
	<div>
		{if $auxTpl ne 1}
			{if $positionId==1}
				{include file="{$DOC_ROOT}/templates/lists/student-curricula.tpl"}
			{/if}
		{/if}
	</div>
	{if $auxTpl ne 1}
		<script>
			x=$('addCurricula').value;
			ShowStatus(x);
		</script>
	{/if}
{if $auxTpl eq 1}
    </div>
</div>
{/if}
