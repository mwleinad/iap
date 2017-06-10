{foreach from=$announcements item=item}
<div class="portlet box red">
    <div class="portlet-title">
        <!-- TODO Poner al centro el título-->
        <div class="caption" >
                 <b>{$item.title}</b> -  {$item.date|date_format:"%d/%m/%Y - %H:%M"}  {if $User.positionId == "1" && $vp==1} | &raquo; <a href="{$WEB_ROOT}/homepage/id/{$item.announcementId}" onclick="return confirm('&iquest;Desea eliminar la noticia?')"> Eliminar Noticia </a> {/if}
        </div>
    </div>
    <div class="portlet-body">
            {$item.description}
   </div>
</div>
{/foreach}