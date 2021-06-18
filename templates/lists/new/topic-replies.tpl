<script type="text/javascript">
    function confirmando()
    {
        if (confirm("Estas seguro que deseas eliminar la respuesta a este Topico? "))
            return true;
        else
            return false;
    }
</script>
<style type="text/css">
	.primero, .segundo, .tercero {
		/*atributos en común en los 3 divs. Toma el valor overflow por defecto.*/
		display: inline;
		float: left;
		margin: 1em;
		padding: .3em;
		border: 0px solid #555;
		width: 95%;
		height: 150px;
		font: 1em Arial, Helvetica, sans-serif;
	}
	.tercero{ overflow: scroll; }
</style>

<div class="card">
    <div class="card-body">
        <div class="table-responsive">
			<table class="table table-bordered table-striped table-sm">
				<tr><td colspan="2"></td></tr>
				{foreach from=$replies item=item key=key}
					<tr {if $key%2==0}style="background:rgba(239, 239, 239, 0.37)"{/if}>
						<td style="width:115px" class="text-center">
							{$item.foto}
							<br>
							<small class="font-weight-bold">
								{if $item.positionId == NULL || $item.positionId == 0}
									{$item.names} {$item.lastNamePaterno} {$item.lastNameMaterno}
								{else}
									{$item.name} {$item.lastname_paterno} {$item.lastname_materno}
								{/if}
								<br>
								Fecha: {$item.replyDate|date_format:"%d-%m-%Y %H:%M"}
							</small>
							{if $positionId == 1}
								<form id="deleteReplay" name="deleteReplay" method="post">
									<input type="hidden" id="moduleId" name="moduleId" value="{$moduleId}">
									<input type="hidden"  id="replyId" name="replyId" value="{$item.replyId}" />
									<input value="Eliminar" type="submit" class="btn-70-delete btn btn-danger btn-xs mt-2"  onClick="return confirmando();" style="border:none; height:24px;" name="eliminar" id="eliminar" >
								</form>
							{/if}
						</td>
						<td valign="bottom">
							<font style="font-size:12px; color:#585858" >
								<div  style="width:95%; height:155px;  overflow:scroll" class="showScroll lion">{$item.content}</div>
							</font>
							<div style="clear: both"></div>
							{if $item.formato eq "imagen"}
								<hr>
								<a href="{$WEB_ROOT}/graybox.php?page=zoom&id={$WEB_ROOT}/forofiles/{$item.path}" data-target="#ajax" data-toggle="modal" >
									<img src="{$WEB_ROOT}/forofiles/{$item.path}" style="max-width: 200px;height: auto;" title="Ver Archivo Adjunto">
								</a>	
							{/if}
							<hr>
							<div>
								<a href="{$WEB_ROOT}/graybox.php?page=add-comment&id={$item.replyId}&moduleId={$moduleId}&topicsubId={$topicsubId}" data-target="#ajax" data-toggle="modal" title="Agregar Comentario" class="text-primary">
									<i class="fas fa-comment-medical fa-2x pointer"></i>
								</a>
								{if $item.numComentarios <= 0}
									<i class="far fa-comments fa-2x" title="Ver Comentarios"></i>
								{else}
									<a href="javascript:void(0)" onClick="verComentario({$item.replyId})" title="Ver Comentarios" class="text-info">
										<i class="far fa-comments fa-2x pointer"></i>
									</a>
								{/if}
								{if $item.existeArchivo eq "si"}
									{if $item.path}
										<a href="{$WEB_ROOT}/forofiles/{$item.path}" target="_black" title="VER ARCHIVO ADJUNTO">
											<i class="fa fa-file" aria-hidden="true"></i>
										</a>
									{/if}
								{/if}
							</div>
						</td>
					</tr>
					<tr id="divCom_{$item.replyId}" style="display:none">
						<td></td>
						<td>
							<div class="table-responsive">
								<table class="table">
									{foreach from=$item.replies item=reply key=key2}
										<tr {if $key2%2==0}style="background:rgba(239, 239, 239, 0.37)"{/if}>
											<td style="width:100px" class="text-center">
												{$reply.foto}
												<br>
												<small class="font-weight-bold">
												{if $reply.positionId == NULL || $reply.positionId == 0}
													{$reply.names}  {$reply.lastNamePaterno} {$reply.lastNameMaterno}
												{else}
													{$reply.names} {$reply.lastname_paterno} {$reply.lastname_materno}
												{/if}<br>
												{$reply.replyDate|date_format:"%d-%m-%Y %H:%M"}</small>
												{if $positionId == 1}
													<form id="deleteReplay" name="deleteReplay" method="post">
														<input type="hidden" id="moduleId" name="moduleId" value="{$moduleId}">
														<input type="hidden"  id="replyId" name="replyId" value="{$reply.replyId}" />
														<input value="Eliminar" type="submit" class="btn-70-delete btn btn-danger btn-xs mt-2"  onClick="return confirmando();" style="border:none; height:24px;" name="eliminar" id="eliminar" >
													</form>
												{/if}
											</td>
											<td>
												<div>{$reply.content}</div><br><hr>
												<div>
													{if $reply.existeArchivo eq "si"}
														{if $reply.formato eq "imagen"}
															<hr>
															<a href="{$WEB_ROOT}/forofiles/{$reply.path}" data-fancybox="{$reply.path}">
																<img src="{$WEB_ROOT}/forofiles/{$reply.path}" style="max-width: 200px;height: auto;" title="Ver Archivo Adjunto">
															</a>
														{else}
															{if $reply.path}
																<a href="{$WEB_ROOT}/forofiles/{$reply.path}" target="_blank" title="Ver Archivo Adjunto"> 
																	<i class="far fa-file-alt fa-2x"></i> Ver Archivo
																</a>
															{/if}			
														{/if}
													{/if}
												</div>
											</td>
										</tr>
									{/foreach}
								</table>
							</div>
						</td>
					</tr>
				{/foreach}
			</table>
        </div>
    </div>
</div>