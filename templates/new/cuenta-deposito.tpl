<div class="card">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-piggy-bank"></i> Cuenta para déposito
    </div>
    {if isset($certificacion)}
        <div class="card-body text-center">
            <img src="{$WEB_ROOT}/images/new/pagos_certificaciones.jpeg" class="img-fluid">
        </div>
    {else}
        <div class="card-body text-center">
            <p style="font-size: 1.5rem;">
                A efectos de poder realizar los pagos a este instituto, proporciono a Usted; la siguiente información:
            </p>
            <h1>BANCO: <b class="text-danger">{$banco}</b></h1>
            <h1>NOMBRE DE LA CUENTA: <b class="text-danger">{$nombre_cuenta}</b></h1>
            <table class="table">
                <thead>
                    <tr>
                        <th>
                            <label class="h3"><b>Método de pago</b></label>
                        </th>
                        <th>
                            <label class="h3"><b>Datos bancarios requeridos</b></label>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$data item=item}
                        <tr>
                            <td>
                                <label class="h4" style="white-space: break-spaces;">{$item.metodo}</label>
                            </td>
                            <td>
                                <label class="h4" style="white-space: break-spaces;">{$item.dato}</label>
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2">
                            <p style="font-size: 1rem;">
                                Nota Aclaratoria:<br>
                                - Correo de notificación: <a
                                    href="mailto:ctperez@iapchiapas.edu.mx">ctperez@iapchiapas.edu.mx</a><br>
                                - Correo de notificación: <a
                                    href="mailto:facturaelectronica@iapchiapas.edu.mx">facturaelectronica@iapchiapas.edu.mx</a>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <a target="_blank" style="font-size: 2rem;" class="btn btn-link"
                                href="{$WEB_ROOT}/pdf/CUENTA_PARA_DEPOSITO_POSGRADOS.pdf">
                                Descargar pdf <i class="fa fa-file-pdf"></i>
                            </a>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
    {/if}
</div>