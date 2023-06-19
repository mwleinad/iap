<div class="col-md-12">
    <div class="row">
        {foreach from=$noTeam item=item key=key}
            <div class="input-group mb-3 col-md-4">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <input type="checkbox" id="checkbox_alumno{$item.userId}" name="inTeam[]" value="{$item.alumnoId}">
                    </div>
                </div>
                <label type="text" readonly class="form-control pointer d-flex align-items-center"
                    for="checkbox_alumno{$item.userId}">{$item.lastNamePaterno} {$item.lastNameMaterno}
                    {$item.names}</label>
            </div>
        {foreachelse}
            No se encontró ningún registro.
        {/foreach}
        {if $noTeam}
            {if $numberTeams == 0}
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-3 mx-auto">
                            <input type="number" class="form-control" id="number" name="number" placeholder="Número de equipo">
                            <small>En caso de no poner el número, se generará un equipo consecutivo o faltante.</small>
                        </div>
                        <hr class="w-100">
                        <div class="col-md-3 mx-auto text-center mb-3">
                            <input type="hidden" name="opcion" value="crear-equipo">
                            <button class="btn btn-success btn-block" type="submit">Crear equipo</button>
                            <div>
                            </div>
                        </div>
                    {else}
                        <div class="w-100"></div>
                        <div class="mx-auto col-md-8">
                            <div class="row">
                                <div class="col-md-5 mx-auto mb-3">
                                    <select class="form-control" id="opcion" name="opcion">
                                        <option value="crear-equipo">CREAR EQUIPO NUEVO</option>
                                        <option value="agregar-equipo">AÑADIR A UN EQUIPO</option>
                                    </select>
                                </div>
                                <div class="col-md-5 mx-auto mb-3" id="container_number_new">
                                    <input type="number" class="form-control" id="new_number" name="number" placeholder="Número de equipo">
                                    <small>En caso de no poner el número, se generará un equipo consecutivo o faltante.</small>
                                </div>
                                <div class="col-md-5 mx-auto mb-3 d-none" id="container_number">
                                    <select class="form-control" id="number" name="number" disabled>
                                        <option value="">--Selecciona el equipo--</option>
                                        {for $number=1 to $numberTeams}
                                            <option value="{$number}">{$number}</option>
                                        {/for}
                                    </select>
                                </div>
                                <div class="col-md-12 text-center mb-3">
                                    <button class="btn btn-success">Realizar Acción</button>
                                </div>
                            </div>
                        </div>
                        <script>
                            $("#opcion").change(function() {
                                if ($(this).val() == "agregar-equipo") {
                                    $("#container_number").removeClass("d-none");
                                    $("#container_number_new").addClass("d-none");
                                    $("#new_number").prop("disabled", true);
                                    $("#number").prop("disabled", false);
                                } else {
                                    $("#container_number").addClass("d-none");
                                    $("#container_number_new").removeClass("d-none");
                                    $("#new_number").prop("disabled", false);
                                    $("#number").prop("disabled", true);
                                }
                            });
                        </script>
                    {/if}

                {/if}
            </div>
        </div>
{* <tr>
    <td colspan="3" class="text-center">
        <input type="submit" name="Enviar" name="Enviar" value="Crear Equipo con Alumnos Seleccionados" class="btn btn-success" />
    </td>
</tr> *}