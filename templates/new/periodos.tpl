<div class="card">
    <div class="card-body">
        <form class="form" id="formPeriods" action="{$WEB_ROOT}/ajax/new/course.php">
            <input type="hidden" name="option" value="savePeriods">
            <input type="hidden" name="course" value="{$curso.courseId}">
            <h3 class="text-center">Periodos del curso</h3>
            <table class="table">
                <thead>
                    <tr>
                        <th>Periodo</th>
                        <th>Inicio</th>
                        <th>Fin</th>
                    </tr>
                </thead>
                <tbody>
                    {for $period=1 to $curso.totalPeriods}
                        <tr>
                            <td>{$curso.tipoPeriodo} {$period}</td>
                            <td><input class="form-control" name="periodBegin[]" value="{$curso.periodos[$period-1]['periodBegin']}"></td>
                            <td><input class="form-control" name="periodEnd[]" value="{$curso.periodos[$period-1]['periodEnd']}"></td>
                        </tr>
                    {/for}
                </tbody>
            </table>
            <div class="text-center">
                <button type="submit" id="button" class="btn btn-success">Guardar</button>
            </div>
        </form>
    </div>
</div>