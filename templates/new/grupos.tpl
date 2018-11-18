<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Grupos
        </div>
        <div class="actions">
            {if $docente != 1}
            <a class=" btn green" href="{$WEB_ROOT}/graybox.php?page=add-grupos" data-target="#ajax" data-toggle="modal">
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
			<b>Tipo Curricula</b>
			<select class="form-control" style="width:88px" onChange="onBuscar()" name="curricula">
				<option></option>
				{foreach from=$lstC item=subject}
				
				<option value="{$subject.subjectId}">{$subject.name}</option>
				{/foreach}
			</select>
		</form>
		</div>
		{/if}
		<br>

        <div id="tblContent">{include file="lists/grupos.tpl"}</div>
        <br />

    </div>
</div>


