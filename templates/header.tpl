
<div id="header">
      <div id="user-info" align="center">
          <p><b>.:: Sistema Educación en Línea - IAP ::.</b></p>            	
      </div>
      
      <div class="wlcRight">{if $User.username}<b>Bienvenido {$User.username} :: {/if}{$fechaHoy}</b> | 
      <span class="lnkSalir">
      {if $User.username}
				{if $vistaPrevia==0}
						<a href="{$WEB_ROOT}/logout" class="lnkSalir">
						<img src="{$WEB_ROOT}/images/icons/logout.png" /> Salir
						</a>
				{else}
						<img src="{$WEB_ROOT}/images/icons/logout.png" /> Vista Previa
				{/if}
	  
	  
      {/if}</span>
      </div> 
                  
      
      <div id="toggle-box-1" style="display:block">
        {if $vistaPrevia==0} {include file="menus/main.tpl"}
		{else}
		<div id="hiddenmenu" align="center">
		 <br/>
		 <br/>
		<h1 style="font-family: sans-serif;color:#088A08; font-size: 300%; font-style: normal; ">VISTA PREVIA DEL MODULO</h1>
		</div>
		{/if}
		
      </div>
      
      <div style="clear:both"></div>
	  
	      {include file="menus/submenu.tpl"}
		  </div>