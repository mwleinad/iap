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
{if $access == 1}
<form id="addMajorForm" name="addMajorForm" method="post">
<input type="hidden" name="modality" id="modality" value="{$actividad.modality}"
<input type="hidden" id="type" name="type" value="saveAddMajor"/>
<ul id="sort-box" class="sorts">
  <li>              
    <div class="content-in-small">
    
      <div class="content-settings-row">
      	Tiempo Restante: <span id="countdownJobs" style="font-weight:bold">{$timeLeft}</span>
      </div>    
      <div class="content-settings-row">
      	No cerrar esta pagina, de lo contrario tendras que volver a empezar.
      </div>
          
			{foreach from=$myTest item=subject}
      
      <div class="content-settings-row">
            <div style=""><b>{$subject.question} &raquo;Valor: {$subject.ponderation}%</b></div>
            <div style="text-align:left">
            	{if $subject.opcionA}
              <input style="width:50px" type="radio" name="anwer[{$subject.testId}]" id="anwer[{$subject.testId}]" value="opcionA" />{$subject.opcionA}
              {/if}
            	{if $subject.opcionB}
              <div style="clear:both"></div>
              <input style="width:50px" type="radio" name="anwer[{$subject.testId}]" id="anwer[{$subject.testId}]" value="opcionB" />{$subject.opcionB}
              {/if}
            	{if $subject.opcionC}
              <div style="clear:both"></div>
              <input style="width:50px" type="radio" name="anwer[{$subject.testId}]" id="anwer[{$subject.testId}]" value="opcionC" />{$subject.opcionC}
              {/if}
            	{if $subject.opcionD}
              <div style="clear:both"></div>
              <input style="width:50px" type="radio" name="anwer[{$subject.testId}]" id="anwer[{$subject.testId}]" value="opcionD" />{$subject.opcionD}
              {/if}
            	{if $subject.opcionE}
              <div style="clear:both"></div>
              <input style="width:50px" type="radio" name="anwer[{$subject.testId}]" id="anwer[{$subject.testId}]" value="opcionE" />{$subject.opcionE}<br />
              {/if}
            </div>
            
      </div>
			{/foreach}
      
      <div style="float:left"><span class="reqField">*</span> Campo requerido</div>
      <div style="padding-right:60px">

        <input type="submit" class="btn green submitForm" id="addMajor" name="addMajor" value="Enviar" onClick="return confirmSubmit()" />
      </div>
      
    </div>
   </li>                              
 </ul>    
</form>
{else}
	Has agotado tus oportunidades para hacer este examen. Tu calificacion fue de: <b>{$score}%</b>
{/if}

<script language="javascript">
function countdown(remain, count, not, messages) {
	var notifier = document.getElementById(count);
	var countdown = document.getElementById(count)
	var timer = setInterval( function () {
  countdown.innerHTML = Math.floor(remain/60) + ":" + (remain%60 < 10 ? "0": "") + remain %60;
  if (messages[remain]) { notifier.innerHTML = messages[remain]; }
  if (--remain < 0 ) { 
			clearInterval(timer); 
			$('addMajorForm').submit();
		}
  },1000);
}

function confirmSubmit()
{
	var agree=confirm("Estas seguro que deseas enviar tu examen? Respondiste todas las preguntas?");
	if (agree)
		return true ;
	else
		return false ;
}

countdown({$timeLeft}, "countdownJobs", "countdownJobs",
{ 
	60: "Available in one minute",
  30: "30 seconds left",
  0: "Is now Available"
});
</script>