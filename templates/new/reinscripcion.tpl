<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-user-plus"></i>
		{if $descargaAchivo eq 'si'} Descargar Formato de Reinscripción {else} Tramite de Reinscripción {/if}
    </div>
    <div class="card-body">
		{if $descargaAchivo eq 'si'}
			<ul>
				<li>Modalidad Presencial: Es necesario que descargue e imprima el formato de re-inscripción que se generó y que también puede encontrar en el menú principal y llevarlo al área de Control Escolar del IAP-Chiapas para recabar las firmas correspondientes.</li>
				<li>Modalidad en Línea: NO es necesario imprimir este formato</li>
			</ul>
			<div class="col-md-12">
				<a href="javascript:void(0)" onClick="descargaFormato({$courseId},{$sId})" class="btn btn-info btn-xs">
					<i class="fas fa-file-pdf"></i> Descargar
				</a>
			</div>
			{else}
				<p class="text-primary">Favor de corroborar que sus datos sean correctos.</p>
				<div id="tblContent">{include file="boxes/edit-student-popup-alumn.tpl"}</div>
			{/if}
    </div>
</div>