<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Presentación {$myModule.name}  {if $vistaPrevia==1}   <a class="btn green" href="{$WEB_ROOT}/flash/flash_{$id}.swf" target="_blank" data-target="#ajax" data-toggle="modal">Ver en Pantalla Completa</a>   {/if}
        </div>
    </div>
    <div class="portlet-body">
		<button onClick="verPantallaCompleta()" class="btn green">Pantalla Completa</button>
		<br>
		<br>
		
		
		
        <div id="tblContent" style='text-align:center'>
            <OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" WIDTH="1050" HEIGHT="600" id="Presentacion" ALIGN="">
                <PARAM NAME=movie VALUE="{$WEB_ROOT}/flash/flash_{$id}.swf">
                <PARAM NAME=quality VALUE=high> <PARAM NAME=bgcolor VALUE=#333399>
                <EMBED src="{$WEB_ROOT}/flash/flash_{$id}.swf" quality=high bgcolor=#333399 WIDTH="1050" HEIGHT="600" NAME="Yourfilename" ALIGN="" TYPsE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer">
                </EMBED>
            </OBJECT>
        </div>
    </div>
</div>

