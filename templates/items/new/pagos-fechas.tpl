<div class="col-md-4 mb-3">
    <label for="estatus_fecha">Estatus</label>
    <select class="form-control" id="estatus_fecha">
        <option value="1">Activos</option>
        <option value="2">Inactivos</option>
    </select>
</div>
<div class="col-md-4 mb-3">
    <label for="fecha_inicial">Fecha inicial</label>
    <input type="date" class="form-control" id="fecha_inicial" name="fecha_inicial">
</div>
<div class="col-md-4 mb-3">
    <label for="fecha_final">Fecha final</label>
    <input type="date" class="form-control" id="fecha_final" name="fecha_final" max="{date('Y-m-d')}">
</div> 