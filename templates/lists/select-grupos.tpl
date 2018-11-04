<select name="grupos" class="form-control">
	<option></option>
	{foreach from=$lstG item=item}
	<option>{$item.group}</option>
	{/foreach}
</select>