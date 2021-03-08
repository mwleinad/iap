<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-tasks"></i> Sabanas
    </div>
    <div class="card-body">
        <div class="row d-flex justify-content-center mb-3">
            <div class="col-md-4">
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
            </div>
        </div>
        <div id="tblContent" class="table-responsive">
            {include file="{$DOC_ROOT}/templates/lists/sabana-course.tpl"}
        </div>
    </div>
</div>