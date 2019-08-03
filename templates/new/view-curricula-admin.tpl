<b>{$infoTypeSol.nombre}</b>
<br>
<b>
{$infoStudent.names}
{$infoStudent.lastNamePaterno}
{$infoStudent.lastNameMaterno}
</b>
<br>
<br>
<input  type="hidden" name="solicitudId" id="solicitudId"  value="{$solicitudId}" >
<input  type="hidden" name="userId" id="userId"  value="{$userId}" >
<span class="caption-subject font-blue-madison bold uppercase">Activa</span>
<table width="50% !important" class="tblGral table table-bordered table-striped table-condensed flip-content">
<thead>
<tr class="uppercase">
<th style="text-align: center"> Tipo </th>
<th style="text-align: center"> Nombre </th>
 <th style="text-align: center"> Grupo </th>
<th style="text-align: center"> Modalidad </th>
<th style="text-align: center"> Fecha Inicial </th>
<th style="text-align: center"> Fecha Final </th>
{*
<th style="text-align: center"> Pagos </th>
*}

<th style="text-align: center"> Modulos </th>

<th style="text-align: center"> Selecciona </th>
</tr>
</thead>
{foreach from=$activeCourses item=subject}
<tr>

<td align="center">{$subject.majorName}</td>
<td align="center">{$subject.name}</td>
  <td align="center">{$subject.group}
<td align="center">{$subject.modality}</td>
<td align="center">{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
<td align="center">{$subject.finalDate|date_format:"%d-%m-%Y"}</td>

{*
<td align="center">{$subject.payments}</td>
*}
<td align="center">{$subject.courseModule}

<td align="center">
   <input type="checkbox" name="activa_{$subject.courseId}" id="">
</td>
</tr>
{foreachelse}
<tr>
	<td colspan="12" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
</tr>
{/foreach}
</table>
                           
						
<span class="caption-subject font-blue-madison bold uppercase">Finalizado</span>
<table width="50% !important" class="tblGral table table-bordered table-striped table-condensed flip-content">
	<thead>
	<tr class="uppercase">
		<th style="text-align: center"> Clave </th>
		<th style="text-align: center"> Tipo </th>
		<th style="text-align: center"> Nombre </th>
		<th style="text-align: center"> Modalidad </th>
		<th style="text-align: center"> Fecha Inicial </th>
		<th style="text-align: center"> Fecha Final </th>
		{*
		<th> Pagos </th>
		*}
		<th style="text-align: center"> Dias Activo </th>
		<th style="text-align: center"> Modulos </th>
		<th style="text-align: center"> Calificación </th>
		<th style="text-align: center"> Selecciona </th>
	</tr>
	</thead>
	{foreach from=$finishedCourses item=subject}

	<tr>
		<td style="text-align: center">{$subject.clave}</td>
		<td style="text-align: center">{$subject.majorName}</td>
		<td style="text-align: center">{$subject.name}</td>
		<td style="text-align: center">{$subject.modality}</td>
		<td style="text-align: center">{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
		<td style="text-align: center"style="text-align: center">{$subject.finalDate|date_format:"%d-%m-%Y"}</td>
		<td >{$subject.daysToFinish}</td>
		{*
		<td align="center">{$subject.payments}</td>
		*}
		<td style="text-align: center">{$subject.courseModule}
		<td style="text-align: center">{$subject.mark}</td>
		<td style="text-align: center">
		 <input type="checkbox" name="finalizada_{$subject.courseId}" id="">
		</td>
	 </tr>
		{foreachelse}
		<tr>
			<td colspan="12" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
		</tr>
	{/foreach}
</table>
<div id="msjgg"></div>
<center><button onClick='addSaveSolicitud()' class="btn {$BUTTON_COLOR} submitForm" >Solicitar</button> </center>


