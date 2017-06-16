<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
    <thead>
	<tr>
	<th width="30" height="28">ID</th>
    <th width="100">Clave</th>
    <th width="100">Cuat.</th>
    <th width="200">Nombre</th>
    <th width="100">Fecha Inicio</th>
    <th width="100">Fecha Fin</th>
    <th width="100">Grupo</th>
    <th width="100">Modalidad</th>
    <th width="80">Activo</th>
    {if $User.type == "student"}
	    <th width="80">Cal.</th>
    {/if}
  	<th width="60">Ingresar</th>
</tr>
    </thead>
    <tbody>
    {foreach from=$subjects item=subject}
    <tr>
        <td align="center" class="id">{$subject.courseModuleId}</td>
        <td align="center">{$subject.clave}</td>
        <td align="center">{$subject.semesterId}</td>
        <td align="left">{$subject.name}</td>
        <td align="left">{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
        <td align="left">{$subject.finalDate|date_format:"%d-%m-%Y"}</td>
        <td align="left">{$subject.grupo}</td>
        <td align="left">{$subject.modalidad}</td>
        <td align="left">{$subject.active}</td>
        
				
        <td align="center">
			<input type="checkbox">
        </td>
		
   
		
    </tr>
	<tr>
		<td id="td_{$subject.courseModuleId}" colspan="10" style="display:none">
			
		</td>
	</tr>
{foreachelse}
	<tr>
    	<td colspan="12" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
	</tr>
{/foreach}


    </tbody>
</table>