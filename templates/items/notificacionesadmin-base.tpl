{foreach from=$notificaciones item=reply}
   {if $reply.vistaPermiso==1}
		<tr>
			<td class="text-center">{$reply.fecha_aplicacion|date_format:"%d-%m-%Y %H:%M:%S"}</td>
			<td class="text-left">{$reply.actividad}</td>
			<td class="text-center">{$reply.nombre}</td>
			{if $reply.enlace != "NO"}
				<td class="text-center">
					<i class="fas fa-times-circle fa-2x text-danger" data-toggle="tooltip" data-placement="top" title="Eliminar Notificación"  onclick="borrarNot({$reply.notificacionId})"></i>
					<a href="{$WEB_ROOT}{$reply.enlace}">
						<i id="d-{$subject.subjectId}" name="d-{$subject.name}" data-toggle="tooltip" data-placement="top" title="Ver" class="fas fa-arrow-circle-right fa-2x text-success"></i>
					</a>
				</td>
			{else}
				<td align="center">
				<img src="{$WEB_ROOT}/images/cancel.png"  title="Eliminar Notificaci&oacute;n"  onclick="borrarNot({$reply.notificacionId})"/>
				</td>
			{/if}
		</tr>
	{/if}
{foreachelse}
	<tr>
    	<td colspan="12" class="text-center">No se encontró ningún registro.</td>
	</tr>
{/foreach}
