<select id="modulo" name="modulo" class="form-control">
    <option value="">-- Seleccionar --</option>
    {foreach from=$modules item=item}
        <option value="{$item.courseModuleId}">{$item.subjectModuleName}</option>
    {/foreach}
</select>