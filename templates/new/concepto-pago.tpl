<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Conceptos de Pagos</b> {$myModule.name|truncate:65:"..."} &raquo;
        </div>
        <div class="actions">

        </div>
    </div>
    <div class="portlet-body">
	<div id ="modal1" >
	</div>
	<br>
	<!--Es necesario descargar e imprimir el formato de reinscripción y llevarlo al área de control escolar para recabar las firmas correspondientes-->

	
	<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content" id ="tabla1" >
		<thead>
			<tr>
				<th width="100">Documento</th>
				<th width="80">Precio</th>
			</tr>
		</thead>
		<tbody>
			{foreach from=$lstSemestres item=subject}
					<tr>
						<td>{$subject.nombre}</td>
						<td>$ {$subject.precio|number_format:2:'.':','}</td>
					</tr>
				
			{/foreach}
		</tbody>
	</table>
	
	
	
    </div>
</div>
