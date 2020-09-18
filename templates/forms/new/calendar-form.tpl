<div class="row">
    <form id="editSubjectForm" name="editSubjectForm" method="POST" action="{$WEB_ROOT}/calendar-form">
        <input type="hidden" id="courseId" name="courseId" value="{$post.courseId}"/>
        <div class="form-group col-md-12">
            <label class="control-label">Selecciona Concepto:</label>
            <select name="subjectId" id="subjectId" class="form-control">
                <option value="">-- Seleccionar --</option>
                <option value="Colegiatura">Colegiatura</option>
                <option value="Inglés">Inglés</option>
                <option value="Materia">Materia</option>
            </select>
        </div>

        <div class="form-group col-md-4">
            <label class="control-label">Monto (Sin Beca):</label>
            <input type="text" name="initialDate" id="initialDate"  class="form-control date-picker " required/>
        </div>

        <div class="form-group col-md-4">
            <label class="control-label">¿El Concepto Es Visible?:</label>
            <select name="active" id="active" class="form-control">
                <option value="Si">Si</option>
                <option value="No">No</option>
            </select>
        </div>

        <div class="form-group col-md-4">
            <label class="control-label">¿Se Aplica Beca?:</label>
            <select name="active" id="active" class="form-control">
                <option value="Si">Si</option>
                <option value="No">No</option>
            </select>
        </div>
        <div class="form-actions">
            <div class="row">
                <div class="col-md-12 text-center">
                    <button type="button" class="btn default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn green submitForm">Guardar</button>
                </div>
            </div>
        </div>
    </form>
</div>