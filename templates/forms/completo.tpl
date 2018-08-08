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
<input type="hidden" id="type" name="type" value="saveAddStudent"/>
<input type="hidden" id="tam" name="tam" value="1"/>
<input type="hidden" id="RegisterAdmin" name="RegisterAdmin" value="1"/>
<input type="hidden" id="permiso" name="permiso" value="1"/>
           
    <div class="content-in-popup">
      <!--
      <div class="content-settings-row" align="center">
            <b>.:: Datos Personales ::.</b>
      </div>
      -->
      
	  <table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
		<tr>
			<td colspan="2">Municipio:<br></td>
			<td>Nombre:<br><input type="text" name="" class="form-control"></td>
			<td>Apellido Paterno:<br><input type="text" name="" class="form-control"></td>
			<td colspan="2">Apellido Materno:<br><input type="text" name="" class="form-control"></td>

		</tr>
		<tr>
			<td>Lugar de Nacimiento:<br></td>
			<td>Nacionalidad:<br></td>
			<td>Fecha de Nacimiento:<br></td>
			<td >Nivel Académico:<br></td>
			<td colspan="2">Estatus:<br></td>
	


		</tr>
		
		<tr>
			<td colspan="2">Genero:<br></td>
			<td>CURP:<br><input type="text" name="" class="form-control"></td>
			<td>Tipo de Solicitante:<br></td>
			<td colspan="2">Sector Productivo:<br></td>

		</tr>
		
		<tr>
			<td>Calle:<br><input type="text" name="" class="form-control"></td>
			<td >Numero:<br><input type="text" name="" class="form-control"></td>
			<td>CP:<br><input type="text" name="" class="form-control"></td>
			<td>Colonia:<br><input type="text" name="" class="form-control"></td>
			<td>Ciudad:<br></td>
			<td>Estado:<br></td>
		</tr>
		
		<tr>
			<td>Email:<br><input type="text" name="" class="form-control"></td>
			<td>Telefono:<br><input type="text" name="" class="form-control"></td>
			<td colspan="4">Celular:<br><input type="text" name="" class="form-control"></td>

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
			<td colspan="4">Puesto que ocupa?:<br><input type="text" name="" class="form-control"></td>
		</tr>
		
		<tr>
			<td>¿Motriz?:<br><input type="text" name="" class="form-control"></td>
			<td>¿Visual?:<br><input type="text" name="" class="form-control"></td>
			<td>Auditiva?:<br><input type="text" name="" class="form-control"></td>
			<td>Lenguaje?:<br><input type="text" name="" class="form-control"></td>
			<td>Intelecctual?:<br><input type="text" name="" class="form-control"></td>
			<td>Otras?:<br><input type="text" name="" class="form-control"></td>

		</tr>
	  </table>
	  <!--
       <div class="content-settings-row">
            <label for="f1"><span class="reqField">*</span> Nombre:</label>
            <input type="text" name="names" id="names" value="" />                      
      </div>
      
       <div class="content-settings-row">
            <label for="f1"><span class="reqField">*</span> Apellido Paterno:</label>
            <input type="text" name="lastNamePaterno" id="lastNamePaterno" value="" />                      
      </div>
      
       <div class="content-settings-row">
            <label for="f1"><span class="reqField">*</span> Apellido Materno:</label>
            <input type="text" name="lastNameMaterno" id="lastNameMaterno" value="" />                      
      </div>
      
      <div class="content-settings-row">
            <label for="f1">Sexo:</label>
            	<select name='sexo' id="sexo">
                    <option value="m">Masculino</option>
                    <option value="f">Femenino</option>
                </select>                    
      </div>
      
      <div class="content-settings-row">
            <label for="f1"><span class="reqField">*</span> Fecha de Nacimiento:</label>
            	<select name="day" id="day" style="width:70px">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="17">17</option>
                    <option value="18">18</option>         
                    <option value="19">19</option>
                    <option value="20">20</option>
                    <option value="21">21</option>
                    <option value="22">22</option>
                    <option value="23">23</option>
                    <option value="24">24</option>
                    <option value="25">25</option>
                    <option value="26">26</option>
                    <option value="27">27</option>
                    <option value="28">28</option>
                    <option value="29">29</option>
                    <option value="30">30</option>
                    <option value="31">31</option>      
                </select>
                <select name="month" id="month">
                    <option value="1">Enero</option>
                    <option value="2">Febrero</option>
                    <option value="3">Marzo</option>
                    <option value="4">Abril</option>
                    <option value="5">Mayo</option>
                    <option value="6">Junio</option>
                    <option value="7">Julio</option>
                    <option value="8">Agosto</option>
                    <option value="9">Septiembre</option>
                    <option value="10">Octubre</option>
                    <option value="11">Noviembre</option>
                    <option value="12">Diciembre</option>
                </select>
                 {include file="{$DOC_ROOT}/templates/forms/year.tpl" name="year" selected=$info.yearBirthdate}
                     
      </div>

      <div class="content-settings-row">
            <label for="f1">Estado Civil:</label>
            {include file="{$DOC_ROOT}/templates/forms/maritalStatus.tpl" selected=$info.maritalStatus}
      </div>
      
      <div class="content-settings-row">
            <label for="f1">Contraseña del Sistema:</label>
            <input type="password" name="password" id="password" value="" />                      
      </div>
      
      <div class="content-settings-row" align="center">
            <b>.:: Domicilio ::.</b>                     
      </div>
      
      <div class="content-settings-row">
            <label for="f1">Calle:</label>
            <input type="text" name="street" id="street" value="" />                      
      </div>
      
      <div class="content-settings-row">
            <label for="f1">N&uacute;mero:</label>
            <input type="text" name="number" id="number" value="" />                      
      </div>
      
      <div class="content-settings-row">
            <label for="f1">Colonia:</label>
            <input type="text" name="colony" id="colony" value="" />                      
      </div>
      
         <div class="content-settings-row">
            <label for="f1"><span class="reqField">*</span>Pa&iacute;s:</label>
           
			<select id="pais" name="pais" style="width:300px" onChange="estado_dependencia();" >
             <option value="0">Selecciona Tu Pa&iacute;s</option>
			     {foreach from=$paises item=pais}
				 <option value="{$pais.paisId}">{$pais.nombre} </option>
				 {/foreach}
            </select>                     
      </div>
	     
      <div class="content-settings-row">
            <label for="f1"><span class="reqField">*</span>Estado:</label>
            <div id="Stateposition">
			 <select id="estado" name="estado" onChange='ciudad_dependencia();' style="width:300px">
            <option value="0">Selecciona tu Estado</option>
        </select>                    
            </div>
	  
	  </div>
      
	  <div class="content-settings-row">
            <label for="f1"><span class="reqField">*</span>Municipio:</label>
          <div id="Cityposition">  
			<select id="ciudad" name="ciudad" style="width:300px">
            <option value="0">Selecciona tu Ciudad</option>
             </select>
	      </div>
	  </div>

      
      <div class="content-settings-row">
            <label for="f1">C&oacute;digo Postal:</label>
            <input type="text" name="postalCode" id="postalCode" value="" />                      
      </div>

      <div class="content-settings-row" align="center">
            <b>.:: Datos de Contacto ::.</b>                     
      </div>
      
      <div class="content-settings-row">
            <label for="f1">Correo Electr&oacute;nico:</label>
            <input type="text" name="email" id="email" value="" />                      
      </div>
      
      <div class="content-settings-row">
            <label for="f1">Tel&eacute;fono Local:</label>
            <input type="text" name="phone" id="phone" value="" />                      
      </div>

      <div class="content-settings-row">
            <label for="f1">Telefono de Emergencia:</label>
            <input type="text" name="fax" id="fax" value="" />                      
      </div>

      <div class="content-settings-row">
            <label for="f1">Celular:</label>
            <input type="text" name="mobile" id="mobile" value="" />                      
      </div>
      
      <div class="content-settings-row" align="center">
            <b>Datos Laborales</b>                      
      </div>

<div class="content-settings-row">
            <label for="f1"><span class="reqField"></span>Ocupacion:</label>
            <select name="workplaceOcupation" id="workplaceOcupation" style="width:300px">
            <option value="FUNCIONARIO PUBLICO MUNICIPAL" {if $info.workplaceOcupation == "FUNCIONARIO PUBLICO MUNICIPAL"} selected="selected" {/if}>FUNCIONARIO PUBLICO MUNICIPAL</option>
            <option value="FUNCIONARIO PUBLICO ESTATAL" {if $info.workplaceOcupation == "FUNCIONARIO PUBLICO ESTATAL"} selected="selected" {/if}>FUNCIONARIO PUBLICO ESTATAL</option>
            <option value="FUNCIONARIO PUBLICO FEDERAL" {if $info.workplaceOcupation == "FUNCIONARIO PUBLICO FEDERAL"} selected="selected" {/if}>FUNCIONARIO PUBLICO FEDERAL</option>
            <option value="OTROS" {if $info.workplaceOcupation == "OTROS"} selected="selected" {/if}>OTROS</option>
            </select>
      </div>      
      <div class="content-settings-row">
            <label for="f1"><span class="reqField"></span>Lugar de Trabajo:</label>
            <input type="text" name="workplace" id="workplace" value="" />                      
      </div>

    
	
	
	
	      <div class="content-settings-row">
            <label for="f1"><span class="reqField">*</span>Pa&iacute;s:</label>
           
			<select id="paist" name="paist" style="width:300px" onChange="estado_dependenciat();" >
             <option value="0">Selecciona Tu Pa&iacute;s</option>
			     {foreach from=$paises item=pais}
				 <option value="{$pais.paisId}">{$pais.nombre} </option>
				 {/foreach}
            </select>                     
      
	     </div>
      <div class="content-settings-row">
            <label for="f1"><span class="reqField">*</span>Estado:</label>
            <div id="Statepositiont">
			 <select id="estadot" name="estadot" onChange='ciudad_dependenciat();' style="width:300px">
            <option value="0">Selecciona tu Estado</option>
        </select>                    
            </div>
	  
	  </div>
      
	  <div class="content-settings-row">
            <label for="f1"><span class="reqField">*</span>Municipio:</label>
          <div id="Citypositiont">  
			<select id="ciudadt" name="ciudadt" style="width:300px">
            <option value="0">Selecciona tu Ciudad</option>
             </select>
	      </div>
	  </div>
	  
	  
	  
	
	
	
	

      <div class="content-settings-row">
            <label for="f1"><span class="reqField"></span>Domicilio:</label>
            <input type="text" name="workplaceAddress" id="workplaceAddress" value="" />                      
      </div>

      <div class="content-settings-row">
            <label for="f1"><span class="reqField"></span>Area:</label>
            <input type="text" name="workplaceArea" id="workplaceArea" value="" />                      
      </div>

      <div class="content-settings-row">
            <label for="f1"><span class="reqField"></span>Puesto:</label>
            <input type="text" name="workplacePosition" id="workplacePosition" value="" />                      
      </div>

      <div class="content-settings-row">
            <label for="f1"><span class="reqField"></span>Telefono Oficina:</label>
            <input type="text" name="workplacePhone" id="workplacePhone" value="" />                      
      </div>

      <div class="content-settings-row">
            <label for="f1"><span class="reqField"></span>Correo Electr&oacute;nico Laboral:</label>
            <input type="text" name="workplaceEmail" id="workplaceEmail" value="" />                      
      </div>

      <div class="content-settings-row" align="center">
            <b>Estudios</b>                      
      </div>
      
      <div class="content-settings-row">
            <label for="f1"><span class="reqField"></span>Grado Academico:</label>
            <select name="academicDegree" id="academicDegree">
            <option value="UNIVERSITARIO" {if $info.academicDegree == "UNIVERSITARIO"} selected="selected" {/if}>UNIVERSITARIO</option>
            <option value="LICENCIATURA" {if $info.academicDegree == "LICENCIATURA"} selected="selected" {/if}>LICENCIATURA</option>
            <option value="MAESTRIA" {if $info.academicDegree == "MAESTRIA"} selected="selected" {/if}>MAESTRIA</option>
            <option value="DOCTORADO" {if $info.academicDegree == "DOCTORADO"} selected="selected" {/if}>DOCTORADO</option>
            <option value="OTROS" {if $info.academicDegree == "OTROS"} selected="selected" {/if}>OTROS</option>
            </select>
      </div>

 <div class="content-settings-row">
            <label for="f1"><span class="reqField"></span>Profesion:</label>
            <select name="profesion" id="profesion" style="width:300px">
            {foreach from=$prof item=item}
            <option value="{$item.profesionId}" {if $info.profesion == $item.profesionId} selected="selected" {/if}>{$item.profesionName}</option>
item{/foreach}
            </select>
      </div>      
      <div class="content-settings-row">
            <label for="f1"><span class="reqField"></span>Escuela o Institucion Universitaria:</label>
            <input type="text" name="school" id="school" value="{$info.school}" />                      
      </div>

      <div class="content-settings-row">
            <label for="f1"><span class="reqField"></span>Maestria en:</label>
            <input type="text" name="masters" id="masters" value="{$info.masters}" />                      
      </div>
      <div class="content-settings-row">
            <label for="f1"><span class="reqField"></span>Escuela o Institucion:</label>
            <input type="text" name="mastersSchool" id="mastersSchool" value="{$info.mastersSchool}" />                      
      </div>
      
      <div class="content-settings-row">
            <label for="f1"><span class="reqField"></span>Estudios de Bachillerato:</label>
            <input type="text" name="highSchool" id="highSchool" value="{$info.highSchool}" />                      
      </div>      
      
      <div class="content-settings-row" align="center">
            <b>Seleccionar Curricula</b>                      
      </div>
      
      <div class="content-settings-row">
            <label for="f1">Selecciona tu programa académico:</label>
            	<select name='curricula' id="curricula" style="width:300px">
            {foreach from=$activeCourses item=course}
                    <option value="{$course.courseId}">{$course.majorName} - {$course.name} - {$course.group}</option>
             {/foreach}       
                </select>                    
      </div>   

		<div class="content-settings-row">
            <label for="f1">Tipo de beca:</label>
            	<select name='tipo_beca' id="tipo_beca" style="width:300px"  onChange='habilitando();'>
                    <option value="Ninguno">Ninguno</option>
                    <option value="Particular">Particular</option>
                    <option value="Escolar">Escolar</option>
					<option value="Prodim">PRODIM</option>
					
                </select>                    
      </div>
	  
	  <div class="content-settings-row">
       <label for="f1">Porcentaje de beca :</label>
      <input type="text" name="por_beca" id="por_beca" value="0"   onkeypress="return Numero(event);" style="width:250px"/>% 
	  
      </div>	
-->
	  
      
      <div style="float:left"><span class="reqField">*</span> Campo requerido</div>
      
      
       
</form>