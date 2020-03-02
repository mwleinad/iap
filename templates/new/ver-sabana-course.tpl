<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Sabanas
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body">
        <div style="padding:10px">
            {foreach from=$cuatrimesters item=item}
                <a style="color:#000000" target="_blank" href="{$WEB_ROOT}/sabanas.php?id={$id}&cuatrimestre={$item.semesterId}">&raquo; Generar Sabana Cuatrimestre {$item.semesterId}</a><br />
            {/foreach}
            <a style="color:#000000" target="_blank" href="{$WEB_ROOT}/sabanas.php?id={$id}&cuatrimestre=-1">&raquo; Generar Sabana Completa</a><br />
            <a style="color:#000000" target="_blank" href="{$WEB_ROOT}/sabanas_back.php?id={$id}&cuatrimestre=-1">&raquo; Generar Parte de Atras</a><br />
        </div>
        <div id="tblContent">{include file="{$DOC_ROOT}/templates/lists/sabana-course.tpl"}</div>
    </div>
</div>

