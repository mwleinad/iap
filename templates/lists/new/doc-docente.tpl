<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
	<thead>
    	<tr>
			<th width=""></th>	 
			<th width="">Documento</th>	 
			<th width="">Descripcion</th>	 
			<th width="">Archivo</th>		 
			<th width=""></th>		 
		</tr>
    </thead>
    <tbody>
    	{foreach from=$registros item=subject}
		<tr>
		   
			<td align="center">
				{if $subject.existArchivo eq 'si'}
						<img src="{$WEB_ROOT}/images/good.png">
				{else}
						<img src="{$WEB_ROOT}/images/bad.png" style="width:19px">
				{/if}
			</td>
			<td align="center">{$subject.nombre}</td>
			<td align="center">{$subject.descripcion}</td>
			<td align="center">

					{if $subject.existArchivo eq 'si'}
						<a  href="{$WEB_ROOT}/docentes/documentos/{$subject.ruta}"  title='DESCARGAR DOCUMENTO' target='_blank'>
						<i class="material-icons md-16">perm_media</i>
						</a>
					{/if}
			
			</td>
			<td align="center">
			
				{if $cId ne 'admin'}
					{if $subject.existArchivo ne 'si'}
						<a  href="{$WEB_ROOT}/graybox.php?page=add-docdocente&id={$subject.catalogodocumentoId}" data-target="#ajax" data-toggle="modal" data-width="1000px" title='SUBIR DOCUMENTO'>
						
						<i class="material-icons md-16">cloud_upload</i>
						</a>
					{else}
						<a  href="javascript:void(0)" onClick='onDelete("{$subject.catalogodocumentoId}","{$personalId}")'  title='ELIMINAR'>
						<i class="material-icons md-16">delete_forever</i>
						</a>
					{/if}					
				{else}
					
					{if $subject.existArchivo ne 'si'}
						<a  href="#"  onClick="loadTR('{$subject.catalogodocumentoId}')" title='SUBIR DOCUMENTO'>
							<i class="material-icons md-16">cloud_upload</i>
							
						</a>
					{else}
						<a  href="javascript:void(0)" onClick='onDeleteDoc("{$subject.catalogodocumentoId}","{$personalId}")'  title='ELIMINAR'>
						<i class="material-icons md-16">delete_forever</i>
						</a>
					{/if}
				{/if}
			</td>
		 </tr>
		 {if $cId eq 'admin'}
		 <tr>
			<td colspan='4' id='tr_{$subject.catalogodocumentoId}' style='display:none'>
			
					<form class="form-horizontal" id="frmDoc_{$subject.catalogodocumentoId}" method="post"  >
					<input type="hidden" id="cId" name="cId" value="admin"/>
					<input type="hidden" id="type" name="type" value="adjuntarDocDocente"/>
					<input type="hidden"  name="personalId" value="{$personalId}"/>
					<input type="hidden" id="solicitudId" name="catId" value="{$subject.catalogodocumentoId}"/>
							   <input type="file" name="comprobante">
					</form>
					<progress id="progress_{$subject.catalogodocumentoId}" value="0" min="0" max="100"></progress>
					<div id="porcentaje_{$subject.catalogodocumentoId}" >0%</div>
					<center><button  class="btn {$BUTTON_COLOR}" id="addMajor" name="addMajor" onClick="enviarArchivo('{$subject.catalogodocumentoId}')">Guardar</button></center>

			</td>
		 </tr>
		 {/if}
		 {/foreach}
	</tbody>
</table>