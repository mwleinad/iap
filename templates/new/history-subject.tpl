<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Certificaciones
        </div>
        <div class="actions">
            {if $docente != 1}
            <a class=" btn green" href="{$WEB_ROOT}/graybox.php?page=open-subject" data-target="#ajax" data-toggle="modal">
                <i class="fa fa-plus"></i>Agregar
            </a>
            {/if}
        </div>
    </div>
    <div class="portlet-body">
		{if $msj == 'si'}
		<div class="alert alert-info alert-dismissable">
			  <button type="button" class="close" data-dismiss="alert">&times;</button>
			 Los datos se guardaron correctamente
			</div>
		{/if}
		{if $perfil ne 'Docente'}
		<form id="frmFlt1">
		<div style="display:-webkit-inline-box">
			
		</form>
		</div>
		{/if}
		<br>

        <div id="tblContent">{include file="lists/new/courses.tpl"}</div>
        <br />
        {if $coursesCount}
            <div id="pagination" class="lnkPages">
                {include file="footer-pages-links.tpl"}
            </div>
        {/if}
    </div>
</div>

<input type="hidden" id="viewPage" name="viewPage" value="{$arrPage.currentPage}" />
