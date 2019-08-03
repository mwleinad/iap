<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
	<thead>
    	<tr>
			<th width=""></th>	 	 
	 
		 
		</tr>
    </thead>
    <tbody>

    	{foreach from=$lstchat item=item}
    	<tr>
			<td align="center">
				{$item.mensaje}
				<br>
				{$item.names}
			</td>
		</tr>
	{/foreach}
		
	</tbody>
</table>

<form id="frmGral">
<input type="hidden" name="type" id="type" >
<textarea class='form-control' name="mensaje"></textarea>
<input type='hidden' value='{$chatId}' name="chatId">
</form>
<center><button type="submit" class="btn {$BUTTON_COLOR} submitForm" onClick='saveMsj()'>Enviar</button></center>