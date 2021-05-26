<select id="materia" name="materia" class="form-control">
    <option value="">-- Seleccionar --</option>
    {foreach from=$lstMats item=subject}
        <option value="{$subject.subjectModuleId}">{$subject.name}</option>
    {/foreach}
</select>