<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorn"></i>Mensajes
        </div>
        <div class="actions">
			<a  class="btn green" id="" href="{$WEB_ROOT}/graybox.php?page=add-msj" data-target="#ajax" data-toggle="modal" data-width="1000px" title='AGREGAR'>
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
			<button onClick='onBuscar()' class='btn green'>Buscar</button>
		</div>
		<div id="msj">
		</div>
		<div id='container'>
        {include file="{$DOC_ROOT}/templates/lists/msj.tpl"}
		</div>
		
    </div>
</div>