<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>
			{if $descargaAchivo eq 'si'}
				Descargar Formato de Reinscripción
			{else}
				Tramite de Reinscripción
			{/if}
        </div>
		
    </div>
    <div class="portlet-body">
	{if $descargaAchivo eq 'si'}
	
	<li><b>Modalidad Presencial: Es necesario que descargue e imprima el formato de re-inscripción que se generó y que también puede encontrar en el
	menú principal y llevarlo al área de Control Escolar del IAP-Chiapas para recabar las firmas correspondientes. </b>
	<br>
	<br>
	<li><b>Modalidad en Línea: NO es necesario imprimir este formato</b>
		<center>
			<a href="javascript:void(0)" onClick='descargaFormato({$courseId},{$sId})' >
			<img src="{$WEB_ROOT}/images/pdficon.png" style="width:70px; height:70px"> 
			</a>
		</center>
	{else}
		Favor de corroborar que sus datos sean correctos
        <div id="tblContent">{include file="boxes/edit-student-popup-alumn.tpl"}</div>
	{/if}
		
    </div>
</div>