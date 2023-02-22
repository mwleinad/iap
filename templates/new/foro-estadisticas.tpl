<div class="card-header bg-primary text-white">
    <i class="fa fa-chart-bar"></i>Estadísticas del foro
</div>
<div class="card-body bg-white">
    <table class="table text-center">
        <thead>
            <tr>
                <th>ID</th>
                <th>Alumno</th>
                <th>Aportaciones</th>
                <th>Comentarios</th>
            </tr>
        </thead>

        <tbody>
            {foreach from=$estudiantes item=item key=key}
                <tr>
                    <td>{$item.userId}</td>
                    <td>{$item.lastNamePaterno|upper} {$item.lastNameMaterno|upper} {$item.names|upper}</td>
                    <td>{$item.totalAportaciones}</td>
                    <td>{$item.totalComentarios}</td>
                </tr>
            {/foreach}
        </tbody>
    </table>
</div>