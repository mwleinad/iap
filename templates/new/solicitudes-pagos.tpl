<div class="card mb-4">
    <div class="card-header bg-primary text-white header_main">
        <div class="sub_header"><i class="fas fa-file-contract"></i> Solicitudes de pago</div>
    </div>
    <div class="card-body">
        <table class="table" id="datatable" data-url="{$WEB_ROOT}/solicitudes-pagos">
            <thead>
                <tr>
                    <th>Pago ID</th>
                    <th>Fecha</th>
                    <th>Tipo</th>
                    <th>Nombre</th>
                    <th>Grupo</th>
                    <th>Alumno</th>
                    <th>Concepto</th>
                    <th>Estatus</th>
                    <th>Acciones</th>
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