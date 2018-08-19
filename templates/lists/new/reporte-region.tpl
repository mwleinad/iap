<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
	<thead>
    	<tr>
			<th width="">Municipio</th>	 
			<th width="">Nombre</th>	 
			<th width="">Certificacion</th>	 
			<th width="">Correo</th>		 
			<th width="">Telefono</th>		 
	 
	 
		 
		</tr>
    </thead>
    <tbody>
    	{foreach from=$result item=item}
    	<tr>
			<td align="center">{$item.municipio}</td>
			<td align="center">{$item.names} {$item.lastNamePaterno} {$item.lastNameMaterno}</td>
			<td align="center">{$item.certificacion}</td>
			<td align="center">{$item.email}</td>
			<td align="center">{$item.phone}</td>
		</tr>
	{/foreach}
		
	</tbody>
</table>