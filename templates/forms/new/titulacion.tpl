<form id="editSubjectForm" name="editSubjectForm" method="POST" action="{$WEB_ROOT}/titulacion/id/{$courseId}">
    <input type="hidden" id="courseId" name="courseId" value="{$courseId}"/>

    <div class="row">
		<div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th class="text-center font-weight-bold">NO. DE CONTROL</th>
                        <th class="text-center font-weight-bold">ALUMNO</th>
                        <th class="text-center font-weight-bold">¿ESTÁ TITULADO?</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$students item=item}
                        <tr>
                            <td class="text-center">{$item.controlNumber}</td>
                            <td>{$item.names|upper} {$item.lastNamePaterno|upper} {$item.lastNameMaterno|upper}</td>
                            <td>
                                <select class="form-control input-sm" name="certificates[{$item.userId}]">
                                    <option value="0" {if $item.certificateStatus eq 0} selected {/if}>No</option>
                                    <option value="1" {if $item.certificateStatus eq 1} selected {/if}>Si</option>
                                </select>
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12 text-center">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
            <button type="submit" class="btn btn-success submitForm">Guardar</button>
        </div>
    </div>
</form>