<tr class="text-center">
	<th>Usuario</th>
	{if $cursos=="ESPECIALIDAD" || $cursos=="MAESTRIA"}
		<th>Matrícula</th>
	{/if}
	<th>Nombre</th>
	<th>Equipo</th>
	{section name=foo loop=$totalActividades} 
		<th>Cal. {$smarty.section.foo.iteration}</th> 
	{/section}
	<th>
		Acumulado
	</th>
</tr>