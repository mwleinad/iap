<hr>
<a class="btn green submitForm" href="javascript:;" onClick="SaveMsj('{$infoC.courseModuleId}','activo','{$chatId}')" data-title="Trash">Enviar</a>
<a class="btn default" href="javascript:;" onClick="SaveMsj('{$infoC.courseModuleId}','borrador','{$chatId}')" data-title="Trash">Descartar</a>
<a class="btn default" href="javascript:;" onClick="SaveMsj('{$infoC.courseModuleId}','borrar','{$chatId}')" data-title="Trash">Borrar</a>
<hr>
<table>
	<tr>
		<td>
			De:
		</td>
		<td>
			&nbsp;
			&nbsp;
			&nbsp;
			<b>{$de}</b>
		</td>
	</tr>
	<tr>
		<td>
			Para:</b>
		</td>
		<td>
			&nbsp;
			&nbsp;
			&nbsp;
			<b>{$para}</b>
		</td>
	</tr>
	<tr>
		<td>
			Asunto:
		</td>
		<td>
			&nbsp;
			&nbsp;
			&nbsp;
			<input type="text" name="subject2"  id="subject2" style="border:0px; border-bottom: 3px solid #32c5d2; width:333px"  value='' placeholder=''>
		</td>
	</tr>
</table>
<br>
<form id="frmGral" name="frmGral"  method="post" > 
<input type="hidden" name="subject1"  id="subject1"  value='{$subject}' >
<input type="hidden" name="chatId" id="chatId" value='{$infoC.chatId}' >
<input type="hidden" name="yoId" id="yoId" value='{$infoC.yoId}' >
<input type="hidden" name="type" id="type">
{if $infoC.rutaAdjunto ne ''}
	<!--<font color="#447d98">Archivo Adjunto</font>
	<br>
	<a href="{$WEB_ROOT}/doc_inbox/{$infoC.rutaAdjunto}" target='blank_'>
		<img src="{$WEB_ROOT}/images/adjuntofile.jpg" style="width:5%">
	</a>
	<br>
	<br>-->
{/if}
<textarea name="mensaje" id="mensaje"  style="width:900px; height:300px;  ">{if $chatId ne 0}<br><br><br><br><br><hr>{$dataEnviado}{/if}</textarea>
<br>
<span class="btn btn-default btn-file">
<img src="{$WEB_ROOT}/images/mas.png" style="width:10%">
<input type="file" name="archivos" id="archivos" class="btn-file" onChange="verArchivo()">
Agregar Archivo
</span>
<div id="divFileAdjunto" style="display:none">Archivo Adjunto...</div>
</form>
<hr>

<hr>
<a class="btn green submitForm" href="javascript:;" onClick="SaveMsj('{$infoC.courseModuleId}','activo','{$chatId}')" data-title="Trash">Enviar</a>
<a class="btn default" href="javascript:;" onClick="SaveMsj('{$infoC.courseModuleId}','borrador','{$chatId}')" data-title="Trash">Descartar</a>
<a class="btn default" href="javascript:;" onClick="SaveMsj('{$infoC.courseModuleId}','borrar','{$chatId}')" data-title="Trash">Borrar</a>


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