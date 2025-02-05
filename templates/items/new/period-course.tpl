<div class="col-md-12">
    <div class="alert alert-warning">El alumno tiene una baja en el periodo {$periodo}, por lo tanto, es necesario que
        seleccione en qué periodo iniciará para que el sistema sepa qué calificaciónes y pagos conservar. </div>
</div>
<div class="form-group col-md-6 mx-auto">
    <label>Periodo</label>
    <select class="form-control" id="period" name="period">
        <option value="0">--Selecciona el periodo de inicio--</option>
        {for $periodo=1 to $periodosMaximos}
            <option>{$periodo}</option>
        {/for}
    </select>
</div>