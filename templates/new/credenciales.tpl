<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-file-contract"></i> Credenciales
    </div>
    <div class="card-body">
        <table class="table" id="datatable" data-url="{$WEB_ROOT}/credenciales">
            <thead>
                <tr>
                    <th>Solicitud ID</th>
                    <th>Fecha</th> 
                    <th>Alumno</th>
                    <th>Tipo</th>
                    <th>Currícula</th>
                    <th>Grupo</th>
                    <th>Foto</th>
                    <th>Estatus</th> 
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</div>
<style>
    .compact{
        max-width: 200px;
        white-space: normal !important;
    }
</style>
<script src="{$WEB_ROOT}/javascript/new/html2canvas.js"></script> 