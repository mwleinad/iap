<script language="JavaScript">
var nav4 = window.Event ? true : false;

function habilitando() {
alert("hola");
       if(addStudentForm.tipo_beca.value=="Ninguno")
    addStudentForm.por_beca.disabled = true;
	else
	addStudentForm.por_beca.disabled = false;
}

function Numero(evt){
// Backspace = 8, Enter = 13, ’0′ = 48, ’9′ = 57, ‘.’ = 46
var key = nav4 ? evt.which : evt.keyCode;
return (key <= 13 || (key >= 48 && key <= 57) || key == 46);
}
</script>

<form id="addStudentForm" name="addStudentForm" method="post">
<input type="hidden" id="type" name="type" value="saveAddStudentCompleto"/>
<input type="hidden" id="tam" name="tam" value="1"/>
<input type="hidden" id="RegisterAdmin" name="RegisterAdmin" value="1"/>
<input type="hidden" id="permiso" name="permiso" value="1"/>
<input type="hidden" id="userId" name="userId" value="{$info.userId}"/>
           
    <div class="content-in-popup">
      <!--
      <div class="content-settings-row" align="center">
            <b>.:: Datos Personales ::.</b>
      </div>
      -->
	 {if $aparecConfirma eq 'si'}
	<center>
		<b>No autorizo</b>
		<label class="switch">
		  <input type="checkbox" name="confirma" id="confirma" {if $info.autorizo eq 'si'} checked {/if}>
		  <span class="slider round"></span>
		</label>
		<b>Si autorizo</b>
	</center>
	{/if}
	  <table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content" >
		<tr>
			<td colspan="2" {if $info.ciudad ne ""} style="background:#e7505a33" {/if}>Municipio:<br>
			<select id="municipiotId" name="municipiotId"  style="width:250px" class="form-control" >
                            <option value="0">Selecciona </option>
							  {foreach from=$lst item=pais}
                            <option value="{$pais.municipioId}" {if $info.ciudadt == $pais.municipioId} selected="selected" {/if}>{$pais.nombre} </option>
                        {/foreach}

                        </select>
			
			</td>
			<td {if $info.names ne ""} style="background:#e7505a33" {/if}>Nombre:<br><input type="text" name="names" class="form-control" value="{$info.names}"></td>
			<td {if $info.lastNamePaterno ne ""} style="background:#e7505a33" {/if}>Apellido Paterno:<br><input type="text" name="lastNamePaterno" class="form-control" value="{$info.lastNamePaterno}"></td>
			<td colspan="2" {if $info.lastNameMaterno ne ""} style="background:#e7505a33" {/if}>Apellido Materno:<br><input type="text" name="lastNameMaterno" class="form-control" value="{$info.lastNameMaterno}"></td>

		</tr>
		<tr>
			<td colspan="2">Lugar de Nacimiento:<br><input type="text" name="cityBorn" class="form-control" value="{$info.cityBorn}"></td>
			<td>Nacionalidad:<br><input type="text" name="nacionality" class="form-control" value="{$info.nacionality}"></td>
			<td style="width:180px" colspan="3">
			Fecha de Nacimiento:<br>
			<select name="day" class="form-control" style="width:45%; float:left;>
				<option value="">dias</option>
				{for $foo=1 to 31}
				<option  {if $info.dia == $foo} selected="selected" {/if}>{$foo}</option>
				{/for}
			</select>
			<select name="month" class="form-control" style="width:45%; float:left;>
				<option value="">mes</option>
				<option value="1" {if $info.mes ==1} selected="selected" {/if}>Enero</option>
				<option value="2" {if $info.mes ==2} selected="selected" {/if}>Febrero</option>
				<option value="3" {if $info.mes ==3} selected="selected" {/if}>Marzo</option>
				<option value="4" {if $info.mes ==4} selected="selected" {/if}>Abril</option>
				<option value="5" {if $info.mes ==5} selected="selected" {/if}>Mayo</option>
				<option value="6" {if $info.mes ==6} selected="selected" {/if}>Junio</option>
				<option value="7" {if $info.mes ==7} selected="selected" {/if}>Julio</option>
				<option value="8" {if $info.mes ==8} selected="selected" {/if}>Agosto</option>
				<option value="9" {if $info.mes ==9} selected="selected" {/if}>Septiembre</option>
				<option value="10" {if $info.mes ==10} selected="selected" {/if}>Octubre</option>
				<option value="11" {if $info.mes ==11} selected="selected" {/if}>Noviembre</option>
				<option value="12" {if $info.mes ==12} selected="selected" {/if}>Diciembre</option>
			</select>
			<select name="year" class="form-control" style="width:45%; float:left;>
				<option value="">Año</option>
				{for $foo=1920 to 2010}
				<option {if $info.year ==$foo} selected="selected" {/if}>{$foo}</option>
				{/for}
			</select>
			</td>
		</tr>
		  <tr>
			<td colspan="3">Nivel Académico:<br>
			  <select name="academicDegree" id="academicDegree" class="form-control">
                        <option value=""></option>
                        <option value="PRIMARIA" {if $info.academicDegree == "PRIMARIA"} selected="selected" {/if}>PRIMARIA</option>
                        <option value="SECUNDARIA" {if $info.academicDegree == "SECUNDARIA"} selected="selected" {/if}>SECUNDARIA</option>
                        <option value="ESTUDIOS TECNICOS" {if $info.academicDegree == "ESTUDIOS TECNICOS"} selected="selected" {/if}>ESTUDIOS TECNICOS</option>
                        <option value="BACHILLERATO" {if $info.academicDegree == "BACHILLERATO"} selected="selected" {/if}>BACHILLERATO</option>
                        <option value="LICENCIATURA" {if $info.academicDegree == "LICENCIATURA"} selected="selected" {/if}>LICENCIATURA</option>
                        <option value="MAESTRIA" {if $info.academicDegree == "MAESTRIA"} selected="selected" {/if}>MAESTRIA</option>
                        <option value="DOCTORADO" {if $info.academicDegree == "DOCTORADO"} selected="selected" {/if}>DOCTORADO</option>
                        <option value="POSGRADO" {if $info.academicDegree == "POSGRADO"} selected="selected" {/if}>POSGRADO</option>
                    </select>
			
			
			</td>
			<td colspan="2">Estatus:<br>
			
				<select name="statusacademicDegree" id="statusacademicDegree" class="form-control">
                        <option value=""></option>
                        <option value="TRUNCOS" {if $info.statusacademicDegree == "TRUNCOS"} selected="selected" {/if}>TRUNCOS</option>
                        <option value="CONCLUIDO" {if $info.statusacademicDegree == "CONCLUIDO"} selected="selected" {/if}>CONCLUIDO</option>
                        <option value="TITULADO" {if $info.statusacademicDegree == "TITULADO"} selected="selected" {/if}>TITULADO</option>
                    </select>
			
			</td>
	


		</tr>
		
		<tr>
			<td>Genero:<br>
					<select name="genero" id="genero" class="form-control">
                        <option value=""></option>
                        <option value="m" {if $info.sexo == "m"} selected="selected" {/if}>MASCULINO</option>
                        <option value="f" {if $info.sexo == "f"} selected="selected" {/if}>FEMENINO</option>
                    </select>
			</td>
			<td colspan="2">CURP:<br><input type="text" name="curp" class="form-control" value="{$info.curp}"></td>
			<td {if $info.tiposolicitanteId ne ""} style="background:#e7505a33" {/if}>Tipo de Solicitante:<br>
			<select id="tipoSolicitante" name="tipoSolicitante" style="width:250px"   class="form-control">
                        <option value="0">Selecciona....</option>
                        {foreach from=$lstSolicitante item=pais}
                            <option value="{$pais.tiposolicitanteId}" {if $info.tiposolicitanteId == $pais.tiposolicitanteId} selected="selected" {/if}>{$pais.nombre} </option>
                        {/foreach}
                    </select>
			
			</td>
			<td colspan="2">Sector Productivo:<br>
			
			
			<select id="sectorId" name="sectorId" style="width:250px"   class="form-control">
                        <option value="0">Selecciona....</option>
                        {foreach from=$lstSector item=pais}
                            <option value="{$pais.sectorId}"  {if $info.sectorId == $pais.sectorId} selected="selected" {/if}>{$pais.nombre} </option>
                        {/foreach}
                    </select>
			
			</td>

		</tr>
		<tr>
			<td colspan="6">
				<b>Datos Personales</b>
			</td>
		</tr>
		<tr>
			<td>Calle:<br><input type="text" name="street" class="form-control" value="{$info.street}"></td>
			<td >Numero:<br><input type="text" name="number" class="form-control"  value="{$info.number}"></td>
			<td>CP:<br><input type="text" name="postalCode" class="form-control" value="{$info.postalCode}"></td>
			<td>Colonia:<br><input type="text" name="colony" class="form-control"  value="{$info.colony}"></td>
			<td>Estado:<br>
			<select id="estado" name="estado" onChange='ciudad_dependenciat();' style="width:150px" class="form-control" >
                            <option value="0">Selecciona tu Estado</option>
							  {foreach from=$lstEstados item=pais}
                            <option value="{$pais.estadoId}" {if $info.estado == $pais.estadoId} selected="selected" {/if}>{$pais.nombre} </option>
                        {/foreach}
							
                        </select>
			</td>
			<td>Ciudad:<br>
			<div id="divMunicipio">
				{include file="{$DOC_ROOT}/templates/forms/new/municipio.tpl"}
			</div>	
			</td>
			
		</tr>
		
		<tr>
			<td {if $info.email ne ""} style="background:#e7505a33" {/if} colspan="2">Email:<br><input type="text" name="email" class="form-control" value="{$info.email}"></td>
			<td {if $info.phone ne ""} style="background:#e7505a33" {/if} colspan="2">Telefono:<br><input type="text"  name="mobile"  class="form-control" value="{$info.phone}"></td>
			<td colspan="2">Celular:<br><input type="text" name="mobile" class="form-control" value="{$info.mobile}"></td>

		</tr>
		<tr>
			<td colspan="6">
				<b>Otros Datos</b>
			</td>
		</tr>
		<tr>
			<td>¿Sabe leer y escribir?<br>
			<select name="lee" class="form-control" style="width:70px; float:left">
				<option></option>
				<option {if $info.lee == "si"} selected="selected" {/if}>si</option>
				<option {if $info.lee == "no"} selected="selected" {/if}>no</option>
			</select>
			</td>
			<td>¿Cuenta con estudios?:<br>
			<select name="estudios" class="form-control" style="width:70px; float:left">
				<option></option>
				<option {if $info.lee == "si"} selected="selected" {/if}>si</option>
				<option {if $info.lee == "no"} selected="selected" {/if}>no</option>
			</select>
			</td>
			<td colspan="2">¿Cuales?:<br><input type="text" name="d_estudios" class="form-control" value="{$info.d_estudios}"></td>
			<td colspan="2">¿Que idiomas o lenguas habla?<input type="text" name="idiomas" value="{$info.idiomas}" class="form-control"></td>

		</tr>
		
		<tr>

			<td colspan="2">¿Trabaja actualmente?:<br><select name="trabaja" class="form-control" style="width:70px; float:left">
				<option></option>
				<option {if $info.trabaja == "si"} selected="selected" {/if}>si</option>
				<option {if $info.trabaja == "no"} selected="selected" {/if}>no</option>
			</select></td>
			<td colspan="3">¿Puesto que ocupa?:<br><input type="text" name="workplacePosition" value="{$info.workplacePosition}" class="form-control"></td>
		</tr>
		  <tr>
		  <td colspan="2">¿Tiene alguna discapacidad?:<br>
			  <select name="discapacidad" class="form-control" style="width:70px; float:left">
				  <option></option>
				  <option {if $info.discapacidad == "si"} selected="selected" {/if}>si</option>
				  <option {if $info.discapacidad == "no"} selected="selected" {/if}>no</option>
			  </select>
		  </td>
			  <td></td>
			  <td></td>
			  <td></td>
			  <td></td>
		  </tr>
		<tr>
			<td colspan="6">
				<b>En caso de discapacidad, marcar el o los tipos</b>
			</td>
		</tr>
		<tr>
			<td>¿Motriz?:<br><input type="checkbox" name="motriz" class="form-control" {if $info.motriz} checked {/if}></td>
			<td>¿Visual?:<br><input type="checkbox" name="visual" class="form-control" {if $info.visual} checked {/if}></td>
			<td>¿Auditiva?:<br><input type="checkbox" name="auditiva" class="form-control" {if $info.auditiva} checked {/if}></td>
			<td>¿Lenguaje?:<br><input type="checkbox" name="lenguaje" class="form-control" {if $info.lenguaje} checked {/if}></td>
			<td>¿Intelectual?:<br><input type="checkbox" name="intelectual" class="form-control" {if $info.intelectual} checked {/if}></td>
			<td>¿Otras?:<br><input type="checkbox" name="otras" class="form-control" {if $info.otras} checked {/if}></td>

		</tr>
		
		<tr>
			<td colspan="2">Experiencia Laboral(Separar por comas)<br><textarea  name="experienciaLaboral"  class="form-control" style="width:100% ; height:150px">{$info.experienciaLaboral}</textarea></td>
			<td>¿Cuenta con alguna certificación?:<br>
			<select name="certificacion"  class="form-control" style="width:70px; ">
				<option></option>
				<option {if $info.certificacion == "si"} selected="selected" {/if}>si</option>
				<option {if $info.certificacion == "no"} selected="selected" {/if}>no</option>
			</select>
			</td>
			<td colspan="2">¿Certificaciones con las que cuenta?(separar por comas)?:<br><textarea   style="width:100% ; height:150px" class="form-control" name="certificaciones" >{$info.certificaciones}</textarea></td>


		</tr>
	  </table>
	 
      
      <div style="float:left"><span class="reqField">*</span> Campo requerido</div>
      <br>
	  <div id="res_">
		
	  </div>
	  <center>
      <button type="button" class="btn green submitForm" onclick="AddStudentRegister();" id="addStudent">Guardar</button>
       </center>
</form>