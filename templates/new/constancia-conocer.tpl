{if $curso.constancia}
    <div class="card mb-4">
        <div class="card-header bg-primary text-white">
            <i class="fas fa-file-signature"></i> Generar Constancia - {$curso.name}
        </div>
        <div class="card-body">
            <table class="table" id="datatable" data-url="{$WEB_ROOT}/ajax/new/course.php">
                <thead>
                    <tr>
                        <th>Control</th>
                        <th>Alumno</th> 
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>

    <script>
        $("#datatable").DataTable({
            processing: true,
            serverSide: true,
            responsive: true,
            ajax: {
                url: $("#datatable").data('url'),
                dataType: "json",
                type: "POST",
                data: {
                    _token: $("meta[name='csrf-token'] ").attr('content'),
                    option: 'dt_constancias_conocer',
                    curso: {$curso.courseId}
                }
            },
            language: {
                url: "https://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
            },
            columns: [
                { data: "control" },
                { data: "alumno" }, 
                { data: "acciones" }
            ],
        });
    </script>
{else}
    <div class="alert alert-warning text-center p-5 m-0">La generación de constancias no está activada para este curso.
    </div>
{/if}