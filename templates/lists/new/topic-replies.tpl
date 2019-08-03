<script type="text/javascript">
    function confirmando()
    {
        if (confirm("Estas seguro que deseas eliminar la respuesta a este Topico? "))
            return true
        else
            return false
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
.tercero{ overflow: scroll;}
</style>

	<div class="portlet-title">
		<div class="caption"><i class="icon-reorder"></i></div>
		<div class="tools">
			
		</div>
	</div>
	<div class="portlet-body">
	


				<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
					<tr>
					<td></td>
					<td></td>
					</tr>
				{foreach from=$replies item=item key=key}
				
					{if $key%2==0}
						<tr style="background:rgba(239, 239, 239, 0.37)"  >
					{else}
						<tr   >
					{/if}  
					
						<td style='width:115px'>
								
								{$item.foto}
								<br>
								<font style="font-size:9px; color:gray" >
								{if $item.positionId == NULL || $item.positionId == 0}
										{$item.names} {$item.lastNamePaterno} {$item.lastNameMaterno}
									{else}
										{$item.name} {$item.lastname_paterno} {$item.lastname_materno}

									{/if}
									<br>
									&nbsp;Fecha: {$item.replyDate|date_format:"%d-%m-%Y %H:%M"}
									{if $positionId == 1}
										<form id="deleteReplay" name="deleteReplay" method="post">
											<input type="hidden" id="moduleId" name="moduleId" value="{$moduleId}">
											<input type="hidden"  id="replyId" name="replyId" value="{$item.replyId}" />
											<input value="Eliminar" type="submit" class="btn-70-delete"  onClick="return confirmando();" style="border:none; height:24px;" name="eliminar" id="eliminar" >
										</form>
									{/if}
								</font>
						</td>
						<td valign="bottom">
							<font style="font-size:12px; color:#585858" >
								<div  style="width:95%; height:155px;  overflow:scroll" class="showScroll lion">{$item.content}</div>
							</font>
							<div style="clear: both"></div>
							
							
							{if $item.formato eq "imagen"}
								<hr>
									<!--<a href="javascript:void(0)" onClick="Zoom('{$WEB_ROOT}/forofiles/{$item.path}')" title="VER ARCHIVO ADJUNTO">-->
									<a href="{$WEB_ROOT}/graybox.php?page=zoom&id={$WEB_ROOT}/forofiles/{$item.path}" data-target="#ajax" data-toggle="modal" >
									<img src="{$WEB_ROOT}/forofiles/{$item.path}" style="max-width: 200px;height: auto;" title="VER ARCHIVO ADJUNTO">
									</a>	
							{/if}
							<hr>
							<div <!--style="background:rgba(141, 145, 150, 0.22); top:50px"-->
								
								
								<a href="{$WEB_ROOT}/graybox.php?page=add-comment&id={$item.replyId}&moduleId={$moduleId}&topicsubId={$topicsubId}" data-target="#ajax" data-toggle="modal" >
									<img src="{$WEB_ROOT}/images/add.png" style="max-width: 16px;height: auto;" title="AGREGAR COMENTARIO"> 
								</a>
								{if $item.numComentarios <= 0}

									<img src="{$WEB_ROOT}/images/comentarioGris.png" style="max-width: 15px;height: auto;" title="VER COMENTARIOS"> 

								{else}
									<a href="javascript:void(0)" onClick="verComentario({$item.replyId})">
									<img src="{$WEB_ROOT}/images/comentario.png" style="max-width: 16px;height: auto;" title="VER COMENTARIOS"> 
									</a>
								{/if}
								
								{if $item.existeArchivo eq "si"}
									{if $item.path}
										<a href="{$WEB_ROOT}/forofiles/{$item.path}" target="_black" title="VER ARCHIVO ADJUNTO"> 
											<!--<img src="{$WEB_ROOT}/images/blue.jpg" style="max-width: 25px;height: auto;" title="VER ARCHIVO ADJUNTO">-->
											<i class="fa fa-file" aria-hidden="true"></i>
										</a>
										
									{/if}
								{/if}
								
							</div>
						</td>
					</tr>
					<tr id="divCom_{$item.replyId}" style="display:none">
						<td >
							
						</td>
						<td>
							<div class="portlet box " style="border-radius: 2px;   border: 2px solid #f36a5a ">
							<table width=100%>
								{foreach from=$item.replies item=reply key=key2}
								
								{if $key2%2==0}
									<tr style="background:rgba(239, 239, 239, 0.37)"  >
								{else}
									<tr   >
								{/if}  
								
									<td style="width:250px">
										
									
										{$reply.foto}
										<br>

										<font style="font-size:9px; color:gray" >
										{if $reply.positionId == NULL || $reply.positionId == 0}
											{$reply.names}  {$reply.lastNamePaterno} {$reply.lastNameMaterno}
										{else}
											{$reply.names} {$reply.lastname_paterno} {$reply.lastname_materno}
										{/if}
										</font>
								
										<br>
										<font style="font-size:9px; color:gray" >
										{$reply.replyDate|date_format:"%d-%m-%Y %H:%M"}
										</font>
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
											{if $reply.formato eq "imagen"}
												<hr>
													<a href="{$WEB_ROOT}/graybox.php?page=zoom&id={$WEB_ROOT}/forofiles/{$item.path}" data-target="#ajax" data-toggle="modal" >
														<img src="{$WEB_ROOT}/forofiles/{$item.path}" style="max-width: 200px;height: auto;" title="VER ARCHIVO ADJUNTO">
													</a>			
											{/if}
											
											<br>
											<hr>
											<div>
												{if $reply.existeArchivo eq "si"}
													{if $reply.path}
													
													<a href="{$WEB_ROOT}/forofiles/{$reply.path}" target="_black" title="VER ARCHIVO ADJUNTO">
														<!--<img src="{$WEB_ROOT}/images/blue.jpg" style="max-width: 25px;height: auto;" title="VER ARCHIVO ADJUNTO">--> 
														<i class="fa fa-file" aria-hidden="true"></i>
													</a>
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


{*}
{foreach from=$replies item=item}
<div class="portlet box {$PORTLET_COLOR}">
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
                <form id="deleteReplay" name="deleteReplay" method="post">
                    <input type="hidden" id="moduleId" name="moduleId" value="{$moduleId}">
                    <input type="hidden"  id="replyId" name="replyId" value="{$item.replyId}" />
                    <input value="Eliminar" type="submit" class="btn-70-delete"  onClick="return confirmando();" style="border:none; height:24px;" name="eliminar" id="eliminar" >
                </form>
            {/if}
            <a href="{$WEB_ROOT}/graybox.php?page=add-comment&id={$item.replyId}&moduleId={$moduleId}&topicsubId={$topicsubId}" data-target="#ajax" data-toggle="modal" class="btn {$BUTTON_COLOR}">
                Agregar Comentario
            </a>
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
