<tr class="text-center">
    <th>ID</th>
    <th>No. Control</th>
    <th>Nombre</th>
	{foreach from=$addedModules item=modules} 
		<th>{$modules.clave}</th> 
	{/foreach}
    <th>Cal. Final</th>
    <th>Acciones</th>
</tr>