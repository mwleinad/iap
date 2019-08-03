<form class="form-horizontal" id="emailrecuperacion" name="emailrecuperacion" method="post">
    <input type="hidden" name="type" id="type" value="recupera">
    <input type="hidden" name="redireccion" id="redireccion" value="0">
    <input type="hidden" name="Error" id="Error" value="">
    <div class="form-body">
        <label for="f1"><span class="reqField"></span>Si deseas recuperar tu contraseña, por favor, ingresa el Correo Electrónico con el que te diste de alta en el Sistema de Educación.</label>
        <br />
        <br />
        <div class="form-group">
            <div class="col-md-8">
                <label for="f1"><span class="reqField"></span> Correo Electrónico:</label>
                <input type="text" name="email" id="email" value="" />
            </div>
        </div>
    </div>

    <div class="form-actions">
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
              
            </div>
        </div>
    </div>
</form>
  <button type="button" class="btn {$BUTTON_COLOR} submitForm" onClick="Recuperacion()">Enviar</button>
