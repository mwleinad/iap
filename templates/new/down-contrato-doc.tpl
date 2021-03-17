<div class="card mb-4">
    <div class="card-header bg-primary text-white">
		<i class="far fa-file-pdf"></i> Contratos
    </div>
    <div class="card-body text-center">
		{if $myModule.rutaContrato ne ''}
			{if $myModule.rutaContrato ne ''}
				<p>Favor de imprimir el presente contrato, en 2 tantos, en ambas caras de la hoja, con su rúbrica y firma al final.</p>
				<a type="button" target="_blank" href="{$WEB_ROOT}/docentes/contrato/{$myModule.rutaContrato}""  class="btn default blue">
					Visualizar
				</a>
			{/if}
		{else}
			<div class="alert alert-danger" role="alert">
				<i class="fas fa-exclamation-triangle"></i> No Disponible
			</div>
		{/if}
		<div id="msjErr"></div>
    </div>
</div>