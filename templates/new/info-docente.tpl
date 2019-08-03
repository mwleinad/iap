<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Información Personal</b> 
        </div>
		
         <div class="actions">
		 {if $docente}
			<a class="btn {$BUTTON_COLOR}" href="{$WEB_ROOT}/graybox.php?page=aviso" data-target="#ajax" data-toggle="modal" data-width="1000px" title='AVISO DE PRIVACIDAD'>
					Aviso de Privacidad
		
			</a>
			{/if}

        </div>
		<div class="actions">
            <!--<a href="javascript:;" class="btn {$BUTTON_COLOR}" id="btnAddMajor">
                <i class="fa fa-plus"></i> Sincronizar School Manager
            </a>-->
			{if !$docente}
			<button onClick='pdfDatos({$info.personalId})' class="btn red" >Imprimir</button>
			{/if}
        </div>
    </div>
    <div class="portlet-body">

	<div id="msj">
	</div>

        {include file="boxes/status_no_ajax.tpl"}
		
		

		<div id='loader'>
		</div>
		<div id='contenido'>
			<div class="tabbable portlet-tabs">
		<ul class="nav nav-tabs">
			
			
			<li class="active">	
				<a href="#portlet_tabp_1" data-toggle="tab">Información General</a>
			</li>
			<li >	
				<a href="#portlet_tabp_5" data-toggle="tab">Acceso</a>
			</li>
			<li >
				<a href="#portlet_tabp_2" data-toggle="tab">
					Información Escolar
				</a>
			</li>
			<li >
				<a href="#portlet_tabp_3" data-toggle="tab">
					Información Bancaria
				</a>
			</li>
			<li >
				<a href="#portlet_tabp_4" data-toggle="tab">
					Información Automovil
				</a>
			</li>
		</ul>
		<div class="tab-content">
				
			
			
				
			<div class="tab-pane active" id="portlet_tabp_1">
				<center>
					<form id="frmFoto">
						<input type="hidden" name="personalId" class='form-control' value='{$info.personalId}'>
						<div >
							<img src='{$foto}' style='width: 100px !important'>
							<div style='position: relative; 
							bottom:0px; width:100%; margin-right: -100px;'>
							<span class="btn btn-default btn-file">
							<input type="file" name="archivos" id="archivos" onChange="onChangePicture({$info.personalId})" class="btn-file" style="border: 0px solid !important">
							<i class="material-icons md-16 icon-green"  >create</i>
							</span>
							
							</div>
							</a>
						</div>
					</form>
				</center>
				<form  id='frmGral_1' align="center">
					<input type="hidden" name="personalId" class='form-control' value='{$info.personalId}'>
					<center>
					<br>
					<table width='90%'style=" border-spacing: 10px;  border-collapse: separate;">
						<tr>
							<td ><b>Nombre</b>
								<input type="text" name="nombre" class='form-control' {if $cId eq 'si'} disabled {/if} value='{$info.name}'></td>
							<td><b>Apellido Paterno</b>
								<input type="text" name="paterno" class='form-control' {if $cId eq 'si'} disabled {/if} value='{$info.lastname_paterno}'></td>
							<td><b>Apellido Materno</b>
								<input type="text" name="materno" class='form-control' {if $cId eq 'si'} disabled {/if} value='{$info.lastname_materno}'></td>
						</tr>
						<tr>
							<td><b>Correo Electronico</b>
								<input type="text" name="correo" class='form-control' {if $cId eq 'si'} disabled {/if} value='{$info.correo}'></td>
							<td><b>Celular</b>
								<input type="text" name="celular" class='form-control' {if $cId eq 'si'} disabled {/if} value='{$info.celular}'></td>
							<td><b>RFC</b>
								<input type="text" name="rfc" class='form-control' {if $cId eq 'si'} disabled {/if} value='{$info.rfc}'></td>
						</tr>
						<tr>
							<td><b>Fecha Nacimiento</b><br>
								<div style="float:left">
								
								<select name="dia" value="{$dia}" {if $cId eq 'si'} disabled {/if} class='form-control' style="width:100px">
									<option></option>
									{for $i=1 to 31}
									<option {if $i eq $f1} selected {/if}>{$i}</option>
									{/for}
								</select>
								</div>
								<div style="float:left">						
								<select name="mes" value="{$mes}" {if $cId eq 'si'} disabled {/if} class='form-control' style="width:100px">
									<option></option>
									{for $i=1 to 12}
									<option {if $i eq $f2} selected {/if}>{$i}</option>
									{/for}
								</select>
								</div>
								<div style="float:left">
								<select name="anio" value="{$anio}" {if $cId eq 'si'} disabled {/if} class='form-control' style="width:100px">
									<option></option>
									{for $i=1938 to 2000}
									<option {if $i eq $f3} selected {/if}>{$i}</option>
									{/for}
								</select>
								</div>
								<!--<input type="text" name="nacimiento" id='fecha1'  onClick='loadFecha(1)'  value='{$info.fecha_nacimiento}'>
								-->
								</td>
								
							<td><b>Numero INE</b>
								<input type="text" name="ine" class='form-control' {if $cId eq 'si'} disabled {/if} value='{$info.INE}'></td>
							<td><b>Curp</b>
								<input type="text" name="curp" class='form-control' {if $cId eq 'si'} disabled {/if} value='{$info.curp}'></td>
						</tr>
						<tr>
							<td colspan='3'><b>Domicilio</b></td>
						<tr>
						<tr>
							<td ><b>Calle:</b><input type="text" name="calle" class='form-control' value='{$info.calle}' {if $cId eq 'si'} disabled {/if}></td>
							<td ><b>Numero Interior</b><input type="text" name="interior" class='form-control'  {if $cId eq 'si'} disabled {/if} value='{$info.nInterior}'></td>
							<td ><b>Numero Exterior</b><input type="text" name="exterior" class='form-control' {if $cId eq 'si'} disabled {/if} value='{$info.nExterior}'></td>
						<tr>
						<tr>
							<td ><b>Colonia:</b><input type="text" name="colonia" class='form-control' {if $cId eq 'si'} disabled {/if} value='{$info.colonia}'></td>
							<td ><b>Estado</b>
						
							<select name="estado" id="estado" onChange='loadMunicipio()' class='form-control' {if $cId eq 'si'} disabled {/if}>
								<option value=""></option>
								{foreach from=$estados item=item}
								<option value="{$item.estadoId}" {if $info.stateId eq $item.estadoId} selected {/if}>{$item.nombre}</option>
								{/foreach}
							</select>
							</td>
							<td >
								<b>Ciudad</b>
								<!--<input type="text" name="ciudad" class='form-control' {if $cId eq 'si'} disabled {/if} value='{$info.ciudad}'-->
								<div id="divCiudad">
								 {include file="{$DOC_ROOT}/templates/new/ciudades.tpl"}
								</div>
							</td>
						</tr>
						<tr>
							<td ><b>Facebook:</b><input type="text" name="facebook" class='form-control' {if $cId eq 'si'} disabled {/if} value='{$info.facebook}'></td>
							<td ><b>Twitter</b>
						
							<input type="text" name="twitter" class='form-control' {if $cId eq 'si'} disabled {/if} value='{$info.twitter}'>
							</td>
							<td >
								
							</td>
						</tr>
					</table>
					</center>
				</form>
				
					<br>
					<br>
					<div id="msj_1">
					</div>
					<center>
					<button onClick='guardarInformacion(1)' class="btn {$BUTTON_COLOR}" {if $cId eq 'si'} style="display:none"{/if}>
					Guardar
					</button>
					{if $cId eq 'si'}
						<button onClick='activaEdicion()' class="btn yellow" >
						Activar Edicion
						</button>
						<div class="divControls" style="display:none">
							<button onClick='guardarInformacion(1)' class="btn {$BUTTON_COLOR}" >Guardar</button>
							
						</div>
						<!--<button onClick='pdfDatos({$info.personalId})' class="btn blue" >Imprimir</button>-->
					{/if}
					</center>
				
			</div>
			<div class="tab-pane" id="portlet_tabp_5">
				{include file="{$DOC_ROOT}/templates/forms/informacion-acceso.tpl"}
			</div>
			<div class="tab-pane " id="portlet_tabp_2" >
				{include file="{$DOC_ROOT}/templates/forms/informacion-escolar.tpl"}
				
			</div>
			<div class="tab-pane " id="portlet_tabp_3" >
				{include file="{$DOC_ROOT}/templates/forms/informacion-bancaria.tpl"}
				
			</div>
			<div class="tab-pane " id="portlet_tabp_4" >
				{include file="{$DOC_ROOT}/templates/forms/informacion-automovil.tpl"}
				
			</div>
		</div>
	</div>
		</div>
    </div>
</div>