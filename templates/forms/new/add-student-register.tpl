<form class="form-horizontal" id="addStudentForm" name="addStudentForm" method="post"   >
    <input type="hidden" id="type" name="type" value="saveAddStudentRegister"/>
    <input type="hidden" id="redireccion" name="redireccion" value="1"/>
    <input type="hidden" id="tam" name="tam" value="0"/>
    <input type="hidden" id="permiso" name="permiso" value="0"/>
    
			<center>
			<table style="border-collapse: separate;
  border-spacing: 4px 30px;">
				<tr>
					<td>Nombre:<br><input type="text" name="names" class="form-control"></td>
					<td>Apellido Paterno:<br><input type="text" name="lastNamePaterno" class="form-control"></td>
					<td>Apellido Materno:<br><input type="text" name="lastNameMaterno" class="form-control"></td>
					<td>Email:<br><input type="text" name="email" class="form-control"></td>

				</tr>
				
				<tr>
					<td>Celular:<br><input type="text" name="mobile" class="form-control"></td>
					<td>Municipio:<br>
					<select id="ciudad" name="ciudad" style="width:250px"   class="form-control">
                        <option value="0">Selecciona....</option>
                        {foreach from=$paises item=pais}
                            <option value="{$pais.municipioId}">{$pais.nombre} </option>
                        {/foreach}
                    </select></td>
					<td>Tipo de Solicitante:<br>
					<select id="tipoSolicitante" name="tipoSolicitante" style="width:250px"   class="form-control">
                        <option value="0">Selecciona....</option>
                        {foreach from=$lstSolicitante item=pais}
                            <option value="{$pais.solicitanteId}">{$pais.nombre} </option>
                        {/foreach}
                    </select>
					</td>
					<td>Certificación:<br>
					
					  <select name='curricula' id="curricula" style="width:400px" class="form-control"><option value="0">Selecciona....</option>
                        {foreach from=$activeCourses item=course}
                            <option value="{$course.courseId}">{$course.majorName} - {$course.name} - {$course.group}</option>
                        {/foreach}
                    </select>
					
					</td>

				</tr>
			</table>
			</center>

           
       
    
   

</form>
<div id="loader">
</div>
<center>
 <div class="">
        <div class="">
				<br>
				<br>
				<br>
                <button type="button" class="btn default" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn green submitForm" onclick="AddStudentRegister();" id="addStudent" >Guardar</button>
         
        </div>
    </div>
    </center>
	<br>
	<br><!--
	<div>
	<a href="{$WEB_ROOT}/graybox.php?page=aviso" data-target="#ajax" data-toggle="modal" data-width="1000px" title='AVISO DE PRIVACIDAD'>
	<font style="color:#73b760; font-weight: bold;">Aviso de Privacidad
	</font>
	</a>
	</div>-->
