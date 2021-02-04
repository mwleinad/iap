<ul id="sort-box" class="sorts">
	<li>
		<div>
			{foreach from=$announcements item=item}
				<div class="content-settings-row-register text-center">
					<b>.:: {$item.title} - Fecha: {$item.date|date_format:"%d-%m-%Y %H:%M:%S"} ::. {if $User.positionId == "1" && $vp==1} | &raquo; <a href="{$WEB_ROOT}/homepage/id/{$item.announcementId}" onclick="return confirm('&iquest;Desea eliminar la noticia?')"> Eliminar Noticia </a> {/if}</b>
				</div>
				<div class="content-settings-row-register">
					{$item.description}
				</div>
			{/foreach}
		</div>
	</li>
</ul>
 