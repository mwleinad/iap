{foreach from=$announcements item=item}
<div class="portlet box red">
    <div class="portlet-title">
        <!-- TODO Poner al centro el título-->
        <div class="caption" >

				
                 <b>{$item.title}</b> -  {$item.date|date_format:"%d/%m/%Y - %H:%M"}  {if $User.positionId == "1" && $vp==1} | &raquo; <a href="{$WEB_ROOT}/homepage/id/{$item.announcementId}" onclick="return confirm('&iquest;Desea eliminar la noticia?')"> Eliminar Noticia </a> {/if}
        </div>	
        <div style="float:right">	
				{if $UserType ne 'student'}
				<a href="{$WEB_ROOT}/graybox.php?page=add-noticia&cId={$item.announcementId}" data-target="#ajax" data-toggle="modal" data-width="1000px" title='INICIAR PROCESO'>
				<i class="material-icons md-16">ic_create</i>
				</a>
				{/if}
		 </div>	
    </div>
    <div class="portlet-body">
            {$item.description}

   </div>
</div>
{/foreach}