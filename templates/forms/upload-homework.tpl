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
<form id="addMajorForm" name="addMajorForm" method="post" enctype="multipart/form-data">
<input type="hidden" name="courseId" id="courseId" value="{$actividad.courseModuleId}"
<input type="hidden" name="modality" id="modality" value="{$actividad.modality}"
<input type="hidden" id="type" name="type" value="saveAddMajor"/>
<ul id="sort-box" class="sorts">
  <li>              
    <div class="content-in-small">
			{if $homework}
      <div class="content-settings-row">
            <label for="f1"><span style="color:#33CC00; font-weight:bold"> Ya has subido esta Tarea.</span></label>
            <a href="{$WEB_ROOT}/download.php?file=homework/{$homework.path}&mime={$homework.mime}">Ver Tarea</a>
			
      </div>
      {/if}

      <div class="content-settings-row">
            <label for="f1"><span class="reqField"></span> Actividad:</label>
            {$actividad.modality}
      </div>

      <div class="content-settings-row">
            <label for="f1"><span class="reqField"></span> Fecha Limite:</label>
            {$actividad.finalDate}
      </div>

      <div class="content-settings-row">
            <label for="f1"><span class="reqField">*</span> Titulo:</label>
            <input type="text" name="nombre" id="nombre" value="" maxlength="100"/>
      </div>
      
      <div class="content-settings-row">
            <label for="f1"><span class="reqField">*</span> Tarea:</label>
            <input type="file" name="path" id="path" size="34"/>                      
      </div>

      
      <div style="float:left"><span class="reqField">*</span> Campo requerido</div>
      <div style="padding-right:60px">                 
      <input type="submit" class="btn-70-l" id="addMajor" name="addMajor" value="." />                  
      </div>
      
    </div>
   </li>                              
 </ul>    
</form>