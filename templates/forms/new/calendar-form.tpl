<form id="editSubjectForm" name="editSubjectForm" method="POST" action="{$WEB_ROOT}/calendar-form">
    <input type="hidden" id="courseId" name="courseId" value="{$courseId}"/>
    <div class="row">
        <div class="form-group col-md-12">
            <label for="conceptId">Selecciona Concepto:</label>
            <select name="conceptId" id="conceptId" class="form-control">
                <option value="">-- Seleccionar --</option>
                {foreach key=key item=item from=$concepts}
                    <option value="{$item['calendarConceptId']}">{$item['concept']}</option>
                {/foreach}
            </select>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-6">
            <label for="period">{$info.tipoCuatri}:</label>
            <select name="period" id="period" class="form-control">
                <option value="">-- Seleccionar --</option>
                {for $period = 1 to $info.totalPeriods}
                    <option value="{$period}">{$info.tipoCuatri} {$period}</option>
                {/for}
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="amount">Monto (Sin Beca):</label>
            <input type="text" name="amount" id="amount"  class="form-control" autocomplete="off" required/>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-4">
            <label for="date">Fecha de Pago:</label>
            <input type="text" name="date" id="date"  class="form-control i-calendar" autocomplete="off" required/>
        </div>
        <div class="form-group col-md-4">
            <label for="isVisible">¿El Concepto Es Visible?:</label>
            <select name="isVisible" id="isVisible" class="form-control">
                <option value="1">Si</option>
                <option value="0">No</option>
            </select>
        </div>
        <div class="form-group col-md-4">
            <label for="hasDiscount">¿Se Aplica Beca?:</label>
            <select name="hasDiscount" id="hasDiscount" class="form-control">
                <option value="1">Si</option>
                <option value="0">No</option>
            </select>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 text-center">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
            <button type="submit" class="btn btn-success submitForm">Guardar</button>
        </div>
    </div>
</form>

<script>
    flatpickr('.i-calendar', {
        dateFormat: "d-m-Y"
    });
</script>