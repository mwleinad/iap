<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorn"></i>Lista de Docentes
        </div>
        <div class="actions">
			
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
        {include file="{$DOC_ROOT}/templates/lists/report-docentes.tpl"}
		</div>
		
    </div>
</div>