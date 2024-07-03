<div class="card">
    <div class="card-body">
        {if $diploma}
            Documento válido para el alumno: {$diploma.alumno.names} {$diploma.alumno.lastNamePaterno} {$diploma.alumno.lastNameMaterno}
        {else}
            Documento no válido
        {/if}
    </div>
</div>