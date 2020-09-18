<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i> Instancias de Curricula
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
            <form id="frmFlt1" class="form-inline">
                <div class="form-group">
                    <label>Activo: </label>
                    <select class="form-control" onClick="onBuscar()" name="activo">
                        <option value="">-- Seleccionar --</option>
                        <option>si</option>
                        <option>no</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Modalidad: </label>
                    <select class="form-control" onClick="onBuscar()" name="modalidad">
                        <option value="">-- Seleccionar --</option>
                        <option value="Online">Online</option>
                        <option value="Local">Presencial</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Tipo Curricula: </label>
                    <select class="form-control" onClick="onBuscar()" name="curricula">
                        <option value="">-- Seleccionar --</option>
                        {foreach from=$lstMajor item=subject}
                            <option value="{$subject.majorId}">{$subject.name}</option>
                        {/foreach}
                    </select>
                </div>
            </form>
		{/if}
		<br />
        <div id="tblContent" class="table-responsive">{include file="lists/new/calendar-courses.tpl"}</div>
        <br />
        {if $coursesCount}
            <div id="pagination" class="lnkPages">
                {include file="footer-pages-links.tpl"}
            </div>
        {/if}
    </div>
</div>

<input type="hidden" id="viewPage" name="viewPage" value="{$arrPage.currentPage}" />
