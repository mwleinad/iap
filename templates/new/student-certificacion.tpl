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
						<th width="" height="28">Municipio</th>		
						<th width="" height="28">Evaluador</th>		
						<th width="" height="28">Acciones</th>		
					</tr>
				</thead>
				<tbody>
				{foreach from=$registros item=item key=key}
				
				    <tr>
					<td align="center" class="id">{$item.certificacion}</td>       
					<td align="center" class="id">{$item.group}</td>            
					<td align="center" class="id">{$item.municipio}</td>       
					<td align="center" class="id">{$item.suEvaluador.name} {$item.suEvaluador.lastname_paterno} {$item.suEvaluador.lastname_materno}</td>       
					<td align="center" class="id">

					
					<a href="javascript:void(0)" onClick="verForm({$item.userId},{$item.subjectId},1)" title="AGREGAR PLAN">
					<i class="material-icons">
					calendar_today
					</i>	
					</a>
					
					<a href="javascript:void(0)" onClick="verForm({$item.userId},{$item.subjectId},2)" title="AGREGAR IEC">
					<i class="material-icons">
					chrome_reader_mode
					</i>	
					</a>
					
					<a href="javascript:void(0)" onClick="verForm({$item.userId},{$item.subjectId},3)" title="AGREGAR CEDULA">
					<i class="material-icons">
					aspect_ratio
					</i>	
					</a>
					
					<a href="javascript:void(0)" onClick="verForm({$item.userId},{$item.subjectId},4)" title="AGREGAR PRODUCTOS">
					<i class="material-icons">
					description
					</i>	
					</a>
					<a href="javascript:void(0)" onClick="verFormEva({$item.userId},{$item.subjectId},4)"  title="EVALUAR">
								<i class="material-icons">
						school
						</i>
					</a>

					</td>       
					</tr>
					<tr>
						<td colspan="5" style="display:none" id="r_{$item.subjectId}">
						
						</td>
					</tr>
					{/foreach}
				</tbody>
			</table>

        </div>
    </div>
</div>


