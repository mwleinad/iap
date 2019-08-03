<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Tabla de costos
        </div>
        <div class="actions">
            
        </div>
    </div>
    <div class="portlet-body">
		{if $msj == 'si'}
		<div class="alert alert-info alert-dismissable">
			  <button type="button" class="close" data-dismiss="alert">&times;</button>
			 Los datos se guardaron correctamente
			</div>
		{/if}
        <div id="tblContent">{include file="lists/new/tabla-costo.tpl"}</div>
        <br />
        {if $coursesCount}
            <div id="pagination" class="lnkPages">
                {include file="footer-pages-links.tpl"}
            </div>
        {/if}
    </div>
</div>

<input type="hidden" id="viewPage" name="viewPage" value="{$arrPage.currentPage}" />
