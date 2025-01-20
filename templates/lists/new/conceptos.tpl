<div class="card">
    <div class="card-header bg-primary text-white header_main">
        <div class="sub_header"><i class="fas fa-money-check-alt"></i> Conceptos de pago</div>
        <form action="{$WEB_ROOT}/ajax/new/conceptos.php" method="POST" id="form_concepto" class="form d-inline">
            <input type="hidden" name="opcion" value="agregar-concepto">
            <button type="submit" data-target="#ajax" data-toggle="modal"
            class="btn btn-primary float-right">Agregar concepto <i class="fas fa-plus"></i></button>
        </form> 
    </div>
    <div class="card-body">
        <table class="table table-striped text-center">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Aplica Beca</th>
                    <th>Costo</th>
                    <th>Periodicidad</th>
                    <th>Num. Cobros</th>
                    <th>Días de tolerancia</th> 
                </tr>
            </thead>
            <tbody>
                {foreach from=$conceptos item=item}
                    <tr>
                        <td>{$item.nombre}</td>
                        <td>{($item.descuento == 1) ? "Sí" : "No"}</td>
                        <td>{$item.total|number_format:2:".":","}</td>
                        <td>{$item.periodicidad} día(s)</td>
                        <td>{$item.cobros}</td>
                        <td>{$item.tolerancia} día(s)</td> 
                        <td>
                            <form class="form d-inline" data-target="#ajax" data-toggle="modal" id="form_editar{$item.concepto_id}" action="{$WEB_ROOT}/ajax/new/conceptos.php"
                                method="POST">
                                <input type="hidden" name="concepto" value="{$item.concepto_id}">
                                <input type="hidden" name="opcion" value="editar-concepto">
                                <button class="btn btn-primary">Editar</button>
                            </form>
                            <form class="form d-inline ml-1" action="{$WEB_ROOT}/ajax/new/conceptos.php" method="POST" id="form_eliminar{$item.concepto_id}">
                                <input type="hidden" name="concepto" value="{$item.concepto_id}">
                                <input type="hidden" name="opcion" value="eliminar-concepto">
                                <button class="btn btn-danger" type="submit">Eliminar</button>
                            </form>
                        </td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
</div>

<style>
    .table td{
        white-space: normal;
    }
</style>