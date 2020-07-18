
<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
<thead>      
<tr>


    <th width="">Usuario</th>
    <th width="">Tipo</th>
    <th width="">Fecha Hora</th>
   
</tr>
</thead>
<tbody>
{foreach from=$registros.result item=item key=key}
        <tr>
		<td align="center">{if $item.alumno} {$item.alumno} {else} {$item.personal}  {/if}</td>
		<td align="center">{$item.tipo}</td>
		<td align="center">{$item.fecha}</td>
        </td>       
    </tr>
{foreachelse}
	<tr>
    	<td colspan="11" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
    </tr>				
{/foreach}

</tbody>
</table>
{include file="{$DOC_ROOT}/templates/lists/pages_ok.tpl" pages=$registros.pages info=$registros.info}