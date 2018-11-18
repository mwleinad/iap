<select name="grupos" class="form-control">
	<option></option>
	{foreach from=$lstG item=item}
	<option value="{$item.courseId}">{$item.group}</option>
	{/foreach}
</select>