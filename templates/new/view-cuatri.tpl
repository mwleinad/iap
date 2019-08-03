<div class="portlet box {$PORTLET_COLOR}" >
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
                                        
                                       
                                        <th style="text-align: center"> Semestre / Cuatrimestre</th>
                                        <th style="text-align: center"> Calificacion </th>
                                         <th style="text-align: center"> Selecciona </th>
                                    </tr>
                                    </thead>
                                    {foreach from=$activeCourses.materias item=subject}
                                    <tr>
                                       
                                        <td align="center">{$subject.semesterId}</td>
                                        <td align="center">{$subject.promedio}</td>

                                        <td align="center">
                                           <input type="checkbox" name="activa_{$subject.semesterId}" id="">
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
			 <div class="msjError"></div>
			<center>
				<button onClick='addSaveSolicitud()' class="btn {$BUTTON_COLOR} submitForm" >Solicitar</button> <!--
				<button type="button"  onClick='closeModal()'  class="btn default closeModal">Cancelar</button>-->
			</center>
        </div>
    </div>
</div>

