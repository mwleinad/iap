<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Documentos del Docente</b> 
        </div>
		
         <div class="actions">
		 
	

        </div>
		<div class="actions">
             <a  class="btn green" id="" href="{$WEB_ROOT}/graybox.php?page=add-cat-doc-docente-add" data-target="#ajax" data-toggle="modal" data-width="1000px" title='ADJUNTAR DOCUMENTO'>
                <i class="fa fa-plus"></i>Agregar
            </a>
        </div>
    </div>
    <div class="portlet-body">

	<div id="msj">
	</div>

        {include file="boxes/status_no_ajax.tpl"}
		
		

		<div id='loader'></div>
		<div id='msj'></div>
		<div id='contenido'>
			  {include file="{$DOC_ROOT}/templates/lists/new/cat-doc-docente.tpl"}
		</div>
    </div>
</div>