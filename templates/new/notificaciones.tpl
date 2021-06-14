<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-home"></i>                 
        </span>
        Bienvenido
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
        <li class="breadcrumb-item active" aria-current="page">
            <span></span>IAP Chiapas
            <i class="mdi mdi-checkbox-marked-circle-outline icon-sm text-primary align-middle"></i>
        </li>
        </ul>
    </nav>
</div>
<div class="row">
    <div class="col-md-3">
        {if $User.type eq 'student'}
            {include file="new/card_student.tpl"}
        {/if}
        {if $User.type eq 'Docente'}
            {include file="new/card_docente.tpl"}
        {/if}
    </div>
    <div class="col-md-9">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Notificaciones</h4>
                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                    {if count($notificaciones) > 0}
                                        <tr>
                                            <td colspan="3" class="text-center font-weight-bold">Notificaciones</td>
                                        </tr>
                                        {foreach from=$notificaciones item=reply}
                                            {if $reply.vistaPermiso==1}
                                                <tr>
                                                    <td>{$i++}</td>
                                                    <td>
                                                        <a href="{$WEB_ROOT}{$reply.enlace}" target="_blank" class="text-primary">
                                                            <small>{$reply.actividad}<br>
                                                            <b>Por: {$reply.nombre}</b></small>
                                                        </a>
                                                    </td>
                                                    <td>{$reply.fecha_aplicacion|date_format:"%d-%b-%y"}</td>
                                                </tr>
                                            {/if}
                                        {/foreach}
                                    {/if}
                                    {if count($announcements) > 0}
                                        <tr>
                                            <td colspan="3" class="text-center font-weight-bold">Avisos</td>
                                        </tr>
                                        {foreach from=$announcements item=item}
                                            <tr>
                                                <td>{$i++}</td>
                                                <td>
                                                    <a class="data-alert text-primary" data-title="{$item.title}" data-text="{$item.description}">
                                                        <small>{$item.title}</small>
                                                    </a>
                                                </td>
                                                <td><small>{$item.date|date_format:"%d-%b-%y"}</small></td>
                                            </tr>
                                        {/foreach}
                                    {/if}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>