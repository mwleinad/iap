<div class="row">
    <form id="editSubjectForm" name="editSubjectForm" method="POST" action="{$WEB_ROOT}/edit-calendar-form">
        <input type="hidden" id="calendarDistributionId" name="calendarDistributionId" value="{$info['calendarDistributionId']}"/>
        <input type="hidden" id="courseId" name="courseId" value="{$info['courseId']}"/>
        <div class="form-group col-md-12">
            <label class="control-label" id="conceptId">Selecciona Concepto:</label>
            <select name="conceptId" id="conceptId" class="form-control">
                <option value="">-- Seleccionar --</option>
                {foreach key=key item=item from=$concepts}
                    <option value="{$item['calendarConceptId']}" {($info['calendarConceptId'] == $item['calendarConceptId']) ? 'selected' : ''}>
                        {$item['concept']}
                    </option>
                {/foreach}
            </select>
        </div>

        <div class="form-group col-md-6">
            <label class="control-label" id="period">{$info.tipoCuatri}:</label>
            <select name="period" id="period" class="form-control">
                <option value="">-- Seleccionar --</option>
                {for $period = 1 to $info.totalPeriods}
                    <option value="{$period}" {($info['period'] == $period) ? 'selected' : ''}>{$info.tipoCuatri} {$period}</option>
                {/for}
            </select>
        </div>

        <div class="form-group col-md-6">
            <label class="control-label" id="amount">Monto (Sin Beca):</label>
            <input type="text" name="amount" id="amount"  class="form-control" autocomplete="off" value="{$info['amount']}" required/>
        </div>

        <div class="form-group col-md-4">
            <label class="control-label" id="date">Fecha de Pago:</label>
            <input type="text" name="date" id="date"  class="form-control date-picker" autocomplete="off" value="{$info['date_dmy']}" required />
        </div>

        <div class="form-group col-md-4">
            <label class="control-label" id="isVisible">¿El Concepto Es Visible?:</label>
            <select name="isVisible" id="isVisible" class="form-control">
                <option value="1" {($info['isVisible'] == 1) ? 'selected' : ''}>Si</option>
                <option value="0" {($info['isVisible'] == 0) ? 'selected' : ''}>No</option>
            </select>
        </div>

        <div class="form-group col-md-4">
            <label class="control-label" id="hasDiscount">¿Se Aplica Beca?:</label>
            <select name="hasDiscount" id="hasDiscount" class="form-control">
                <option value="1" {($info['hasDiscount'] == 1) ? 'selected' : ''}>Si</option>
                <option value="0" {($info['hasDiscount'] == 0) ? 'selected' : ''}>No</option>
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