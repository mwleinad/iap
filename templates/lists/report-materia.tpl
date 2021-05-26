<table class="table table-bordered table-striped table-sm">
	<thead>
		<tr class="text-center">
			<th>Nombre</th>
			<th>Licenciatura</th>
			<th>Maestria</th>
			<th>Doctorado</th>
		</tr>
    </thead>
    <tbody>
		{foreach from=$personals item=subject}
			<tr>
				<td style="font-size: 8pt !important;">
					{$subject.lastname_paterno} {$subject.lastname_materno} {$subject.name}
				</td>
				<td style="font-size: 8pt !important;">
					{$subject.basica.estudios.0.carrera}|{$subject.basica.estudios.0.escuela}<br>
					<ul style="font-size: 8pt !important;">
						{if $subject.basica.estudios.0.titulo eq 'si'} <li>Titulo</li> {/if}
						{if $subject.basica.estudios.0.actaExamen eq 'si'} <li>Acta de Examen</li> {/if}
						{if $subject.basica.estudios.0.cedula eq 'si'}  <li>Cedula</li> {/if}
					</ul>
				</td>
				<td style="font-size: 8pt !important;">
					{$subject.basica.estudios.1.carrera}|{$subject.basica.estudios.1.escuela}</<br>
					<ul style="font-size: 8pt !important;">
						{if $subject.basica.estudios.1.titulo eq 'si'} <li>Titulo</li> {/if}
						{if $subject.basica.estudios.1.actaExamen eq 'si'} <li>Acta de Examen</li> {/if}
						{if $subject.basica.estudios.1.cedula eq 'si'} <li>Cedula</li> {/if}
					</ul>
				</td>
				<td style="font-size: 8pt !important;">
					{$subject.basica.estudios.2.carrera}|{$subject.basica.estudios.1.escuela}<br>
					<ul style="font-size: 8pt !important;">
						{if $subject.basica.estudios.2.titulo eq 'si'} <li>Titulo</li> {/if}
						{if $subject.basica.estudios.2.actaExamen eq 'si'} <li>Acta de Examen</li> {/if}
						{if $subject.basica.estudios.2.cedula eq 'si'} <li>Cedula</li> {/if}
					</ul>
				</td>
			</tr>
		{/foreach}
	</tbody>
</table>