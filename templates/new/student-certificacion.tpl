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
			<form id="frmGralEval">
			<input type="hidden" name="id" value="{$id}">
            <table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
				<thead>      
					 <tr>
						<th width="" height="28">Nombre</th>		
						<th width="" height="28">Grupo</th>			
						<th width="" height="28">Municipio</th>	
						{if $cId ne 'usuarios-admin'}						
						<th width="" height="28">Evaluador</th>	
								
						<th width="" height="28">Acciones</th>
						{else}
						<th width="" height="28">Evaluador</th>
						{/if}
					</tr>
				</thead>
				<tbody>
				{foreach from=$registros item=item key=key}
				
				    <tr>
					<td align="center" class="id">{$item.certificacion}</td>       
					<td align="center" class="id">{$item.group}</td>            
					<td align="center" class="id">{$item.municipio}</td>   
					{if $cId ne 'usuarios-admin'}						
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
					
					<a href="{$WEB_ROOT}/ajax/download.php"  target="_blank" title="DESCARGAR">
								<i class="material-icons">
						school
						</i>
					</a>

					</td>
					{else}
						<td>
						<select name="evaluador_{$item.subjectId}" class="form-control">
							<option></option>
							{foreach from=$item.evaluadores item=item2 key=key}
							<option value="{$item2.personalId}" {if $item2.personalId eq $item.suEvaluador.personalId} selected{/if}>{$item2.name} {$item2.lastname_paterno} {$item2.lastname_materno} </option>
							{/foreach}
						</select>
						</td>
							
					{/if}					
					</tr>
					<tr>
						<td colspan="5" style="display:none" id="r_{$item.subjectId}">
						
						</td>
					</tr>
					{/foreach}
				</tbody>
			</table>
			</form>
			{if $cId eq 'usuarios-admin'}
				<center><button type="button" class="btn default" data-dismiss="modal">Cerrar</button>
				<button type="submit" class="btn green submitForm" onclick="sendInfoEvaluador()">Guardar</button></center>
			{/if}
        </div>
    </div>
</div>


