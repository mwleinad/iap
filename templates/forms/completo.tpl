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
      
	  <table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
		<tr>
			<td colspan="2">Municipio:<br></td>
			<td>Nombre:<br><input type="text" name="names" class="form-control" value="{$info.names}"></td>
			<td>Apellido Paterno:<br><input type="text" name="lastNamePaterno" class="form-control" value="{$info.lastNamePaterno}"></td>
			<td colspan="2">Apellido Materno:<br><input type="text" name="lastNameMaterno" class="form-control" value="{$info.lastNameMaterno}"></td>

		</tr>
		<tr>
			<td>Lugar de Nacimiento:<br><input type="text" name="lnacimiento" class="form-control" value="{$info.cityBorn}"></td>
			<td>Nacionalidad:<br><input type="text" name="lnacimiento" class="form-control" value="{$info.nacionality}"></td>
			<td>
			Fecha de Nacimiento:<br>
			<select name="day" class="form-control">
				<option></option>
				{for $foo=1 to 31}
				<option>{$foo}</option>
				{/for}
			</select>
			<select name="month" class="form-control">
				<option value="01">Enero</option>
				<option value="02">Febrero</option>
				<option value="03">Marzo</option>
				<option value="04">Abril</option>
				<option value="05">Mayo</option>
				<option value="06">Junio</option>
				<option value="07">Julio</option>
				<option value="08">Agosto</option>
				<option value="09">Septiembre</option>
				<option value="10">Octubre</option>
				<option value="11">Noviembre</option>
				<option value="12">Diciembre</option>
			</select>
			<select name="year" class="form-control">
				<option></option>
				{for $foo=1920 to 2000}
				<option>{$foo}</option>
				{/for}
			</select>
			</td>
			<td >Nivel Académico:<br>
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
			
				<select name="academicDegree" id="academicDegree" class="form-control">
                        <option value=""></option>
                        <option value="TRUNCOS" {if $info.academicDegree == "TRUNCOS"} selected="selected" {/if}>TRUNCOS</option>
                        <option value="CONCLUIDO" {if $info.academicDegree == "CONCLUIDO"} selected="selected" {/if}>CONCLUIDO</option>
                        <option value="TITULADO" {if $info.academicDegree == "TITULADO"} selected="selected" {/if}>TITULADO</option>
                    </select>
			
			</td>
	


		</tr>
		
		<tr>
			<td colspan="2">Genero:<br>
					<select name="genero" id="genero" class="form-control">
                        <option value=""></option>
                        <option value="m" {if $info.sexo == "m"} selected="selected" {/if}>MASCULINO</option>
                        <option value="f" {if $info.sexo == "f"} selected="selected" {/if}>FEMENINO</option>
                    </select>
			</td>
			<td>CURP:<br><input type="text" name="curp" class="form-control" value="{$info.curp}"></td>  
			<td>Tipo de Solicitante:<br>
			<select id="tipoSolicitante" name="tipoSolicitante" style="width:250px"   class="form-control">
                        <option value="0">Selecciona....</option>
                        {foreach from=$lstSolicitante item=pais}
                            <option value="{$pais.solicitanteId}">{$pais.nombre} </option>
                        {/foreach}
                    </select>
			
			</td>
			<td colspan="2">Sector Productivo:<br>
			
			
			<select id="tipoSolicitante" name="tipoSolicitante" style="width:250px"   class="form-control">
                        <option value="0">Selecciona....</option>
                        {foreach from=$lstSector item=pais}
                            <option value="{$pais.sectorId}">{$pais.nombre} </option>
                        {/foreach}
                    </select>
			
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
			<td>Ciudad:<br></td>
			
		</tr>
		
		<tr>
			<td>Email:<br><input type="text" name="email" class="form-control" value="{$info.email}"></td>
			<td>Telefono:<br><input type="text"  name="mobile"  class="form-control" value="{$info.phone}"></td>
			<td colspan="4">Celular:<br><input type="text" name="mobile" class="form-control" value="{$info.phone}"></td>

		</tr>
		
		<tr>
			<td>¿Sabe leer y escribir?:<br><input type="text" name="" class="form-control"></td>
			<td>¿Cuenta con estudios?:<br><input type="text" name="" class="form-control"></td>
			<td>¿Cuales?:<br><input type="text" name="" class="form-control"></td>
			<td colspan="3">¿Que idiomas o lenguas habla?<input type="text" name="" class="form-control"></td>

		</tr>
		
		<tr>
			<td>¿Tiene alguna discapacidad?:<br><input type="text" name="" class="form-control"></td>
			<td>¿Trabaja actualmente?:<br><input type="text" name="" class="form-control"></td>
			<td colspan="4">Puesto que ocupa?:<br><input type="text" name="workplacePosition" class="form-control"></td>
		</tr>
		
		<tr>
			<td>¿Motriz?:<br><input type="text" name="" class="form-control"></td>
			<td>¿Visual?:<br><input type="text" name="" class="form-control"></td>
			<td>¿Auditiva?:<br><input type="text" name="" class="form-control"></td>
			<td>¿Lenguaje?:<br><input type="text" name="" class="form-control"></td>
			<td>¿Intelectual?:<br><input type="text" name="" class="form-control"></td>
			<td>¿Otras?:<br><input type="text" name="" class="form-control"></td>

		</tr>
		
		<tr>
			<td>Experiencia Laboral(Separara por comas)<br><input type="text" name="" class="form-control"></td>
			<td>¿Cuenta con alguna certificación?:<br><input type="text" name="" class="form-control"></td>
			<td>¿Certificaciones con las que cuenta?(separar por comas)?:<br><input type="text" name="" class="form-control"></td>
			<td></td>
			<td></td>
			<td></td>

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