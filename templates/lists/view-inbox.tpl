<hr>
<a class="btn {$BUTTON_COLOR} submitForm" href="{$WEB_ROOT}/reply-inbox/id/{$courseMId}/cId/{$chatId}&or={$or}"  data-title="Trash">Responder</a>
<a class="btn default" href="javascript:;" onClick="SaveMsj('{$infoC.courseModuleId}','borrador','{$chatId}')" data-title="Trash">Descartar</a>
<a class="btn default" href="javascript:;" onClick="SaveMsj('{$infoC.courseModuleId}','borrar','{$chatId}')" data-title="Trash">Borrar</a>
<hr>
<!--
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
			<input type="text" name="subject2"  id="subject2" style="border:0px; border-bottom: 1px solid gray" value='' placeholder=''>
		</td>
	</tr>
</table>-->
<br>
<form id="frmGral" name="frmGral"  method="post" > 
<input type="hidden" name="subject1"  id="subject1"  value='{$subject}' >
<input type="hidden" name="chatId" id="chatId" value='{$infoC.chatId}' >
<input type="hidden" name="yoId" id="yoId" value='{$infoC.yoId}' >
<input type="hidden" name="type" id="type">
{if $infoC.rutaAdjunto ne ''}
	<font color="#447d98">Archivo Adjunto</font>
	<br>
	<a href="{$WEB_ROOT}/doc_inbox/{$infoC.rutaAdjunto}" target='blank_'>
		<img src="{$WEB_ROOT}/images/adjuntofile.jpg" style="width:5%">
	</a>
	<br>
	<br>
{/if}
{$dataEnviado}
<br>

</form>
<hr>

<hr>



<script type="text/javascript">
    tinyMCE.init({
        mode : "textareas",
        theme : "advanced",
        skin : "o2k7"

    });
</script>