<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorn"></i>Lista de Docentes
        </div>
        <div class="actions">
			<a  class="btn {$BUTTON_COLOR}" id="" href="{$WEB_ROOT}/graybox.php?page=add-docente-admin" data-target="#ajax" data-toggle="modal" data-width="1000px" title='AGREGAR'>
				<i class="fa fa-plus"></i> Agregar
			</a>
        </div>
    </div>
    <div class="portlet-body">
	
		
		<div style='display:-webkit-inline-box'>
			<form id='frmFlt'>
			<b>Nombre</b><input type='text' name='nombre' class='form-control' style='width:230px' onKeyUp='onBuscar()' onKeyPress="onBuscar()" >
			</form>
			<br>
			<button onClick='onBuscar()' class='btn {$BUTTON_COLOR}'>Buscar</button>
		</div>
		<div id="msj">
		</div>
		<div id='container'>
        {include file="{$DOC_ROOT}/templates/lists/lst-docentes.tpl"}
		</div>
		
    </div>
</div>