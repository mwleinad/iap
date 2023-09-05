<div class="col-md-7 mb-3 mx-auto">
    <label>Alumno</label>
    <select class="selectpicker alumnos form-control" data-url="{$WEB_ROOT}/ajax/new/studentCurricula.php"
        data-live-search="true" name="alumno">
        <option value="">--Selecciona el alumno--</option>
        {foreach from=$alumnos item=item}
            <option value="{$item.userId}">{$item.lastNamePaterno|upper} {$item.lastNameMaterno|upper}
                {$item.names|upper}</option>
        {/foreach}
    </select>
</div>
<div class="col-md-7 mb-3 mx-auto">
    <label>Currícula</label>
    <select data-none-selected-text="--Selecciona la currícula--" class="selectpicker curricula form-control"
        data-max-options="1" name="curricula" id="curricula">
    </select>
</div>