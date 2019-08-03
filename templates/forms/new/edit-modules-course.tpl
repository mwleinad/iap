<div id="msjCourse"></div>
<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-gift"></i>.:: Datos del M&oacute;dulo ::.
        </div>
          <!-- <a class="btn {$BUTTON_COLOR}" href="{$WEB_ROOT}/graybox.php?page=view-modules-student&id={$myModule.courseModuleId}" title="Ver Modulos de Curso" data-target="#ajax" data-toggle="modal" >
-->
             <!-- <a  class="btn {$BUTTON_COLOR}" href="{$WEB_ROOT}/view-modules-student/id/{$myModule.courseModuleId}/vp/1&vpa=si" target="_blank" onClick="window.open(this.href, this.target, 'fullscreen,scrollbars'); return false;">
			 Vista previa del M&oacute;dulo
            </a>
			  <a href="{$WEB_ROOT}/graybox.php?page=add-calificacion&id={$myModule.courseModuleId}&auxTpl=admin" data-target="#ajax" data-toggle="modal"  class="btn {$BUTTON_COLOR}">
                Acta de Calificaciones
            </a>
			<a href="{$WEB_ROOT}/inbox/id/{$myModule.courseModuleId}" class="btn {$BUTTON_COLOR}">
                Inbox
            </a>-->

		<div class="actions" >
		<div class="btn-toolbar" style="left:188px !important">
			<div class="btn-group">
				<a class="btn btn-primary" href="javascript:;" data-toggle="dropdown" aria-expanded="false">
				<i class="fa fa-list-alt"></i>
				 Acciones
				<i class="fa fa-angle-down"></i>
			</a>
			<ul class="dropdown-menu">
				<li>
					<a href="{$WEB_ROOT}/graybox.php?page=add-calificacion&id={$myModule.courseModuleId}&auxTpl=admin" data-target="#ajax" data-toggle="modal"  >
						<i class="fa fa-graduation-cap"></i>
							 Acta de Calificaciones
					</a>
				</li>
				<li>
					<a href="{$WEB_ROOT}/graybox.php?page=carta&id={$myModule.courseModuleId}&auxTpl=admin" data-target="#ajax" data-toggle="modal"  >
						<i class="fa fa-clone"></i>
							Carta Descriptiva
					</a>
				</li>
				<li>
					<a href="{$WEB_ROOT}/graybox.php?page=encuadre&id={$myModule.courseModuleId}&auxTpl=admin" data-target="#ajax" data-toggle="modal"  >
						<i class="fa fa-object-group"></i>
							Encuadre
					</a>
				</li>
				<li>
					<a href="{$WEB_ROOT}/graybox.php?page=rubrica&id={$myModule.courseModuleId}&auxTpl=admin" data-target="#ajax" data-toggle="modal"  >
						<i class="fa fa-pencil"></i>
							Rúbrica
					</a>
				</li>
				<li>
					<a href="{$WEB_ROOT}/graybox.php?page=informe&id={$myModule.courseModuleId}&auxTpl=admin" data-target="#ajax" data-toggle="modal"  >
						<i class="fa fa-folder-open"></i>
							Informe Final
					</a>
				</li>
				<li>
					<a href="{$WEB_ROOT}/graybox.php?page=down-plan&id={$myModule.courseModuleId}&auxTpl=admin" data-target="#ajax" data-toggle="modal"  >
						<i class="fa fa-book"></i>
							Programa de la Asignatura
					</a>
				</li>
				<li>

					<!--<a href="{$WEB_ROOT}/docentes/contrato/{$myModule.rutaContrato}"  target="_blank"  >-->
					<a href="{$WEB_ROOT}/graybox.php?page=down-contrato-doc&id={$myModule.courseModuleId}&auxTpl=admin" data-target="#ajax" data-toggle="modal"  >
						<i class="	fa fa-file-pdf-o"></i>
							Contrato
					</a>
				</li>

				<li>
					<a href="{$WEB_ROOT}/grupo/id/{$myModule.courseModuleId}">
						<i class="fa fa-graduation-cap"></i>
							Grupo
					</a>
				</li>

				<li>
					<a href="{$WEB_ROOT}/inbox/id/{$myModule.courseModuleId}">
						<i class="fa fa-envelope"></i>
							Inbox
					</a>
				</li>

				<li>
					<a href="{$WEB_ROOT}/graybox.php?page=val&id={$myModule.courseModuleId}&auxTpl=admin" data-target="#ajax" data-toggle="modal"  >
						<i class="fa fa-line-chart"></i>
							Valoracion
					</a>
				</li>
				<li>
					<a href="{$WEB_ROOT}/view-modules-student/id/{$myModule.courseModuleId}/vp/1&vpa=si" target="_blank" onClick="window.open(this.href, this.target, 'fullscreen,scrollbars'); return false;">
						<i class="fa fa-laptop"></i>
							 Vista previa del M&oacute;dulo
					</a>
				</li>




			</ul>
			</div>
		</div>

		</div>

    </div>
    <div class="portlet-body">
		<div id="msj"></div>
        {*TODO agregar todas las acciones y javascript*}
        <form id="addMajorForm" name="addMajorForm" action="{$WEB_ROOT}/edit-modules-course/id/{$id}" method="post" enctype="multipart/form-data" class="form-horizontal">
            <input type="hidden" id="type" name="type" value="saveAddMajor"/>
            <input type="hidden" id="courseModuleId" name="courseModuleId" value="{$myModule.courseModuleId}"/>


            <div class="form-body">

                <div class="form-group">
                    <label class="col-md-3 control-label">Perteneciente al (a la) {$myModule.majorName}:</label>
                    <div class="col-md-8">
                        <b> {$myModule.subjectName}</b>
                        {if !$docente}| <a href="{$WEB_ROOT}/history-subject" title="Ver Curricula" style="background:#73b760; color:white" >Ver Curricula Activa</a>{/if}
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">Nombre del M&oacute;dulo::</label>
                    <div class="col-md-8">
                        <b>{$myModule.name}</b>
                        || <a href="{$WEB_ROOT}/edit-module/id/{$myModule.subjectModuleId}/course/{$myModule.courseModuleId}" title="Editar Modulo" style="background:#73b760; color:white" >Editar Detalle</a>
                        {if !$docente}||
                            <a href="{$WEB_ROOT}/graybox.php?page=view-modules-course&id={$myModule.courseId}" title="Ver Modulos de Curso" data-target="#ajax" data-toggle="modal" style="background:#73b760; color:white" >Ver Otros Modulos></a>
                        {/if}
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">Fecha Inicial</label>
                    <div class="col-md-8">
                        {if $docente}
                            {$myModule.initialDate}
                        {else}
                            <input type="text" name="initialDate" id="initialDate" size="10" class="form-control date-picker " value="{$myModule.initialDate}" required/>

{*
                            <input type="text" name="initialDate" id="initialDate" value="{$myModule.initialDate}" class="form-control"/><a href="javascript:NewCal('initialDate','ddmmyyyy')"><img src="{$WEB_ROOT}/images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>
*}
                        {/if}
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">Fecha Final</label>
                    <div class="col-md-8">
                        {if $docente}
                            {$myModule.finalDate}
                        {else}
                            <input type="text" name="finalDate" id="finalDate" size="10" class="form-control date-picker " value="{$myModule.finalDate}" required/>

{*
                            <input type="text" name="finalDate" id="finalDate" value="{$myModule.finalDate}"  class="form-control" /><a href="javascript:NewCal('finalDate','ddmmyyyy')"><img src="{$WEB_ROOT}/images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>
*}
                        {/if}
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">Dias para Terminar</label>
                    <div class="col-md-8">
                        {if $docente}
                            {$myModule.daysToFinish}
                        {else}
                            <input type="text" name="daysToFinish" id="daysToFinish" value="{$myModule.daysToFinish}"  class="form-control"/>
                        {/if}
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">Activo</label>
                    <div class="col-md-8">
                        {if $docente}
                            {$myModule.active}
                        {else}
                            <select id="active" name="active"  class="form-control">
                                <option value="si" {if $myModule.active == "si"} selected="selected"{/if}>Si</option>
                                <option value="no" {if $myModule.active == "no"} selected="selected"{/if}>no</option>
                            </select>
                        {/if}
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">Personal Administrativo Asignado</label>
                    <div class="col-md-8">
                        {if $docente}
                            {foreach from=$empleados item=personal}
                                {if $myModule.access.0 == $personal.personalId} {$personal.lastname_paterno} {$personal.lastname_materno} {$personal.name}
                                {/if}
                            {/foreach}
                        {else}
                            <select name="personalId" id="personalId"  class="form-control">
                                <option value="-1">Seleccione...</option>
                                {foreach from=$empleados item=personal}
                                    <option value="{$personal.personalId}" {if $myModule.access.0 == $personal.personalId} selected="selected"{/if}>{$personal.lastname_paterno} {$personal.lastname_materno} {$personal.name}</option>
                                {/foreach}
                            </select>
                        {/if}
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">Docente Asignado:</label>
                    <div class="col-md-8">
                        {if $docente}
                            {foreach from=$empleados item=personal}
                                {if $myModule.access.1 == $personal.personalId} {$personal.lastname_paterno} {$personal.lastname_materno} {$personal.name}
                                {/if}
                            {/foreach}
                        {else}
                            <select name="teacherId" id="teacherId"  class="form-control">
                                <option value="-1">Seleccione...</option>
                                {foreach from=$empleados item=personal}
                                    <option value="{$personal.personalId}" {if $myModule.access.1 == $personal.personalId} selected="selected"{/if}>{$personal.lastname_paterno} {$personal.lastname_materno} {$personal.name}</option>
                                {/foreach}
                            </select>
                        {/if}
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">Tutor Asignado:</label>
                    <div class="col-md-8">
                        {if $docente}
                            {foreach from=$empleados item=personal}
                                {if $myModule.access.2 == $personal.personalId} {$personal.lastname_paterno} {$personal.lastname_materno} {$personal.name}
                                {/if}
                            {/foreach}
                        {else}
                            <select name="tutorId" id="tutorId"  class="form-control">
                                <option value="-1">Seleccione...</option>
                                {foreach from=$empleados item=personal}
                                    <option value="{$personal.personalId}" {if $myModule.access.2 == $personal.personalId} selected="selected"{/if}>{$personal.lastname_paterno} {$personal.lastname_materno} {$personal.name}</option>
                                {/foreach}
                            </select>
                        {/if}
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">Extra Asignado:</label>
                    <div class="col-md-8">
                        {if $docente}
                            {foreach from=$empleados item=personal}
                                {if $myModule.access.3 == $personal.personalId} {$personal.lastname_paterno} {$personal.lastname_materno} {$personal.name}
                                {/if}
                            {/foreach}
                        {else}
                            <select name="extraId" id="extraId"  class="form-control">
                                <option value="-1">Seleccione...</option>
                                {foreach from=$empleados item=personal}
                                    <option value="{$personal.personalId}" {if $myModule.access.3 == $personal.personalId} selected="selected"{/if}>{$personal.lastname_paterno} {$personal.lastname_materno} {$personal.name}</option>
                                {/foreach}
                            </select>
                        {/if}
                    </div>
                </div>

                {if !$docente}
                    <div class="form-group">
                        <label class="col-md-3 control-label">Archivo de Presentaci&oacute;n (.swf):</label>
                        <div class="col-md-8">
                            <input type="file" name="presentacion" id="presentacion"  class="form-control" />
                            {if $existepre==1}&nbsp; &nbsp;  <a target="_blank" href="{$WEB_ROOT}/flash/{$nombrePre}">{$nombrePre} </a> &nbsp; &nbsp;  <a href="{$WEB_ROOT}/edit-modules-course/id/{$moduleCourseId}/e/2" >Eliminar</a> {/if}
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">Calendario (.jpg):</label>
                        <div class="col-md-8">
                            <input type="file" name="calendario" id="calendario"  class="form-control" />
                            {if $existecal==1}&nbsp; &nbsp;  <a target="_blank" href="{$WEB_ROOT}/calendario/{$nombreCal}">{$nombreCal} </a> &nbsp; &nbsp;  <a href="{$WEB_ROOT}/edit-modules-course/id/{$moduleCourseId}/e/1" >Eliminar</a> {/if}
                        </div>
                    </div>

                {/if}
            </div>
            {if !$docente}
                <div class="form-actions">
                    <div class="row">
                        <div class="col-md-offset-3 col-md-9">
                            <button type="button" class="btn default btn-70-delete" data-dismiss="modal" id="addMajor" name="addMajor" onclick="DeleteModuleFromCourse({$myModule.courseModuleId})">Borrar</button>
                            <button type="submit" class="btn {$BUTTON_COLOR} submitForm">Guardar</button>
                            {*
                                            <input type="submit" class="btn-70-l" id="addMajor" name="addMajor" value="." />
                            *}

                        </div>
                    </div>
                </div>
            {/if}
        </form>

    </div>
</div>

<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-gift"></i>.:: Grupo ::.
        </div>
        <div class="actions">

        </div>
    </div>

    <div class="portlet-body" align="center">

        <div class="clearfix margin-bottom-10"> </div>
        <div class="btn-group btn-group-circle btn-group btn-group-justified">
        <a href="{$WEB_ROOT}/grupo/id/{$myModule.courseModuleId}" target="_blank" data-toggle="modal" class="btn blue">
            &raquo; Ver Alumnos
        </a>

        <a href="{$WEB_ROOT}/calification/id/{$myModule.courseModuleId}" target="_blank" data-toggle="modal" class="btn {$BUTTON_COLOR}">
            &raquo; Ver Calificaciones
        </a>

        <a href="{$WEB_ROOT}/graybox.php?page=config-teams&id={$myModule.courseModuleId}&auxTpl=admin" data-target="#ajax" data-toggle="modal"  class="btn blue">
            &raquo; Configurar Equipos
        </a>
        </div>
    </div>
</div>

<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-gift"></i>.:: Actividades ::.
        </div>
           <div class="actions">
            <a href="{$WEB_ROOT}/graybox.php?page=add-activity&id={$myModule.courseModuleId}&auxTpl=admin" data-target="#ajax" data-toggle="modal" class="btn btn-circle blue">
                &raquo; Agregar actividad
            </a>
        </div>

    </div>
    <div class="portlet-body">
        <div style="text-align:left">Ponderaci&oacute;n Total del Modulo: <b>{$totalPonderation}%</b>
            {if $totalPonderation < 100}
                <span style="color:#C00"> La suma de las ponderaciones de las actividades es menor a 100%. Se recomienda que sea 100%</span>
            {/if}
            {if $totalPonderation > 100}
                <span style="color:#C00"> La suma de las ponderaciones de las actividades es mayor a 100%. Se recomienda que sea 100%</span>
            {/if}        </div>
        <a href="{$WEB_ROOT}/add-activity/id/{$myModule.courseModuleId}" onclick="return parent.GB_show('Agregar Actividad', this.href,650,700) "><div class="btnAdd" id="btnAddSubject"></div></a>

        <div id="tblContent-activities">{include file="lists/new/activities.tpl"}</div>
    </div>
</div>

<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-gift"></i>.:: Recursos de Apoyo ::.
        </div>
        <div class="actions">
            <a href="{$WEB_ROOT}/graybox.php?page=add-resource&id={$myModule.courseModuleId}&auxTpl=admin&cId={$myModule.courseModuleId}" data-target="#ajax" data-toggle="modal" class="btn btn-circle blue">
                &raquo; Agregar Recurso de Apoyo
            </a>
        </div>

    </div>
    <div class="portlet-body">
        <div id="tblContentResources">{include file="lists/new/resources.tpl"}</div>
    </div>
</div>

<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-gift"></i>.:: Foros ::.
        </div>
    </div>
    <div class="portlet-body">
        <!-- <a href="{$WEB_ROOT}/add-topic/id/{$myModule.courseId}"  onclick="return parent.GB_show('Agregar Topico', this.href,450,700) "><div class="btnAdd" id="btnAddSubject"></div></a>-->
        <div id="tblContent">{include file="lists/topics-admin.tpl"}</div>
        <br />{*}	{if $coursesCount}
	  <div id="pagination" class="lnkPages">
	  {include file="footer-pages-links.tpl"}
      </div>        {/if}
	  {*}
    </div>
</div>

<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-gift"></i>.:: Avisos ::.
        </div>
        <div class="actions">
            <a href="{$WEB_ROOT}/graybox.php?page=add-noticia&id={$myModule.courseModuleId}&auxTpl=admin" data-target="#ajax" data-toggle="modal"  class="btn btn-circle blue">
                &raquo; Agregar Aviso
            </a>
        </div>
    </div>
    <div class="portlet-body">
        <div id="tblContentNoticias">{include file="lists/new/module-announcements.tpl"}</div>
    </div>
</div>


