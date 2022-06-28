<form id="editSubjectForm" name="editSubjectForm" method="POST" action="{$WEB_ROOT}/niveles-ingles/id/{$courseId}">
    <input type="hidden" id="courseId" name="courseId" value="{$courseId}"/>

    <div class="row">
		<div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th class="text-center font-weight-bold">NO. DE CONTROL</th>
                        <th class="text-center font-weight-bold">ALUMNO</th>
                        <th class="text-center font-weight-bold">Niveles de Inglés</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$students item=item}
                        <tr>
                            <td class="text-center">{$item.controlNumber}</td>
                            <td>{$item.names|upper} {$item.lastNamePaterno|upper} {$item.lastNameMaterno|upper}</td>
                            <td>
                                {for $i=1 to $courseInfo['totalPeriods']}
                                    <label>Nivel {$i} <input type="checkbox" name="levels[{$item.userId}][]" value="{$i}" {if in_array($i, $english_levels[$item.userId])} checked {/if}></label>&nbsp;&nbsp;&nbsp;&nbsp;
                                {/for}
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