<script language="JavaScript">
var nav4 = window.Event ? true : false;
function habilitar() {
       if(editSubjectForm.tipo_beca.value=="Ninguno")
    editSubjectForm.por_beca.disabled = true;
	else
	editSubjectForm.por_beca.disabled = false;
	
	
	
}

function IsNumber(evt){
// Backspace = 8, Enter = 13, ’0' = 48, ’9' = 57, ‘.’ = 46
var key = nav4 ? evt.which : evt.keyCode;
return (key <= 13 || (key >= 48 && key <= 57) || key == 46);
}
</script>

<form id="frmAddCurricula" name="frmAddCurricula" method="post">
<input type="hidden" id="userId" name="userId" value="{$id}"/>
<input type="hidden" id="type" name="type" value="addCurriculaStudent"/>
<ul id="sort-box" class="sorts">
  <li>              
    <div class="content-in-popup">
		<center>
            <label for="f1"><span class="reqField">*</span> Selecciona Curricula:</label>
			<br>
            <select name="courseId" id="courseId" style="width:500px" onChange="viewCourse()" class="form-control">
				 <option value=""></option>
            {foreach from=$curricula item=curso}
  	         
  	          <option value="{$curso.courseId}">{$curso.majorName} - {$curso.name} -  {$curso.group} -  {$curso.courseId}</option>
            {/foreach}  
            </select>
		</center>
	{if $positionId==1}	  
	   <div class="content-settings-row">
            <label for="f1">Tipo de beca:</label>
            	<select name='tipo_beca' id="tipo_beca" style="width:350px"  onChange='habilitar()'>
                    <option value="Ninguno">Ninguno</option>
                    <option value="Particular">Particular</option>
                    <option value="Escolar">Escolar</option>
					<option value="Prodim">PRODIM</option>
					
     </select>                    
      </div>
  
	  <div class="content-settings-row">
       <label for="f1">Porcentaje de beca :</label>
      <input type="text" name="por_beca" id="por_beca" value="0"  onkeypress="return IsNumber(event);" style="width:330px"/>% 
	  
      </div>
	  {/if}
	          
		<div id="tblContentGray"></div>
	  

      <div style="float:left"><span class="reqField">*</span> Campo requerido</div>
      <div style="padding-right:60px">                 
	  <!--
      <input type="submit" class="btn-70-l" onclick=";"  id="saveEditSubject" name="saveEditSubject" value="." />--> 
                  <div class="form-actions">
					<div class="row">
						<div class="col-md-offset-3 col-md-9">
							<button type="button" class="btn default" data-dismiss="modal">Salir</button>
							<button type="submit" class="btn green submitForm" onClick="addModuls()">Guardar</button>
						</div>
					</div>
				</div>
      </div>
      
    </div>
   </li>                              
 </ul>    
</form>