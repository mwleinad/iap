<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Configuración de Examen
        </div>
        <div class="actions">

			<a href="{$WEB_ROOT}/edit-modules-course/id/{$activity.courseModuleId}" id="btnAddMajor" class="btn green" title="Editar Modulo" >Regresar a Modulo</a>
        </div>
    </div>
    <div class="portlet-body">
        <div id="tblContent">
			{include file="boxes/status_no_ajax.tpl"}                                     
			<div id="tblContent">	
			{include file="{$DOC_ROOT}/templates/forms/configurar-examen.tpl"}
			</div>
		</div>
	</div>
</div>