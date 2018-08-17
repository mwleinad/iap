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
			<b>Activo</b>
			<select class="form-control" style="width:88px" onClick="onBuscar()" name="activo">
				<option></option>
				<option>si</option>
				<option>no</option>
			</select>
			<b>Modalidad</b>
			<select class="form-control" style="width:88px" onClick="onBuscar()" name="modalidad">
				<option></option>
				<option >Online</option>
				<option value="Local">Presencial</option>
			</select>
			<b>Tipo Curricula</b>
			<select class="form-control" style="width:88px" onClick="onBuscar()" name="curricula">
				<option></option>
				{foreach from=$lstMajor item=subject}
				
				<option value="{$subject.majorId}">{$subject.name}</option>
				{/foreach}
			</select>
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
