<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Editar Preguntas
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body">
        <div id="tblContent">

<!-- TinyMCE -->
<script type="text/javascript" src="{$WEB_ROOT}/tinymce/tiny_mce.js"></script>
<script type="text/javascript">
	tinyMCE.init({
		mode : "textareas",
		theme : "advanced",
		skin : "o2k7"		
		
	});
</script>
<!-- /TinyMCE -->
<form id="editMajorForm" name="editMajorForm" method="post">
<input type="hidden" id="type" name="type" value="saveAddMajor"/>
<input type="hidden" id="Id" name="Id" value="{$id}"/>
            
    <div class="content-in-small">
      
      <div class="content-settings-row">
            <label for="f1"><span class="reqField">*</span> Pregunta:</label>
            <input type="text" name="question" id="question" value="{$question.question}"  class="form-control"/>
      </div>

      <div class="content-settings-row">
            <label for="f1"> Opcion A:</label>
            <input type="text" name="opcionA" id="opcionA" value="{$question.opcionA}"  class="form-control"/>
      </div>

      <div class="content-settings-row">
            <label for="f1"> Opcion B:</label>
            <input type="text" name="opcionB" id="opcionB" value="{$question.opcionB}"  class="form-control"/>
      </div>

      <div class="content-settings-row">
            <label for="f1">Opcion C:</label>
            <input type="text" name="opcionC" id="opcionC" value="{$question.opcionC}"  class="form-control"/>
      </div>

      <div class="content-settings-row">
            <label for="f1"> Opcion D:</label>
            <input type="text" name="opcionD" id="opcionD" value="{$question.opcionD}"  class="form-control"/>
      </div>

      <div class="content-settings-row">
            <label for="f1"> Opcion E:</label>
            <input type="text" name="opcionE" id="opcionE" value="{$question.opcionE}"  class="form-control"/>
      </div>
      <div class="content-settings-row">
            <label for="f1"><span class="reqField">*</span> Respuesta:</label>
            <select id="answer" name="answer" class="form-control">
            	<option value="opcionA" {if $question.answer == "opcionA"} selected="selected"{/if}>Opcion A</option>
            	<option value="opcionB" {if $question.answer == "opcionB"} selected="selected"{/if}>Opcion B</option>
            	<option value="opcionC" {if $question.answer == "opcionC"} selected="selected"{/if}>Opcion C</option>
            	<option value="opcionD" {if $question.answer == "opcionD"} selected="selected"{/if}>Opcion D</option>
            	<option value="opcionE" {if $question.answer == "opcionE"} selected="selected"{/if}>Opcion E</option>
            </select>                      
      </div>
      <div style="float:left"><span class="reqField">*</span> Campo requerido</div>
	  <br>
	  <br>
    </div>
</form>
      </div>
    </div>
</div>  
<center>
<div id="msj"></div>
 <button type="submit" class="btn {$BUTTON_COLOR}"  id="addMajor" name="addMajor" value="Editar" onClick="EditTest()"> Editar </button>
</center>
