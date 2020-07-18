
<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
<thead>      

<tr>
    <th width="30" height="28">ID</th>
    <th width="100" style="text-align:center">Tipo</th>
    <th width="200" style="text-align:center">Nombre</th>
    <th width="200" style="text-align:center">Grupo</th>
    <th width="80" style="text-align:center">Fecha Inicial</th>
    <th width="80" style="text-align:center">Fecha Final</th>
   <!-- <th width="50" style="text-align:center">Dias Activo</th>-->
    <!--<th width="100 " style="text-align:center">Modulos (A/T)</th>-->
    <!--<th width="60" style="text-align:center">Alumnos (A/I)</th>-->
    <th width="50" style="text-align:center">Activo</th>
    {if !$docente}
        <th width="100">Acciones</th>
    {/if}
</tr>
</thead>
<tbody>
<input type="hidden" value="0" id="recarga" name="recarga">
{foreach from=$resultC item=subject}
    <tr>
        <td align="center" class="id">{$subject.courseId}</td>
        <td align="center">{$subject.majorName}</td>
        <td align="center">{$subject.name}</td>
		 <td align="center">{$subject.group}</td>
        <td align="center">{if $subject.initialDate != "0000-00-00"} {$subject.initialDate|date_format:"%d-%m-%Y"}{else} S/F {/if}</td>
        <td align="center">{if $subject.finalDate != "0000-00-00"}  {$subject.finalDate|date_format:"%d-%m-%Y"}  {else} S/F  {/if}   </td>
       
        <td align="center">{$subject.active}</td>
        {if !$docente}
            <td align="center">
				<a href="{$WEB_ROOT}/graybox.php?page=add-grupos&id={$subject.courseId}" data-target="#ajax" data-toggle="modal">
							<i class="material-icons md-16">create</i>
							
						</a>
				
		
				<div id="divAccion_{$subject.courseId}" >
					{*TODO este boton no funciona de cualquier manera asi que lo quite por lo pronto
					<img src="{$WEB_ROOT}/images/icons/16/delete.png" class="spanDelete" data-id="{$subject.courseId}" id="d-{$subject.courseId}" name="d-{$subject.name}" title="Eliminar" />&nbsp;
					*}
					{*TODO creo que seria mejor abrir un modal ancho*}
					{*TODO falta la parte de generar certificado*}
				</div>	
            </td>
        {/if}
    </tr>
    {foreachelse}
    <tr>
        <td colspan="12" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
    </tr>
{/foreach}

</tbody>
</table>
{include file="{$DOC_ROOT}/templates/lists/pages_ok.tpl" pages=$registros.pages info=$registros.info}