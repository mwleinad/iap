<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
	<thead>
    	<tr>
			<th width="">Municipio</th>	 
			<th width="">Nombre</th>	 
			<th width="">Certificacion</th>	 
			<th width="">Correo</th>		 
			<th width="">Telefono</th>
			<th width="">CURP</th>
			<th width="">CP</th>
			<th width="">Calle/Número/Colonia</th>
			<th width="">Estudios</th>
			<th width="">Grupo</th>		 
			<th width="">Region</th>		 

    </thead>
    <tbody>
    	{foreach from=$result item=item}
    	<tr>
			<td align="center">{$item.municipio}</td>
			<td align="center">{$item.names} {$item.lastNamePaterno} {$item.lastNameMaterno}</td>
			<td align="center">{$item.certificacion}</td>
			<td align="center">{$item.email}</td>
			<td align="center">{$item.phone}</td>
			<td align="center">{$item.curp}</td>
			<td align="center">{$item.postalCode}</td>
			<td align="center">{$item.street}/{$item.number}/{$item.colony}</td>
			<td align="center">{$item.academicDegree}</td>
			<td align="center">{$item.grupo}</td>
			<td align="center">{$item.region}</td>
		</tr>
	{/foreach}
		
	</tbody>
</table>