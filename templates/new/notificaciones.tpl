<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-bell"></i>                 
        </span>
        Notificaciones
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>IAP Chiapas
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>

<div class="card mb-4">
    {*<div class="card-header bg-primary text-white"></div>*}
    <div class="card-body">
        <div class="table table-responsive">
            <table class="table table-bordered table-hover table-sm">
                <thead>
                    <tr>
                        <th class="font-weight-bold">Fecha</th>
                        <th class="font-weight-bold">Notificación</th>
                        <th class="font-weight-bold">Realizado Por</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$notificaciones item=reply}
                        {if $reply.vistaPermiso==1}
                            <tr>
                                <td>{$reply.fecha_aplicacion|date_format:"%d %b '%y"}</td>
                                <td class="break-line">
                                    <a href="{$WEB_ROOT}{$reply.enlace}">
                                        {$reply.actividad}
                                    </a>
                                </td>
                                <td>{$reply.nombre}</td>
                            </tr>
                        {/if}
                    {/foreach}
                </tbody>
            </table>
        </div>
    </div>
</div>