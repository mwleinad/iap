<select name="personalId" class="form-control">
	<option></option>
	{foreach from=$lstCalificador item=item}
	<option value="{$item.personalId}">{$item.name} {$item.lastname_paterno} {$item.lastname_materno}</option>
	{/foreach}
</select>