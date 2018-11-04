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
						<th width="" height="28">Grupo</th>		
						<th width="" height="28">Numero</th>		
						<th width="" height="28">Municipio</th>		
						<th width="" height="28">Acciones</th>		
					</tr>
				</thead>
				<tbody>
				{foreach from=$registros item=item key=key}
				
				    <tr>
					<td align="center" class="id">{$item.certificacion}</td>       
					<td align="center" class="id">{$item.group}</td>       
					<td align="center" class="id">{$item.numero}</td>       
					<td align="center" class="id">{$item.municipio}</td>       
					<td align="center" class="id">
					<a href="{$WEB_ROOT}/ajax/acuse.php?id={$item.userId}&courseId={$item.courseId}"   target='_blank' title='ACUSE'>
						<i class="material-icons">how_to_reg</i>
					</a>
					<a href="{$WEB_ROOT}/ajax/dg.php?id={$item.userId}&cId={$item.activityId}"   target='_blank' title='EVALUACION'>
					<i class="material-icons">school</i>	
					</a>	
					<!--<a href="{$WEB_ROOT}/files/solicitudes/{$item.userId}_{$item.courseId}.pdf"   target='_blank' title='REGISTRO'>	-->
					<a href="{$WEB_ROOT}/ajax/reg.php?id={$item.userId}&courseId={$item.courseId}"   target='_blank' title='REGISTRO'>
					<i class="material-icons">description</i>
				
					<a href="{$WEB_ROOT}/ajax/ine.php?id={$item.userId}"   target='_blank' title='INE'>	
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


