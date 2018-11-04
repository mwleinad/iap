<form id="editSubjectForm" name="editSubjectForm" method="post" class="form-horizontal" action="{$WEB_ROOT}/edit-course/id/{$id}">
    <input type="hidden" id="courseId" name="courseId" value="{$id}"/>
    <div class="form-body">

        <div class="form-group">
            <label class="col-md-3 control-label">Selecciona Curricula:</label>
            <div class="col-md-8">
                <select name="subjectId" id="subjectId" style="width:350px" class="form-control">
                    {foreach from=$rsubjects item=curso}
                        <option value="{$curso.majorId}" {if $curso.majorId eq $post.tipo} selected{/if}>{$curso.name}</option>
                    {/foreach}
                </select>
            </div>
        </div>
		<div class="form-group">
            <label class="col-md-3 control-label">Nombre:</label>
            <div class="col-md-8">
                 <input type="text" name="nombre" id="nombre"  class="form-control" value="{$post.name}"/>
            </div>
        </div>
		<!--
		<div class="form-group">
            <label class="col-md-3 control-label">Numero:</label>
            <div class="col-md-8">
                 <input type="text" name="numero" id="numero"  class="form-control" value="{$post.numero}"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Modalidad</label>
            <div class="col-md-8">
                <select name="modality" id="modality"  class="form-control">
                    <option value="Local" {if $post.modality == "Local"} selected="selected"{/if}>Presencial</option>
                    <option value="Online" {if $post.modality == "Online"} selected="selected"{/if}>Online</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Fecha Inicial</label>
            <div class="col-md-8">
                <input type="text" name="initialDate" id="initialDate" size="10" class="form-control date-picker " value="{$post.initialDate}" required/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Fecha Final</label>
            <div class="col-md-8">
                <input type="text" name="finalDate" id="finalDate" size="10" class="form-control date-picker " value="{$post.finalDate}" required/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Dias para terminar</label>
            <div class="col-md-8">
                <input type="text" name="daysToFinish" id="daysToFinish" value="{$post.daysToFinish}"  class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Personal Administrativo Asignado</label>
            <div class="col-md-8">
                <select name="personalId" id="personalId"  class="form-control">
                    <option value="-1">Seleccione...</option>
                    {foreach from=$empleados item=personal}
                        <option value="{$personal.personalId}" {if $post.access.0 == $personal.personalId} selected="selected"{/if}>{$personal.lastname_paterno} {$personal.lastname_materno} {$personal.name}</option>
                    {/foreach}
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Activo</label>
            <div class="col-md-8">
                <select name="active" id="active"  class="form-control">
                    <option value="Si" {if $post.active == "Si"} selected="selected"{/if}>Si</option>
                    <option value="No" {if $post.active == "No"} selected="selected"{/if}>No</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Grupo</label>
            <div class="col-md-8">
                <input type="text" name="group" id="group" value="{$post.group}"  class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Turno</label>
            <div class="col-md-8">
                <input type="text" name="turn" id="turn" value="{$post.turn}"  class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Ciclo Escolar</label>
            <div class="col-md-8">
                <input type="text" name="scholarCicle" id="scholarCicle" value="{$post.scholarCicle}"  class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Libro</label>
            <div class="col-md-8">
                <input type="text" name="libro" id="libro" value="{$post.libro}"  class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Folio</label>
            <div class="col-md-8">
                <input type="text" name="folio" id="folio" value="{$post.folio}"  class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Texto Ponente</label>
            <div class="col-md-8">
                <input type="text" name="ponenteText" id="ponenteText" value="{$post.ponenteText}"  class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Fecha del Diploma</label>
            <div class="col-md-8">
                <input type="text" name="fechaDiploma" id="fechaDiploma" value="{$post.fechaDiploma}"  class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Sede</label>
            <div class="col-md-8">
                <input type="text" name="backDiploma" id="backDiploma" value="{$post.backDiploma}"  class="form-control"/>
            </div>
        </div>
		<b>Información para Constancias</b>
		<div class="form-group">
            <label class="col-md-3 control-label"> Dias:</label>
            <div class="col-md-8">
                <input type="text" name="dias" id="dias" value="{$post.dias}"  class="form-control"/>
            </div>
        </div>
		
		<div class="form-group">
            <label class="col-md-3 control-label"> Horario:</label>
            <div class="col-md-8">
                <input type="text" name="horario" id="horario" value="{$post.horario}"  class="form-control"/>
            </div>
        </div>
		<div class="form-group">
            <label class="col-md-3 control-label"> Aparece en Tabla:</label>
            <div class="col-md-8">
			 
                <input type="checkbox" name="apareceT" id="apareceT"   {if $post.apareceTabla eq 'si'} checked {/if} class="form-control"/>
            </div>
        </div>
		<div class="form-group">
            <label class="col-md-3 control-label">Listar:</label>
            <div class="col-md-8">
                <input type="checkbox" name="listar" id="listar"  {if $post.listar eq 'si'} checked {/if}  class="form-control"/>
            </div>
        </div>
		<div class="form-group">
            <label class="col-md-3 control-label">Tipo:</label>
            <div class="col-md-8">
                <select type="checkbox" name="tipoCuatri" id="tipoCuatri"   class="form-control">
					<option></option>
					<option {if $post.tipoCuatri == "Cuatrimestre"} selected="selected"{/if}>Cuatrimestre</option>
					<option {if $post.tipoCuatri == "Semestre"} selected="selected"{/if}>Semestre</option>
                </select >
            </div>
        </div>
    </div>-->
    <div class="form-actions">
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
                <button type="button" class="btn default" data-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn green submitForm">Guardar</button>
            </div>
        </div>
    </div>
</form>