<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Repositorio Docente</b> 
        </div>
		
         <div class="actions">
		 
	

        </div>
		<div class="actions">
		 {if !$docente}
            <a  class="btn {$BUTTON_COLOR}" id="" href="{$WEB_ROOT}/graybox.php?page=add-repositorio" data-target="#ajax" data-toggle="modal" data-width="1000px" title='ADJUNTAR DOCUMENTO'>
                <i class="fa fa-plus"></i> Agregar
            </a>
		{/if}
        </div>
    </div>
    <div class="portlet-body">

	<div id="msj">
	</div>

        {include file="boxes/status_no_ajax.tpl"}
		
		

		<div id='loader'>
		</div>
		<div id='contenido'>
			  {include file="{$DOC_ROOT}/templates/lists/new/repositorio.tpl"}
		</div>
    </div>
</div>