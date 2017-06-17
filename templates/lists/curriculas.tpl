<div class="portlet light ">
	<div class="portlet-title">
		<div class="caption caption-md">
			<i class="icon-bar-chart theme-font hide"></i>
			<span class="caption-subject font-blue-madison bold uppercase">Curricula Activa</span>
		</div>
	</div>
	<div class="portlet-body">
		<div class="table-scrollable table-scrollable-borderless">
			<table class="table table-hover table-light">
				<thead>
				<tr class="uppercase">
					
					<th> Tipo </th>
					<th> Nombre </th>
					<th> Grupo </th>
					<th> Modalidad </th>

					<th> Fecha Inicial </th>
					<th> Fecha Final </th>
{*
					<th> Pagos </th>
*}
					
					<th> Modulos </th>
					<!--<th> Acciones </th>-->
				</tr>
				</thead>
				{foreach from=$activeCourses item=subject}
				<tr>
				   
					<td >{$subject.majorName}</td>
					<td >{$subject.name}</td>
					<td >{$subject.group}</td>
					<td >{$subject.modality}</td>
					<td >{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
					<td >{$subject.finalDate|date_format:"%d-%m-%Y"}</td>
				 
{*
					<td align="center">{$subject.payments}</td>
*}
					<td >{$subject.courseModule}
					<!--<td >
						<a href="{$WEB_ROOT}/graybox.php?page=view-modules-course-student&id={$subject.courseId}" data-target="#ajax" data-toggle="modal" data-width="1000px">
						<i class="fa fa-sign-in fa-lg"></i>
						</a>
					</td>--->
				 </tr>
					{foreachelse}
					<tr>
						<td colspan="12" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
					</tr>

				{/foreach}

			</table>
		</div>
	</div>
</div>


<div class="portlet light ">
	<div class="portlet-title">
		<div class="caption caption-md">
			<i class="icon-bar-chart theme-font hide"></i>
			<span class="caption-subject font-blue-madison bold uppercase">Curricula Inactiva</span>
		</div>
	</div>
	<div class="portlet-body">
		<div class="table-scrollable table-scrollable-borderless">
			<table class="table table-hover table-light">
				<thead>
				<tr class="uppercase">
					<th> Clave </th>
					<th> Tipo </th>
					<th> Nombre </th>
					<th> Grupo </th>
					<th> Modalidad </th>
					<th> Fecha Inicial </th>
					<th> Fecha Final </th>
					{*
															<th> Pagos </th>
					*}
					<th> Dias Activo </th>
					<th> Modulos </th>
{*
					<th> Acciones </th>
*}
				</tr>
				</thead>
				{foreach from=$inactiveCourses item=subject}

				<tr>
					<td >{$subject.clave}</td>
					<td >{$subject.majorName}</td>
					<td >{$subject.name}</td>
					<td >{$subject.group}</td>
					<td >{$subject.modality}</td>
					<td >{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
					<td >{$subject.finalDate|date_format:"%d-%m-%Y"}</td>
					<td >{$subject.daysToFinish}</td>
					{*
															<td align="center">{$subject.payments}</td>
					*}
					<td >{$subject.courseModule}
{*
					<td >
						<a href="{$WEB_ROOT}/graybox.php?page=view-modules-course-student&id={$subject.courseId}" data-target="#ajax" data-toggle="modal">
							<i class="fa fa-sign-in fa-lg"></i>
						</a>
					</td>
*}
					</tr>
					{foreachelse}
					<tr>
						<td colspan="12" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
					</tr>
					{/foreach}

			</table>
		</div>
	</div>
</div>

<div class="portlet light ">
	<div class="portlet-title">
		<div class="caption caption-md">
			<i class="icon-bar-chart theme-font hide"></i>
			<span class="caption-subject font-blue-madison bold uppercase">Curricula Finalizada</span>
		</div>
	</div>
	<div class="portlet-body">
		<div class="table-scrollable table-scrollable-borderless">
			<table class="table table-hover table-light">
				<thead>
				<tr class="uppercase">
					<th> Clave </th>
					<th> Tipo </th>
					<th> Nombre </th>
					<th> Grupo </th>
					<th> Modalidad </th>
					<th> Fecha Inicial </th>
					<th> Fecha Final </th>
					{*
															<th> Pagos </th>
					*}
					<th> Dias Activo </th>
					<th> Modulos </th>
					<th> Calificación </th>
				</tr>
				</thead>
				{foreach from=$finishedCourses item=subject}

				<tr>
					<td >{$subject.clave}</td>
					<td >{$subject.majorName}</td>
					<td >{$subject.name}</td>
					<td >{$subject.group}</td>
					<td >{$subject.modality}</td>
					<td >{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
					<td >{$subject.finalDate|date_format:"%d-%m-%Y"}</td>
					<td >{$subject.daysToFinish}</td>
					{*
															<td align="center">{$subject.payments}</td>
					*}
					<td >{$subject.courseModule}
					<td >{$subject.mark}</td>
				 </tr>
					{foreachelse}
					<tr>
						<td colspan="12" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
					</tr>
				{/foreach}

			</table>
		</div>
	</div>
</div>