<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Documentos del Docente</b> 
        </div>
		
         <div class="actions">
		 
	

        </div>
		<div class="actions">
            <!--<a href="javascript:;" class="btn green" id="btnAddMajor">
                <i class="fa fa-plus"></i> Sincronizar School Manager
            </a>-->
        </div>
    </div>
    <div class="portlet-body">

	<div id="msj">
	</div>

        {include file="boxes/status_no_ajax.tpl"}
		
		

		<div id='loader'></div>
		<div id='msj'></div>
		<div id='contenido'>
			  {include file="{$DOC_ROOT}/templates/lists/new/doc-docente.tpl"}
		</div>
    </div>
</div>