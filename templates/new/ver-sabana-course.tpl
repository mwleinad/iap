<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-tasks"></i> Sabanas
    </div>
    <div class="card-body">
        <form action="{$WEB_ROOT}/ajax/sabana-calificaciones.php" method="GET" target="_blank">
            <input type="hidden" name="page" value="export-excel" />
            <input type="hidden" name="course" value="{$courseInfo.courseId}" />
            <div class="row">
                <div class="col-md-6">
                    <label for="period">Cuatrimestre/Semestre</label>
                    <select id="period" name="period" class="form-control">
                        <option value="">-- Seleccionar --</option>
                        {for $period=1 to $courseInfo.totalPeriods}
                            <option value="{$period}">{$period}</option>
                        {/for}
                    </select>
                </div>
                <div class="col-md-6">
                    <label for="type">Tipo de Sabana</label>
                    <select id="type" name="type" class="form-control">
                        <option value="">-- Seleccionar --</option>
                        <option value="1">Frontal (Inicial)</option>
                        <option value="2">Trasera (Inicial)</option>
                        <option value="3">Frontal (Final)</option>
                        <option value="4">Trasera (Final)</option>
                    </select>
                </div>
                {* <div class="col-md-4">
                    <ul class="list-group text-center">
                        {foreach from=$cuatrimesters item=item}
                            <li class="list-group-item list-group-item-action">
                                <a href="{$WEB_ROOT}/sabanas.php?id={$id}&cuatrimestre={$item.semesterId}" target="_blank" >
                                    <i class="far fa-hand-point-right"></i> Generar Sabana Cuatrimestre {$item.semesterId}
                                </a>
                            </li>
                        {/foreach}
                        <li class="list-group-item list-group-item-action">
                            <a href="{$WEB_ROOT}/sabanas.php?id={$id}&cuatrimestre=-1" target="_blank" >
                                <i class="far fa-hand-point-right"></i> Generar Sabana Completa
                            </a>
                        </li>
                        <li class="list-group-item list-group-item-action">
                            <a href="{$WEB_ROOT}/sabanas_back.php?id={$id}&cuatrimestre=-1" target="_blank" >
                                <i class="far fa-hand-point-right"></i> Generar Parte de Atras
                            </a>
                        </li>
                    </ul>
                </div> *}
            </div>
            <div class="row my-3">
                <div class="col-md-12 text-center">
                    <button type="button" class="btn btn-danger" onclick="btnClose()">
                        <i class="fas fa-times"></i> Cancelar
                    </button>
                    <button type="submit" class="btn btn-success">
                        <i class="far fa-file-excel"></i> Generar Sábana
                    </button>
                </div>
            </div>
        </form>
        {* <div id="tblContent" class="table-responsive">
            {include file="{$DOC_ROOT}/templates/lists/sabana-course.tpl"}
        </div> *}
    </div>
</div>