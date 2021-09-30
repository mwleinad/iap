<div class="form-group col-md-6">
    <label for="ci">Ciclo</label>
    <select name="ci" id="ci" class="form-control">
        {foreach from=$ciclos item=item}
            <option value="{$item}" class="text-capitalize">{$item}</option>
        {/foreach}
    </select>
</div>
<div class="form-group col-md-6">
    <label for="pe">Periodo</label>
    <select name="pe" id="pe" class="form-control">
        {foreach from=$periodos item=item}
            <option value="{$item}" class="text-capitalize">{$item}</option>
        {/foreach}
    </select>
</div>
<input type="hidden" name="year" value="{$year}" />