<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Certificaciones
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body">
        <div id="tblContent" class="content-in">
            <table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
				<thead>      
					 <tr>
						<th width="" height="28">Nombre</th>		
						<th width="" height="28">Acciones</th>		
					</tr>
				</thead>
				<tbody>
				{foreach from=$registros item=item key=key}
				
				    <tr>
					<td align="center" class="id">{$item.certificacion}</td>       
					<td align="center" class="id">
					<a href="{$WEB_ROOT}/ajax/acuse.php"   target='_blank' title='ACUSE'>
						<i class="material-icons">how_to_reg</i>
					</a>
					
					<i class="material-icons">school</i>	
						
					<a href="{$WEB_ROOT}/files/solicitudes/{$item.userId}_{$item.courseId}.pdf"   target='_blank' title='FICHA DE REGSITRO'>	
					<i class="material-icons">description</i>
				
					<a href="{$WEB_ROOT}/ajax/ine.php?id={$item.userId}"   target='_blank' title='FICHA DE REGSITRO'>	
					<i class="material-icons">picture_in_picture</i>
					</a>	
					</td>       
					   
					</tr>
					{/foreach}
				</tbody>
			</table>

        </div>
    </div>
</div>


