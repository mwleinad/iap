<div class="col-md-7 mb-3 mx-auto">
    <label>Currícula</label>
    <select class="selectpicker form-control"
        data-live-search="true" name="curricula-grupo">
        <option value="">--Selecciona la currícula--</option>
        {foreach from=$cursos item=item}
            <option data-content="{$item.especialidad} {$item.name} <span class='badge badge-primary'>{$item.group}</span>" value="{$item.course_id}"></option>
        {/foreach}
    </select>
</div> 