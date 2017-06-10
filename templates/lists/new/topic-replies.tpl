<script type="text/javascript">
    function confirmando()
    {

        if (confirm("Estas seguro que deseas eliminar la respuesta a este Topico? "))
            return true
        else
            return false
    }
</script>


	<div class="portlet-title">
		<div class="caption"><i class="icon-reorder"></i></div>
		<div class="tools">
			
		</div>
	</div>
	<div class="portlet-body">
		<div class="accordion" id="accordion1">
				Aportaciones:
				{foreach from=$replies item=item key=key}
					<div class="accordion-group">
						<div class="accordion-heading" >
							
							<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion1" href="#collapse_{$key+1}" style="color:#73b760">
							<i class="icon-angle-left"></i>
									<i class="fa fa-bullhorm"></i> 
									> 
									{if $item.positionId == NULL || $item.positionId == 0}
										{if $item.names}{$item.names} {$item.lastNamePaterno} {$item.lastNameMaterno}{else}{/if}
									{else}
										{$item.name} {$item.lastname_paterno} {$item.lastname_materno}
									{/if}
									&nbsp;Fecha: {$item.replyDate|date_format:"%d-%m-%Y %H:%M"}
									{if $positionId == 1}

										<form id="deleteReplay" name="deleteReplay" method="post">
											<input type="hidden" id="moduleId" name="moduleId" value="{$moduleId}">
											<input type="hidden"  id="replyId" name="replyId" value="{$item.replyId}" />
											<input value="Eliminar" type="submit" class="btn-70-delete"  onClick="return confirmando();" style="border:none; height:24px;" name="eliminar" id="eliminar" >
										</form>
									{/if}
							</a>
						</div>
					
					<div id="collapse_{$key+1}" class="accordion-body collapse">
						<div class="accordion-inner">
							<br>
							<br>
							<a href="{$WEB_ROOT}/graybox.php?page=add-comment&id={$item.replyId}&moduleId={$moduleId}&topicsubId={$topicsubId}" data-target="#ajax" data-toggle="modal" class="btn green">
										Agregar Comentario
									</a>
									<br>
									<br>
							<div>{$item.content}</div>
							<div>{if $item.path}<img src="{$WEB_ROOT}/forofiles/{$item.path}" > {/if}</div>
							<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
								<thead>
								<tr>
									<td>
										Autor / Fecha Publicación
									</td>
									<td>
										Mensaje
									</td>
									<td>
										
									</td>
								</tr>
								</thead>
							{foreach from=$item.replies item=reply}
								<tr>
									<td>
										<i class="fa fa-bullhorm"></i>
										<b>
										<font style="text-transform: uppercase; font-size:12px; color:gray" >
										{if $reply.positionId == NULL || $reply.positionId == 0}
											{if $reply.names}{$reply.names}  {$reply.lastNamePaterno} {$reply.lastNameMaterno}{else}{/if}
										{else}
											{$reply.names} {$reply.lastname_paterno} {$reply.lastname_materno}
										{/if}
										</font>
										</b>
										<br>{$reply.replyDate|date_format:"%d-%m-%Y %H:%M"}
										{if $positionId == 1}

											<form id="deleteReplay" name="deleteReplay" method="post">
												<input type="hidden" id="moduleId" name="moduleId" value="{$moduleId}">
												<input type="hidden"  id="replyId" name="replyId" value="{$reply.replyId}" />
												<input value="Eliminar" type="submit" class="btn-70-delete"  onClick="return confirmando();" style="border:none; height:24px;" name="eliminar" id="eliminar" >
											</form>
										{/if}
									</td>
									<td>
										<div>{$reply.content}</div>
									</td>
									<td>
										<div>{if $reply.path}<img src="{$WEB_ROOT}/forofiles/{$reply.path}" > {/if}</div>
									</td>
								</tr>
						<!--	<div class="portlet box grey-steel">
								<div class="portlet-title">
									<div class="caption">
										
									</div>
									<div class="actions">
										
									</div>
								</div>
								<div class="portlet-body">
									<b>
										
								</div>
							 </div>-->
							{/foreach}
							</table>
						</div>
					</div>
					</div>
				{/foreach}
			

		</div>
	</div>


{*}

{foreach from=$replies item=item}
<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i> Aportación de:
            {if $item.positionId == NULL || $item.positionId == 0}
                {if $item.names}{$item.names} {$item.lastNamePaterno} {$item.lastNameMaterno}{else}{/if}
            {else}
                {$item.name} {$item.lastname_paterno} {$item.lastname_materno}
            {/if}
            &nbsp;Fecha: {$item.replyDate|date_format:"%d-%m-%Y %H:%M"}
        </div>
        <div class="actions">
            {if $positionId == 1}
				<a href="{$WEB_ROOT}/graybox.php?page=add-comment&id={$item.replyId}&moduleId={$moduleId}&topicsubId={$topicsubId}" data-target="#ajax" data-toggle="modal" class="btn green">
					Agregar Comentario
				</a>
                <form id="deleteReplay" name="deleteReplay" method="post">
                    <input type="hidden" id="moduleId" name="moduleId" value="{$moduleId}">
                    <input type="hidden"  id="replyId" name="replyId" value="{$item.replyId}" />
                    <input value="Eliminar" type="submit" class="btn-70-delete"  onClick="return confirmando();" style="border:none; height:24px;" name="eliminar" id="eliminar" >
                </form>
            {/if}
            

        </div>
    </div>
    <div class="portlet-body">
            <div>{$item.content}</div>
            <div>{if $item.path}<img src="{$WEB_ROOT}/forofiles/{$item.path}" > {/if}</div>

            {foreach from=$item.replies item=reply}
            <div class="portlet box grey-steel">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-bullhorm"></i> Comentario de:
                        {if $reply.positionId == NULL || $reply.positionId == 0}
                            {if $reply.names}{$reply.names}  {$reply.lastNamePaterno} {$reply.lastNameMaterno}{else}{/if}
                        {else}
                            {$reply.names} {$reply.lastname_paterno} {$reply.lastname_materno}
                        {/if}
                        &nbsp;Fecha: {$reply.replyDate|date_format:"%d-%m-%Y %H:%M"}
                    </div>
                    <div class="actions">
                        {if $positionId == 1}

                            <form id="deleteReplay" name="deleteReplay" method="post">
                                <input type="hidden" id="moduleId" name="moduleId" value="{$moduleId}">
                                <input type="hidden"  id="replyId" name="replyId" value="{$reply.replyId}" />
                                <input value="Eliminar" type="submit" class="btn-70-delete"  onClick="return confirmando();" style="border:none; height:24px;" name="eliminar" id="eliminar" >
                            </form>
                        {/if}
                    </div>
                </div>
                <div class="portlet-body">
                    <b>
                        <div>{$reply.content}</div>
                        <div>{if $reply.path}<img src="{$WEB_ROOT}/forofiles/{$reply.path}" > {/if}</div>
                </div>
             </div>
            {/foreach}
    </div>
</div>
{/foreach}

	{*}