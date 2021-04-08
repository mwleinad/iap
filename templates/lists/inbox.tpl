<table class="table table-sm table-bordered table-hover">
	<thead>
		<tr>
			<th colspan="4">
				<div class="btn-group">
					<button type="button" class="btn btn-info btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="far fa-list-alt"></i> Acciones
					</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="javascript:;" onclick="accionesEliminar()">
							<i class="fas fa-minus-circle"></i> Eliminar Mensajes
						</a>
						<a class="dropdown-item" href="javascript:;" onclick="accionesFavoritos()">
							<i class="fas fa-star"></i> Agregar a Favoritos
						</a>
					</div>
				</div>
			</th>
		</tr>
	</thead>
	<tbody>
		{foreach from=$lstMsj item=subject}
			<tr>
				<td class="pointer">
					<input type="checkbox" name="check_{$subject.chatId}" id="check_{$subject.chatId}" value="{$subject.chatId}">
					{if $subject.favorito eq 'si'}
						<i class="far fa-star"></i>
					{/if}
					<a href="{$WEB_ROOT}/view-inbox/id/{$subject.courseModuleId}/cId/{$subject.chatId}&or={$or}" style="text-decoration:none">
						{if $subject.leido eq 'no' and $tipo eq 'entrada'}
							<b>
						{/if}
						<label style="text-transform:lowercase;" class="text-muted">{$subject.nombre} {$subject.paterno} {$subject.materno}</label>
						{if $subject.leido eq 'no' and $tipo eq 'entrada'}
							</b>
						{/if}
					</a>
				</td>
				<td class="pointer">
					<a href="{$WEB_ROOT}/view-inbox/id/{$subject.courseModuleId}/cId/{$subject.chatId}" style="text-decoration:none">
						<i>
							{if $subject.leido eq 'no' and $tipo eq 'entrada'}
								<label style="text-transform:lowercase;" class="text-info">
							{else}
							<label style="text-transform:lowercase;" class="text-muted">
							{/if}
							{$subject.asunto}</label><br>
							{if $subject.leido eq 'no' and $tipo eq 'entrada'}
								<label style="text-transform:lowercase;" class="text-info">
							{else}
								<label style="text-transform:lowercase;" class="text-muted">
							{/if}
							{$subject.nombreMateria}</label>
						</i>
					</a>
					{if $subject.rutaAdjunto ne ''}
						<i class="fas fa-paperclip"></i>
					{/if}
				</td>
				<td>
					{if $subject.leido eq 'no' and $tipo eq 'entrada'}
						<label style="text-transform:lowercase;" class="text-info">
					{else}
						<label>
					{/if}
					{$subject.fechaEnvio}
					</label>
				</td>
				<td>
					<a href="javascript:void(0)" onClick='deleteInbox("{$subject.chatId}","{$courseMId}")'  title="ELIMINAR INBOX">			
						<i class="far fa-trash-alt"></i>
					</a> 
				</td>
			</tr>
		{foreachelse}
			<tr>
				<td colspan="4" class="text-center">No se encontró ningún registro.</td>
			</tr>
		{/foreach}
   	</tbody>
</table>