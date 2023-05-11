<div class="card">
    <div class="card-header bg-primary text-white">
        <h4>
            <i class="fas fa-money-check-alt"></i> Actualización de periodos
        </h4>
    </div>
    <form class="form row card-body" id="form_periodo_modal" action="{$WEB_ROOT}/ajax/new/conceptos.php" method="POST">
        <input type="hidden" name="opcion" value="{$opcion}">
        <input type="hidden" name="concepto" value="{$concepto}">
        {foreach from=$periodos item=item name=periodos}
            <div class="form-group col-md-4 mx-auto">
                <label>Periodo del cobro {$smarty.foreach.periodos.iteration}</label>
                <input type="number" min="1" value="{$item.periodo}" name="periodo[{$item.periodo_id}]" class="form-control">
            </div>
        {/foreach}
        <div class="form-group text-center col-md-12">
            <button class="btn btn-success" type="submit">Actualizar</button>
            <a class="btn btn-danger ajax_sin_form" href="{$WEB_ROOT}/ajax/new/conceptos.php"
                data-data='"opcion":"curricula-conceptos","subjectId":"{$subjectId}"'>Regresar</a>
        </div>
    </form>
</div>