<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorn"></i>Vehiculos
        </div>
        <div class="actions">
			<a  class="btn green" onClick='onLoadPdf()' title='AGREGAR'>
				<i class="fa fa-plus"></i> Imprimir
			</a>
        </div>
    </div>
    <div class="portlet-body">
	
		
		
			<form id='frmFlt'>
			<div style='display:-webkit-inline-box; width:1000px'>
			<b>Nombre</b>
			<input type='text' name='nombre' class='form-control' style='width:230px' onKeyUp='onBuscar()' onKeyPress="onBuscar()" >
			<b>Inicio</b><input type='text' name='inicio' id='fecha1' style='width:230px' onClick="loadFecha(1)" class='form-control'>
			<b>Fin:</b><input type='text' name='fin' id='fecha2' style='width:230px' onClick="loadFecha(2)" class='form-control'>
				</div>
			</form>
		<br>
			<center><button onClick='onBuscar()' class='btn green'>Buscar</button></center>
		<div id="msj">
		</div>
		<form id='frmGral'>
			<div id='container'>
			{include file="{$DOC_ROOT}/templates/lists/vehiculos.tpl"}
			</div>
		</form>
		
    </div>
</div>