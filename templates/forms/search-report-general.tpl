<form name="frmReport" id="frmReport" action="" method="post">
    <input type="hidden" name="accion" value="export" />
	<table width="800px" border="0" cellpadding="0" cellspacing="0" style="border:1px solid #000000; font-size:12px" class="tblGral table table-bordered table-striped table-condensed flip-content">
    <tr>
    	<td colspan="2" bgcolor="#CCCCCC" height="35" align="center"><b>Opciones</b></td>
    </tr>
    <tr>
    	<td height="30" align="left">&nbsp;Modulo:</td>
        <td align="left">
        	<select id="courseId" name="courseId" class="frmSelect" style="width:100%">            
            {foreach from=$courses item=item}
            <option value="{$item.courseId}">{$item.majorName} {$item.name}-{$item.group} Fecha Inicio: {$item.initialDate}</option>
            {/foreach}
            </select>
        </td>
    </tr>
	
	    <tr>
    	<td height="30" align="left">&nbsp;Tipo de Alumnos:</td>
        <td align="left">
        	<select id="modality" name="modality" class="frmSelect" style="width:100%" >
            <option value="0">Todos</option>
            <option value="1">No Escolares</option>
			<option value="2">Escolares</option>
            
            </select>
        </td>
    </tr>
	
	
    <tr>
      <td colspan="2" align="center" height="35">
      	<input type="submit" name="imprimir" value="Exportar" class="btnSearch" />
      </td>
    </tr>
    </table>
</form>