<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
	<thead>
    	<tr>
			<th width="">Municipio</th>	  
			<th width="">Cantidad</th>	 
				 
		 

    </thead>
    <tbody>
    	{foreach from=$result item=item}
    	<tr>
			<td align="center">{$item.municipio}</td>
			<td align="center">{$item.cantidad}</td>


		</tr>
	{/foreach}
		
	</tbody>
</table>