<form id="addMajorForm" name="addMajorForm" method="post" class="form-horizontal" action="{$WEB_ROOT}/add-modules-course/id/{$invoiceId}">
    <input type="hidden" id="type" name="type" value="saveAddMajor"/>
    <div class="form-body">

        <div class="form-group">
            <label class="col-md-3 control-label">Agregar un nuevo Modulo</label>
            <div class="col-md-8">
                <select id="subjectModuleId" name="subjectModuleId" class="form-control">
                    {foreach from=$modules item=item}
                        <option value="{$item.subjectModuleId}">CUAT. {$item.semesterId} {$item.name}</option>
                    {/foreach}
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Fecha Inicial</label>
            <div class="col-md-8">
                <input type="text" name="initialDate" id="initialDate" size="10" class="form-control date-picker " required/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Fecha Final</label>
            <div class="col-md-8">
                <input type="text" name="finalDate" id="finalDate" size="10" class="form-control date-picker " required/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Dias para Terminar</label>
            <div class="col-md-8">
                <input type="text" name="daysToFinish" id="daysToFinish" size="10" class="form-control" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Activo</label>
            <div class="col-md-8">
                <select id="active" name="active" class="form-control">
                    <option value="si">Si</option>
                    <option value="no">no</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Personal Administrativo Asignado:</label>
            <div class="col-md-8">
                <select name="personalId" id="personalId" class="form-control">
                    <option value="-1">Seleccione...</option>
                    {foreach from=$empleados item=personal}
                        <option value="{$personal.personalId}" {if $post.access.0 == $personal.personalId} selected="selected"{/if}>{$personal.lastname_paterno} {$personal.lastname_materno} {$personal.name}</option>
                    {/foreach}
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Docente Asignado:</label>
            <div class="col-md-8">
                <select name="teacherId" id="teacherId" class="form-control">
                    <option value="-1">Seleccione...</option>
                    {foreach from=$empleados item=personal}
                        <option value="{$personal.personalId}" {if $post.access.0 == $personal.personalId} selected="selected"{/if}>{$personal.lastname_paterno} {$personal.lastname_materno} {$personal.name}</option>
                    {/foreach}
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Tutor Asignado:</label>
            <div class="col-md-8">
                <select name="tutorId" id="tutorId" class="form-control">
                    <option value="-1">Seleccione...</option>
                    {foreach from=$empleados item=personal}
                        <option value="{$personal.personalId}" {if $post.access.0 == $personal.personalId} selected="selected"{/if}>{$personal.lastname_paterno} {$personal.lastname_materno} {$personal.name}</option>
                    {/foreach}
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Extra Asignad:</label>
            <div class="col-md-8">
                <select name="extraId" id="extraId" class="form-control">
                    <option value="-1">Seleccione...</option>
                    {foreach from=$empleados item=personal}
                        <option value="{$personal.personalId}" {if $post.access.0 == $personal.personalId} selected="selected"{/if}>{$personal.lastname_paterno} {$personal.lastname_materno} {$personal.name}</option>
                    {/foreach}
                </select>
            </div>
        </div>
		
		 <div class="form-group">
            <label class="col-md-3 control-label">Copiar Curricula:</label>
            <div class="col-md-8">
                <input type='checkbox' name="copia" class="form-control">
            </div>
        </div>

{*
                <div style="float:left"><span class="reqField">*</span> Campo requerido</div>
                <div style="padding-right:60px">
                    <input type="submit" class="btn-70-l" id="addMajor" name="addMajor" value="." />
                </div>
*}

    </div>
    <div class="form-actions">
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
                <button type="button" class="btn default" data-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn green submitForm">Guardar</button>
            </div>
        </div>
    </div>

</form>