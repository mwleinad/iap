<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Calificación acumulada:</b> {$totalScore}% &raquo;
        </div>
    </div>
    <input type="hidden" value="0" id="recarga" name="recarga">
    <div class="portlet-body">

        {foreach from=$actividades item=item}
            {if $timestamp > $item.initialDateTimestamp && $timestamp < $item.finalDateTimestamp}
                <div class="portlet box {$PORTLET_COLOR}">
            {/if}
            {if $timestamp > $item.finalDateTimestamp}
                    <div class="portlet box {$PORTLET_COLOR}-mint">
            {/if}
            {if $timestamp < $item.initialDateTimestamp}
                        <div class="portlet box {$PORTLET_COLOR}-mint">
            {/if}
                <div class="portlet-title">
                    <!-- TODO Poner al centro el título-->
                    <div class="caption" >
                        <!-- TODO Ver Descripción ponerlo en blanco y subrayado-->
                        <b>Actividad  {$item.count} - </b> {$item.resumen}
                    </div>
                    <div class="actions">
                        <a href="{$WEB_ROOT}/graybox.php?page=view-description-activity&id={$item.activityId};" class="btn {$BUTTON_COLOR}" data-target="#ajax" data-toggle="modal" >

                            <i class="fa fa-plus"></i> Ver Descripción </a>


                    </div>
                </div>
                <div class="portlet-body">
                    {include file="{$DOC_ROOT}/templates/lists/new/module-calendar.tpl"}
                </div>
            </div>
        {/foreach}
    </div>
</div>

