<div class="card mb-4">
    <div class="card-header bg-primary text-white">
		<i class="fas fa-book"></i> Programa de la Asignatura
    </div>
    <div class="card-body text-center">
		{if $myModule.rutaPlan ne ''}
			{if $myModule.rutaPlan ne ''}
				<a type="button" target="_blank" href="{$WEB_ROOT}/materia/{$myModule.rutaPlan}" class="btn btn-info">Visualizar</a>
			{/if}
		{else}
			<div class="alert alert-danger" role="alert">
				<i class="fas fa-exclamation-triangle"></i> No Disponible
			</div>
		{/if}
		<div id="msjErr"></div>
    </div>
</div>