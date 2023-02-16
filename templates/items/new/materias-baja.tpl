<div class="card modal-body">
    <div class="card-header alert alert-warning">
        Advertencia, el periodo seleccionado podría eliminar periodos con calificaciones aprobatorias, se sugiere el
        periodo {$periodoSugerido}. Para mayor certeza, se desglosa las calificaciones del curso.
    </div>
    <div class="card-body">
        <div class="row">
            <h3 class="col-md-12 text-center">¿En qué periodo realizará la baja?</h3>
            <div class="d-flex justify-content-center col-md-12 form-group">
                <form class="text-center col-md-3 form" id="form_baja_sugerida" action="{$WEB_ROOT}/ajax/new/studentCurricula.php" method="post">
                    <input type="hidden" name="courseId" value="{$curso}">
                    <input type="hidden" name="userId" value="{$estudiante}">
                    <input type="hidden" name="period" value="{$periodoSugerido}">
                    <input type="hidden" name="completarBaja" value="true">
                    <input type="hidden" name="type" value="deleteStudentCurricula">
                    <button type="submit" class="btn btn-success">Periodo Sugerido[{$periodoSugerido}]</button>
                    </form>
                    <form class="text-center col-md-3 form" id="form_baja_seleccionada" action="{$WEB_ROOT}/ajax/new/studentCurricula.php" method="post">
                    <input type="hidden" name="courseId" value="{$curso}">
                    <input type="hidden" name="userId" value="{$estudiante}">
                    <input type="hidden" name="period" value="{$periodoBaja}">
                    <input type="hidden" name="completarBaja" value="true">
                    <input type="hidden" name="type" value="deleteStudentCurricula">
                    <button type="submit" class="btn btn-success">Periodo Seleccionado[{$periodoBaja}]</button>
                </form>
            </div>
            <div class="w-100"></div>
            {foreach from=$calificaciones item=calificacion key=periodo} 
                <h3 class="col-md-12 text-center">{$tipoPeriodo} {$periodo}</h3> 
                <div class="col-md-12">
                    <div class="row" style="padding: 5px; background-color: #73b760; font-size: 20px; color: white; border-radius:20px 20px 0 0;">
                        <div class="col-md-8 text-center">MATERIA</div>
                        <div class="col-md-4 text-center">CALIFICACIÓN</div>
                    </div>
                </div> 
                {foreach from=$calificacion item=item}
                    <div class="col-md-8 text-center" style="padding: 5px;">
                        {$item['name']}
                    </div>
                    <div class="col-md-4 text-center" style="padding: 5px;">
                        {$item['score']}
                    </div>
                {/foreach} 
            {/foreach}
        </div>
    </div>
</div>