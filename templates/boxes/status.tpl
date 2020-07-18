<div>
	{if !empty($errors)}
	{foreach from=$errors.value item="error" key="key"}
		{$error}.<br>
		{if $errors.field.$key}
			Campo: <u>{$errors.field.$key}</u><br><br>
		{/if}
	{/foreach}
{/if}
</div>