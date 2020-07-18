<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
	<thead>
    	<tr>
			 
			<th width="">Nombre</th>	  
			<th width="">Certificacion</th>	 
			<th width="">Puesto</th>	 
				 
		 

    </thead>
    <tbody>
    	{foreach from=$result item=item}
    	<tr>

			<td align="center">{$item.names} {$item.lastNamePaterno} {$item.lastNameMaterno} </td>
			<td align="center">{$item.name}</td>
			<td align="center">{$item.workplacePosition}</td>


		</tr>

	{/foreach}
		
	</tbody>
</table>