<div>
	{if !empty($errors)}
	{foreach from=$errors.value item="error" key="key"}
		{if $errors.field.$key}
			Error en el campo: <strong>[{$errors.field.$key}]</strong>
		{/if}
		{$error}.<br>
	{/foreach}
{/if}
</div>