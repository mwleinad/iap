<div style="font-size:12px" align="center">
<form id="frmFiltro">
<table width="70%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td bgcolor="" align="center" colspan="6"><b><font style="color:#73AD21;">Filtros de B&uacute;squeda</font></b></td>
</tr>
<tr>
	<td align="center">Ap. Paterno</td>
	<td align="center">Ap. Materno</td>
	<td align="center">Nombre</td>
	<td align="center">No. Control</td>

	
</tr>
<tr>
	<td align="center"><input type="text" name="apPaterno" id="apPaterno" style="color:black"/></td>
    <td align="center"><input type="text" name="apMaterno" id="apMaterno" style="color:black"/></td>
    <td align="center"><input type="text" name="nombre" id="nombre" style="color:black"/></td>
    <td align="center"><input type="text" name="noControl" id="noControl" style="color:black"/></td>
    <!--<td> 
		<select id="vista" name="vista" style="width:100px; color:black !important">
						<option value="">Todos </option>
						<option value="1">Alta </option>
						<option value="2">Baja </option>
		</select>
	
	
	</td>-->
	</tr>
<tr>
	<td align="center" colspan="6"></td>
</tr>
</table>
</form>
<button name="submit" value="" onclick="DoSearch()" style="background:#73AD21; color:white" />Buscar</button>
<hr >
</div>




{*}
<table>
<tr> 
<td>
<input type="text" id="buscando"  > 
</td><td>
<input type="submit" name="submit" value="Buscar" onclick="buscar()" class="btnSearch" />
</td>
</tr>
</table>{*}