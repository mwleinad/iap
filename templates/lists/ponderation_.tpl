<span class="badge badge-dark my-3">Actividades</span><br>
<table class="table table-bordered table-striped table-sm table-hover">
	<thead>      
		<tr>
			{if $tipo==1}<th class="font-weight-bold">Actividad</th>{else}<th class="font-weight-bold">Examen</th>{/if}
			<th class="font-weight-bold">Calificación</th>
			<th class="font-weight-bold">Puntos</th>
			<th class="font-weight-bold">Retroalimentación</th>
		</tr>
	</thead>
	<tbody>
		{foreach from=$tareas item=home key=key}
			<tr>
				<td>{$home.resumen}</td>
				<td>{$home.ponderation}</td>
				<td>{$home.ponderation*($home.score/100)}</td>
				<td>
					<div class="break-line">{$home.retro}</div>
					{if $home.retroFile ne ""}
						<div class="mt-2">
							<a href="{$WEB_ROOT}/file_retro/{$home.retroFile}" target="_blank" class="btn btn-info btn-xs">
								<i class="fas fa-download"></i> Descargar Archivo Adjunto
							</a>
						</div>
					{/if}
				</td>
			</tr>
		{foreachelse}
			<tr>
				<td colspan="4" class="text-center">No se encontró ningún registro.</td>
			</tr>				
		{/foreach}
	</tbody>
</table>

<span class="badge badge-dark my-3">Examen</span>
<table class="table table-bordered table-striped table-sm table-hover">
	<thead>
		<tr>
			{if $tipo==1}<th class="font-weight-bold">Actividad</th>{else}<th class="font-weight-bold">Examen</th>{/if}
			<th class="font-weight-bold">Calificación</th>
			<th class="font-weight-bold">Puntos</th>
			<th class="font-weight-bold">Retroalimentación</th>
		</tr>
	</thead>
	<tbody>
		{foreach from=$examen item=home key=key}
			<tr>
				<td>{$home.resumen} </td>
				<td>{$home.ponderation}</td>
				<td>{$home.ponderation*($home.score/100)}</td>
				<td>{$home.retro}</td>
			</tr>
		{foreachelse}
			<tr>
				<td colspan="4" class="text-center">No se encontró ningún registro.</td>
			</tr>				
		{/foreach}
	</tbody>
</table>