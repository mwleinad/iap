<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
	<thead>
    	<tr>
			<th width=""></th>	  
			<th width="">Municipio</th>	  
			<th width="">Cantidad</th>	 
				 
		 

    </thead>
    <tbody>
    	{foreach from=$result item=item}
    	<tr>
			<td align="center">
				<a href="javascript:void(0)" onClick='ver({$item.municipioId})' title='VALIDAR PAGO'>
				[+]
				</a>
			</td>
			<td align="center">{$item.municipio}</td>
			<td align="center">{$item.cantidad}</td>


		</tr>
		<tr>
			<td id="td_{$item.municipioId}" colspan=3 style="display:none">
			</td>
		</tr>
	{/foreach}
		
	</tbody>
</table>