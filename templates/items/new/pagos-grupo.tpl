<div class="col-md-6 mb-3">
    <label>Currícula</label>
    <select class="selectpicker form-control"
        data-live-search="true" name="curricula-grupo">
        <option value="">--Selecciona la currícula--</option>
        {foreach from=$cursos item=item}
            <option data-content="{$item.especialidad} {$item.name} <span class='badge badge-primary'>{$item.group}</span>" value="{$item.course_id}"></option>
        {/foreach}
    </select>
</div> 
<div class="col-md-6 mb-3">
    <label for="estatus">Estatus</label>
    <select class="form-control" id="estatus" name="estatus">
        <option value="1">Activos</option> 
        <option value="2">Inactivos</option> 
    </select>
</div> 