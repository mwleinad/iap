<div class='modal-title text-center mt-3'>
    <h1>{($credencial.status == 0) ? "Vista previa de la credencial" : "Credencial aceptada"}</h1>
</div>
<div class="col-md-9 col-lg-7 col-lx-6 mx-auto p-5 seccion-credencial">
    {* Credencial pendiente *}
    {if $credencial.status == 0}
        <div class="credencial_previo">
            <div class="nombre_previo">
                {$alumno.names|upper} {$alumno.lastNamePaterno|upper} {$alumno.lastNameMaterno|upper}
            </div>
            <div class="usuario_previo">
                <span>No. Usuario:</span> {$alumno.controlNumber}
            </div>
            <div class="curricula_previa">
                {$curso}
            </div>
            <img src="{$WEB_ROOT}/images/credencial/frontal.png" class="img-fluid">
            <picture class='img_credencial_previo'>
                <img src="https://lh3.google.com/u/0/d/{$credencial.files['photo']['googleId']}" class="img-fluid">
            </picture>
            <div class="vigencia">
                <span>Vigencia</span><br>
                31 de diciembre {date('Y')}
            </div>
        </div>
    {/if}
    {* Credencial aceptada *}
    {if $credencial.status == 1}
        <a href=" https://drive.google.com/uc?export=download&id={$credencial.files['credential']['googleId']}">
            <img src="https://lh3.google.com/u/0/d/{$credencial.files['credential']['googleId']}" class="img-fluid">
        </a>
    {/if}

</div>
{* Si la credencial se encuentra pendiente *}
{if $credencial.status == 0}
    <div class="col-md-12 text-center mb-3">
        <form class='d-inline form' action='{$WEB_ROOT}/ajax/new/credenciales.php' method='POST'
            id='form_aceptar{$credencial.id}'>
            <input type='hidden' name='opcion' value='validar'>
            <input type='hidden' name='aceptado' value='1'>
            <input type='hidden' name='credencial' value='{$credencial.id}'>
            <input type="hidden" name="foto" value="" id="foto64">
            <button class='btn btn-info' type='submit'>Aceptar</button>
        </form>
        <form class='d-inline form' action='{$WEB_ROOT}/ajax/new/credenciales.php' method='POST'
            id='form_rechazar{$credencial.id}'>
            <input type='hidden' name='opcion' value='validar'>
            <input type='hidden' name='aceptado' value='0'>
            <input type='hidden' name='credencial' value='{$credencial.id}'>
            <button class='btn btn-danger' type='submit'>Rechazar</button>
        </form>
    </div>

    <div id="credencial_frontal"
        style="position:absolute; right:-1000%;min-width: 1110px; max-width:1110px; min-height: 700px; max-height:700px;">
        <div class="p-0 credencial_previo position-relative">
            <img src="{$WEB_ROOT}/images/credencial/frontal.png" class="img-fluid">
            <div class="nombre_previo">
                {$alumno.names|upper} {$alumno.lastNamePaterno|upper} {$alumno.lastNameMaterno|upper}
            </div>
            <div class="usuario_previo">
                <span>No. Usuario:</span> {$alumno.controlNumber}
            </div>
            <div class="curricula_previa">
                {$curso}
            </div>
            <picture class='img_credencial_previo'>
                <img src="{$WEB_ROOT}/files/credentials/{$credencial.files['photo']['filename']}" class="img-fluid">
            </picture>
            <div class="vigencia"><span>Vigencia:</span><br>31 de diciembre {date('Y')} </div>
        </div>
    </div>
    <script src="{$WEB_ROOT}/javascript/new/html2canvas.js"></script>
    {literal}
        <script>
            const credencialFrontal = document.getElementById('credencial_frontal');
            html2canvas(credencialFrontal,{scale:1}).then(canvas => {
            let foto = canvas.toDataURL();
            document.getElementById('foto64').setAttribute('value', foto);
            });
        </script>
    {/literal}
{/if}