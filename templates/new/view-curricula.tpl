<div class="portlet box red" >
    <div class="portlet-title" >
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Selecciona la curricula
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body" >
        <div id="tblContent">
			
			<form id="frmGral">
			{if $solicitudId eq 1 or $solicitudId eq 2 or $solicitudId eq 6 or $solicitudId eq 7 or $solicitudId eq 8}
			<b>Favor de indicar a detalle la información que requiere para la generación de su constancia.</b>
			<br>
			<center>
			<textarea class="form-control" name="observacions" id="observacions" style="width:500px"></textarea>
			</center>
			<br>
			<br>
			{/if}
			<input  type="hidden" name="solicitudjjId" id="solicitudjjId"  value="{$solicitudjjId}" >
			<input  type="hidden" name="solicitudId" id="solicitudId"  value="{$solicitudId}" >
			<input  type="hidden" name="soljId" id="soljId"  value="{$soljId}" >
			<span class="caption-subject font-blue-madison bold uppercase">Activa</span>
			 <div class="portlet-body">
                            <div class="table-scrollable table-scrollable-borderless">
                                <table class="table table-hover table-light" >
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
                            </div>
                        </div>
						
				<span class="caption-subject font-blue-madison bold uppercase">Finalizado</span>
				 <div class="portlet-body">
                            <div class="table-scrollable table-scrollable-borderless">
                                <table class="table table-hover table-light">
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
                            </div>
                        </div>
             </form>
			 <div  class="msjError"  ></div>
			<center>
					<button onClick='addSaveSolicitud()' class="btn green submitForm" >Solicitar</button> 
					 <button type="button" class="btn default closeModal">Cancelar</button>
			</center>
        </div>
    </div>
</div>

