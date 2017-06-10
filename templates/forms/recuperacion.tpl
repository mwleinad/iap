 <form id="emailrecuperacion" name="emailrecuperacion" method="post">
 <input type="hidden" name="type" id="type" value="recupera">
  <input type="hidden" name="redireccion" id="redireccion" value="0">
 <input type="hidden" name="Error" id="Error" value="">
	
  <div class="content-settings-row">
            <label for="f1"> Para recuperar tu contraseña ingresa tu email </label>
                               
      </div>

	<div class="content-settings-row">
            <label for="f1"><span class="reqField">*</span> Email:</label>
            <input type="text" name="email" id="email"  />                      
      </div>

	     <div style="padding-right:60px">                 
      
      <input type="button" class="btn-140" id="Recuperacion"  onclick="Recuperacion();" value="Recuperar" name="Recuperacion" />                  
      </div>
</form>