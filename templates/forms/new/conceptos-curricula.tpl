{if $opcion eq "guardar-curricula-concepto"}
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h4>
                <i class="fas fa-money-check-alt"></i> Relación de conceptos
            </h4>
        </div>
        <form class="form row card-body" id="form_concepto" action="{$WEB_ROOT}/ajax/new/conceptos.php" method="POST">
            <input type="hidden" name="opcion" value="{$opcion}">
            <input type="hidden" name="subjectId" value="{$subjectId}">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <td>Nombre</td>
                        <td>Seleccionar</td>
                    </tr>
                </thead>
                <tbody>
                    {$contador = 0}
                    {foreach from=$conceptos item=item}
                        <tr>
                            <td class="py-2"><label for="concepto_{$item.concepto_id}">{$item.nombre}</label></td>
                            <td class="py-2">
                                {if $item.cobros ne ""}
                                    {$contador = $contador+1}
                                    <a class="btn btn-sm btn-primary ajax_sin_form" href="{$WEB_ROOT}/ajax/new/conceptos.php"
                                        data-data='"opcion":"editar-curricula-concepto","concepto":{$item.concepto_subject_id}'>
                                        Editar concepto
                                    </a>
                                    {if $item.cobros > 0}
                                        <a class="btn btn-sm btn-info ajax_sin_form text-white" href="{$WEB_ROOT}/ajax/new/conceptos.php" data-data='"opcion":"periodos-concepto","concepto":{$item.concepto_subject_id}'>
                                            Editar periodos
                                        </a>
                                    {/if}
                                    <a class="btn btn-sm btn-danger text-white ajax_sin_form" data-data='"opcion":"eliminar-curricula-concepto","concepto":"{$item.concepto_subject_id}"' href="{$WEB_ROOT}/ajax/new/conceptos.php">Eliminar</a> 
                                {else}
                                    <input type="checkbox" id="concepto_{$item.concepto_id}" class="form-check m-0"
                                        name="conceptos[]" value="{$item.concepto_id}">
                                {/if}
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
                {if $contador < count($conceptos)}
                    <tfoot>
                        <tr>
                            <th colspan="2" class="text-center">
                                <button type="submit" class="btn btn-success">Guardar</button>
                            </th>
                        </tr>
                    </tfoot>
                {/if}
            </table>
        </form>
    </div>
{else}
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h4>
                <i class="fas fa-money-check-alt"></i> Edición de información del concepto
            </h4>
        </div>
        <form class="form row card-body" id="form_concepto_modal" action="{$WEB_ROOT}/ajax/new/conceptos.php" method="POST">
            <input type="hidden" name="opcion" value="{$opcion}">
            <input type="hidden" name="conceptoId" value="{$concepto.concepto_subject_id}">
            <div class="col-md-4 mb-3">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" name="nombre" id="nombre" value="{$concepto.nombre}">
                <span class="invalid-feedback"></span>
            </div>
            <div class="input-group mb-3 col-md-4">
                <label for="costo" class="w-100">Costo</label>
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">$</span>
                </div>
                <input type="text" class="form-control money" name="costo" id="costo" placeholder="0.00" aria-label="costo"
                    aria-describedby="basic-addon1" value="{$concepto.total}">
            </div>
            <div class="col-md-4 mb-3">
                <label for="beca">Aplica Beca</label>
                <select class="form-control" id="beca" name="beca">
                    <option value="1">Sí</option>
                    <option value="0" {($edicion && $concepto.descuento == 0) ? "selected" : ""}>No</option>
                </select>
                <span class="invalid-feedback"></span>
            </div>
            <div class="col-md-4 mb-3">
                <label class="cobros">Número de Cobros</label>
                <input type="number" class="form-control" min="0" step="1" name="cobros" id="cobros"
                    value="{$concepto.cobros}">
                <span class="invalid-feedback"></span>
            </div>
            <div class="col-md-4 mb-3 d-none" id="seccion_periodicidad">
                <label class="periodicidad">Periodicidad(en días)</label>
                <input type="number" class="form-control" min="0" step="1" name="periodicidad" id="periodicidad"
                    value="{$concepto.periodicidad}">
                <span class="invalid-feedback"></span>
            </div>
            <div class="col-md-4 mb-3 d-none" id="seccion_tolerancia">
                <label class="tolerancia">Tolerancia(en días)</label>
                <input type="number" class="form-control" min="0" step="1" name="tolerancia" id="tolerancia"
                    value="{$concepto.tolerancia}">
                <span class="invalid-feedback"></span>
            </div>
            <div class="col-12 mb-3 text-center">
                <button type="submit" class="btn btn-success">Actualizar</button>
                <a class="btn btn-danger ajax_sin_form" href="{$WEB_ROOT}/ajax/new/conceptos.php" data-data='"opcion":"curricula-conceptos","subjectId":"{$concepto.subject_id}"'>Regresar</a>
            </div>
        </form>
    </div>
    <script>
        opcion($("#cobros").val());
        $("#cobros").on("change", function() {
            opcion($(this).val());
        });

        function opcion(valor) {
            if (valor > 0) {
                $("#seccion_periodicidad, #seccion_tolerancia, #seccion_inicio").removeClass("d-none");
            }
            if (valor == 0) {
                $("#seccion_periodicidad, #seccion_inicio, #seccion_tolerancia").addClass("d-none");
                $("#periodicidad").val(0);
            }
        }
    </script>
{/if}