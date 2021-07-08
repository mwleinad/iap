<form id="addMajorForm" name="addMajorForm" method="post" action="{$WEB_ROOT}/add-modules-course/id/{$invoiceId}">
    <input type="hidden" id="type" name="type" value="saveAddMajor"/>

    <div class="row">
        <div class="form-group col-md-4">
            <label for="subjectModuleId">Agregar un nuevo Modulo</label>
            <select id="subjectModuleId" name="subjectModuleId" class="form-control">
                {foreach from=$modules item=item}
                    <option value="{$item.subjectModuleId}">CUAT. {$item.semesterId} {$item.name}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-4">
            <label for="initialDate">Fecha Inicial</label>
            <input type="text" name="initialDate" id="initialDate" class="form-control i-calendar" required/>
        </div>
        <div class="form-group col-md-4">
            <label for="finalDate">Fecha Final</label>
            <input type="text" name="finalDate" id="finalDate" class="form-control i-calendar" required/>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-4">
            <label for="daysToFinish">Dias para Terminar</label>
            <input type="text" name="daysToFinish" id="daysToFinish" class="form-control" />
        </div>
        <div class="form-group col-md-4">
            <label for="active">Activo</label>
            <select id="active" name="active" class="form-control">
                <option value="si">Si</option>
                <option value="no">no</option>
            </select>
        </div>
        <div class="form-group col-md-4">
            <label for="personalId">Personal Administrativo Asignado:</label>
            <select name="personalId" id="personalId" class="form-control">
                <option value="-1">Seleccione...</option>
                {foreach from=$empleados item=personal}
                    <option value="{$personal.personalId}" {if $post.access.0 == $personal.personalId} selected="selected"{/if}>{$personal.lastname_paterno} {$personal.lastname_materno} {$personal.name}</option>
                {/foreach}
            </select>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-6">
            <label for="teacherId">Docente Asignado:</label>
            <select name="teacherId" id="teacherId" class="form-control">
                <option value="-1">Seleccione...</option>
                {foreach from=$empleados item=personal}
                    <option value="{$personal.personalId}" {if $post.access.0 == $personal.personalId} selected="selected"{/if}>{$personal.lastname_paterno} {$personal.lastname_materno} {$personal.name}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="tutorId">Tutor Asignado:</label>
            <select name="tutorId" id="tutorId" class="form-control">
                <option value="-1">Seleccione...</option>
                {foreach from=$empleados item=personal}
                    <option value="{$personal.personalId}" {if $post.access.0 == $personal.personalId} selected="selected"{/if}>{$personal.lastname_paterno} {$personal.lastname_materno} {$personal.name}</option>
                {/foreach}
            </select>
        </div>
    </div>

    <div class="row" >
        <div class="form-group col-md-6">
            <label for="extraId">Extra Asignado:</label>
            <select name="extraId" id="extraId" class="form-control">
                <option value="-1">Seleccione...</option>
                {foreach from=$empleados item=personal}
                    <option value="{$personal.personalId}" {if $post.access.0 == $personal.personalId} selected="selected"{/if}>{$personal.lastname_paterno} {$personal.lastname_materno} {$personal.name}</option>
                {/foreach}
            </select>
        </div>
		 <div class="form-group col-md-6">
            <label for="copia">Copiar Curricula:</label>
            <input type='checkbox' name="copia" class="form-control">
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12 text-center">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
            <button type="submit" class="btn btn-success submitForm">Guardar</button>
        </div>
    </div>
</form>

<script>
    flatpickr('.i-calendar', {
        dateFormat: "Y-m-d"
    });
</script>