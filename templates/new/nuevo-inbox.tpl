<style>
.child.table-bordered{
	border-color:#73B760;
}
.child.table-bordered th, .child.table-bordered td{
	border-color:#73B760;
}
.child.table-striped tbody tr:nth-of-type(odd) {
    background-color: #dadbda;
}
</style>
<div class="card" >
    <div class="card-header bg-primary header_main">
        <div class="caption sub_header">
            <i class="fa fa-bullhorn"></i>Modulos
        </div>
        <div class="actions">

        </div>
    </div>
    <div class="card-body p-5">
       <table width="100%" class="tblGral table table-striped table-condensed flip-content">
			<thead>
				<th></th>
				<th>Tipo</th>
				<th>Nombre</th>
				<th>Modalidad</th>
			</thead>
			<tbody>
				{foreach from=$activeCourses  item=subject}
						<tr>
							<td><a href="javascript:void(0)" onClick='verMateria({$subject.courseId})'>[+]</a></td>
							<td align="left">{$subject.majorName}</td>
							<td align="left">{$subject.name}</td>
							<td align="left">{$subject.modality}</td>
						</tr>
						<tr>
							<td id="td_{$subject.courseId}" colspan="10" style="display:none">
								<table>
									<table width="100%" class="tblGral child table table-bordered table-striped table-condensed flip-content">
									<thead>
										<th></th>
										<th>Nombre</th>
										<th>Estatus</th>
										<th>Mensaje</th>
										
									</thead>
									<tbody>
									{foreach from=$subject.materias key=key item=item2}
										
											<tr>
												<td>{$item2.semesterId}</td>
												<td>{$item2.name}</td>
												<td>{$item2.statusCCi}</td>
												<td class="text-center">
													<a href="{$WEB_ROOT}/reply-inbox/id/{$item2.courseModuleId}/cId/0">
														<i class="icon-paper-plane fa-2x text-black"></i>
													</a>
												</td>
											</tr>
										
									{/foreach}
									</tbody>
								</table>
							</td>
						</tr>
					{foreachelse}
						<tr>
							<td colspan="12" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
						</tr>
					{/foreach}

			</tbody>
		</table>
    </div>
</div>