<div class="col-md-12">
    <div class="row">
        {foreach from=$noTeam item=item key=key}
            <div class="input-group mb-3 col-md-4">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <input type="checkbox" id="checkbox_alumno{$item.userId}" name="inTeam[]" value="{$item.alumnoId}">
                    </div>
                </div>
                <label type="text" class="form-control" for="checkbox_alumno{$item.userId}">{$item.lastNamePaterno} {$item.lastNameMaterno} {$item.names}</label>
            </div>  
        {foreachelse} 
            No se encontró ningún registro. 
        {/foreach}
        {if $noTeam}
            {if $numberTeams == 0}
                <div class="col-md-12 text-center mb-3">
                    <input type="hidden" name="opcion" value="crear-equipo">
                    <button class="btn btn-success" type="submit">Crear equipo</button>
                <div>
            {else}
                <div class="w-100"></div>
                <div class="col-md-6 mx-auto mb-3">
                    <select class="form-control" id="opcion" name="opcion">
                        <option value="crear-equipo">CREAR EQUIPO NUEVO</option>
                        <option value="agregar-equipo">AÑADIR A UN EQUIPO</option>
                    </select>
                </div>
                <div class="col-md-6 mb-3 d-none" id="container-number">
                    <select class="form-control" id="number" name="number">
                        {for $number=1 to $numberTeams}
                            <option value="{$number}">{$number}</option>
                        {/for}
                    </select>
                </div>
                <div class="col-md-12 text-center mb-3">
                    <button class="btn btn-success">Realizar Acción</button>
                </div>
                <script>
                    $("#opcion").change(function(){
                        if($(this).val() == "agregar-equipo"){
                            $("#container-number").removeClass("d-none");
                        }else{
                            $("#container-number").addClass("d-none");
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
