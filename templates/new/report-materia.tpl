<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorn"></i>Reporte Materias
        </div>
        <div class="actions">
			<a  class="btn {$BUTTON_COLOR}" id="" href="#"  onClick="onImprimir()" title='AGREGAR'>
				<i class="fa fa-plus"></i> Imprimir
			</a>
        </div>
    </div>
    <div class="portlet-body">
	
		
		<form id="frmGral">
			<div style='display:-webkit-inline-box'>
				<b>Posgrado</b>
				<select type='text' name='posgrado' id='posgrado' class='form-control' style='width:230px' onChange='onMaterias()' >
					<option></option>
					{foreach from=$lstPosgrados item=subject}
					<option value="{$subject.subjectId}">{$subject.name}</option>
					{/foreach}
				</select>		
				<b>Materia</b>
				<div id="divMateria" >
					<select type='text' name='materia' class='form-control' style='width:230px'  >
					</select>	
				</div>	
				
			</div>
		</form>
		<center>
		<button onClick='onBuscar()' class='btn {$BUTTON_COLOR}'>Buscar</button>
		</center>
		<div id="msj">
		</div>
		<div id='container'>
        {include file="{$DOC_ROOT}/templates/lists/report-materia.tpl"}
		</div>
		
    </div>
</div>