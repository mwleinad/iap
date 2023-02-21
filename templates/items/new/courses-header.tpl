<tr class="text-center">
    {if $User.type ne 'Docente'}
        <th class="font-weight-bold">ID</th>
    {/if}
    <th class="font-weight-bold">RVOE</th>
    <th class="font-weight-bold">Tipo</th>
    <th class="font-weight-bold">Nombre</th>
    <th class="font-weight-bold">Grupo</th>
    <th class="font-weight-bold">Modalidad</th>
    <th class="font-weight-bold">Fecha Inicial</th>
    <th class="font-weight-bold">Fecha Final</th>
    <th class="font-weight-bold break-line">Modulos (A/T)</th>
    <th class="font-weight-bold">Alumnos (A/I)</th>
    <th class="font-weight-bold">Activo</th>
    {if !$docente}
        <th class="font-weight-bold">Acciones</th>
    {/if}
</tr>