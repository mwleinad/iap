<div class="form-group col-md-6">
    <label for="cycle">Ciclo</label>
    <select name="cycle" id="cycle" class="form-control">
        {foreach from=$ciclos item=item}
            <option value="{$item}" class="text-capitalize">{$item}</option>
        {/foreach}
    </select>
</div>
<div class="form-group col-md-6">
    <label for="period">Periodo</label>
    <select name="period" id="period" class="form-control">
        {foreach from=$periodos item=item}
            <option value="{$item}" class="text-capitalize">{$item}</option>
        {/foreach}
    </select>
</div>
<input type="hidden" name="year" value="{$year}" />