<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
	<thead>
    	<tr>
			<th width="">Municipio</th>	  
			<th width="">Certificacion</th>	 
			<th width="">Grupo</th>		 
			<th width="">Region</th>		 

    </thead>
    <tbody>
    	{foreach from=$result item=item}
    	<tr>
			<td align="center">{$item.municipio}</td>
			<td align="center">{$item.certificacion}</td>
			<td align="center">{$item.grupo}</td>
			<td align="center">{$item.region}</td>
		</tr>
	{/foreach}
		
	</tbody>
</table>