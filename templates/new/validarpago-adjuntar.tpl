<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Validar Pago</b> 
        </div>
		
         <div class="actions">
		 
	

        </div>
		<div class="actions">
            <!--<a href="javascript:;" class="btn green" id="btnAddMajor">
                <i class="fa fa-plus"></i> Sincronizar School Manager
            </a>-->
        </div>
    </div>
    <div class="portlet-body">

	<div id="msj">
	</div>

        {include file="boxes/status_no_ajax.tpl"}

		<div id='loader'></div>
		<div id='msj'></div>
		<div id='contenido'>
			<form class="form-horizontal" id="frmDoc_" method="post"  >
			<input type="hidden" id="type" name="type" value="validarPagoAdjunto"/>
			<input type="hidden"  name="Id" value="{$id}"/>
			<input type="hidden"  name="cmId" value="{$cmId}"/>
				   <input type="file" name="archivos" id="archivos">
			</form>
			<progress id="progress_" value="0" min="0" max="100"></progress>
			<div id="porcentaje_" >0%</div>
			<br>
			<font color="red">*Solo se permiten adjuntar archivos con extensión .PDF</font><br>
			<center><button  class="btn green" id="addMajor" name="addMajor" onClick="validarPagoAdjunto()">Guardar</button></center>

		</div>
    </div>
</div>