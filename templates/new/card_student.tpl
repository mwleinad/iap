<div class="card">
    {if $infoStudent.imagen ne ''}
        <img class="card-img-top" src="{$infoStudent.imagen}" alt="" />
    {else}
        <div class="text-center mt-3">
            <i class="fas fa-user-circle fa-6x"></i>
        </div>
    {/if}
    <div class="card-body">
        <h5 class="card-title text-center">{$User['nombreCompleto']}</h5>
        <p class="card-text">El <b>Instituto de Administración Pública del Estado de Chiapas, A. C.</b> te da la más cordial bienvenida a nuestro Sistema de Educación en Línea.</p>
    </div>
    <div class="card-footer text-center">
        <a href="https://www.iapchiapas.edu.mx" target="_blank" class="text-primary">
            <i class="fas fa-link"></i> iapchiapas.edu.mx
        </a><br><br>
        <a href="https://www.facebook.com/IAPChiapas" target="_blank" class="text-primary">
            <i class="fab fa-facebook"></i> IAPChiapas
        </a>
    </div>
</div>