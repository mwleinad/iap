<span class="badge badge-dark my-3">Actividades</span><br>
<table class="table table-bordered table-striped table-sm table-hover">
	<thead>      
		<tr>
			{if $tipo==1}<th>Actividad</th>{else}<th>Examen</th>{/if}
			<th>Calificación</th>
			<th>Puntos</th>
			<th>Retroalimentación</th>
		</tr>
	</thead>
	<tbody>
		{foreach from=$tareas item=home key=key}
			<tr>
				<td>{$home.resumen}</td>
				<td>{$home.ponderation}</td>
				<td>{$home.ponderation*($home.score/100)}</td>
				<td>
					{$home.retro}
					{if $home.retroFile ne ""}
						<b>Archivo Adjunto:</b>
						<a href="{$WEB_ROOT}/file_retro/{$home.retroFile}" target="_blank">Descargar</a>
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
			{if $tipo==1}<th>Actividad</th>{else}<th>Examen</th>{/if}
			<th>Calificación</th>
			<th>Puntos</th>
			<th>Retroalimentación</th>
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