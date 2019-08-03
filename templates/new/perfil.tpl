<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorn"></i>Perfil
        </div>
        <div class="actions">

        </div>
    </div>
    <div class="portlet-body">
	
		<center>
					<form id="frmFoto">
						
						<input type="hidden" name="userId" class='form-control' value='{$info.userId}'>
						<div ><!--
							<img src='{$foto}' style='width: 100px !important'>-->
							<div class="profile-userpic">
							<img src="{{$infoStudent.imagen}}?{$rand}" class="img-responsive" alt=""> </div>
							<div style='position: relative; 
							bottom:0px; width:100%; margin-right: -100px;'>
							<span class="btn btn-default btn-file">
							<input type="file" name="archivos" id="archivos" onChange="onChangePicture({$info.userId})" class="btn-file" style="border: 0px solid !important">
							<i class="material-icons md-16 icon-green"  >create</i>
							</span>
							
							</div>
							</a>
						</div>
					</form>
					<br>
					<br>

					<b>Cuéntanos mas acerca de ti, incluye datos como edad, formación académica y profesional, intereses personales y algunos aspectos que permitan a tus compañeros conocerte 
					</b>
					<br>
					<b>(Esta información será visible para tu asesor y demás compañeros)</b>
					<br><br><br><br>
					<form id="frmGral">
					<input type="hidden" name="type" value="onSavePerfil">
					<textarea name='desc' id='desc'>{$info.perfil}</textarea>
					<br>
					</form>
					<button class="btn {$BUTTON_COLOR}" type="button" onClick="onSavePerfil()">Guardar</button>
					
				</center>
    </div>
</div>

<script type="text/javascript">
	tinyMCE.init({
		mode : "textareas",
		theme : "advanced",
		skin : "o2k7",
		plugins : "paste",
		theme_advanced_buttons3_add : "pastetext,pasteword,selectall",
		paste_auto_cleanup_on_paste : true,
		paste_preprocess : function(pl, o) {
			// Content string containing the HTML from the clipboard
			o.content = "-: CLEANED :-\n" + o.content;
		},
		paste_postprocess : function(pl, o) {
			// Content DOM node containing the DOM structure of the clipboard
			o.node.innerHTML = o.node.innerHTML + "\n-: CLEANED :-";
		}


	});
</script>