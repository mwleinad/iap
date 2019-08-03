<html>
<head>
<script src="{$WEB_ROOT}/assets/jquery.multiple.select.js"></script>
<link rel="stylesheet" type="text/css" href="{$WEB_ROOT}/assets/multiple-select.css" />
<script>
 $(function() {
        $('#ms').change(function() {
            console.log($(this).val());
        }).multipleSelect({
            width: '100%'
        });
    });
</script>
</head>
<body>
<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Nuevo Mensaje
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body">
        <div id="tblContent">
		
<form class="form-horizontal" id="frmGral" name="frmGral" method="post" >
    <input type="hidden" id="auxTpl" name="auxTpl" value="{$auxTpl}"/>
    <input type="hidden" id="id" name="id" value="{$id}"/>
   
    <div class="form-body">
        <div class="form-group">
            <label class="col-md-3 control-label">Docentes:</label>
			
			{if $infoMsj}
				{foreach from=$lsd item=subject}
					<li><font class="font-size:9px">{$subject.name|upper} {$subject.lastname_materno|upper} {$subject.lastname_paterno|upper}</font>
				{/foreach}
			{else}
            <div class="col-md-8">
                <select  name="profesores[]" class=""  id="ms" multiple="multiple">
				{foreach from=$personals item=subject}
				<option value="{$subject.personalId}">
					{$subject.lastname_paterno} {$subject.lastname_materno} {$subject.name}
				</option>
				{/foreach}
                </select>
            </div>
			{/if}
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Titulo:</label>
            <div class="col-md-8">
				{if $infoMsj}
					{$infoMsj.titulo}
				{else}
					<input type="text" name="titulo" id="titulo" value="" maxlength="30" class="form-control"/>
				{/if}
               
            </div>
        </div>
		<div class="form-group">
				<label class="col-md-3 control-label">Mensaje:</label>
				<div class="col-md-8">

					{if $infoMsj}
						{$infoMsj.mensaje}
					{else}
					 <textarea name="description" id="description" style="width:150px"></textarea>
					{/if}
				</div>
			</div>
		{if $infoMsj}
				{if $infoMsj.ruta ne ''}
				<center>
				<a href="{$WEB_ROOT}/docentes/msj/{$infoMsj.ruta}" class="btn {$BUTTON_COLOR} submitForm" target="_blank">
					Ver Archivo
				</a>
				</center>
				{/if}
		{else}			
			<div class="form-group">
				<label class="col-md-3 control-label">Subir Archivo:</label>
				<div class="col-md-8">
					<input type="file" name="path" id="path" class="form-control" />
				</div>
        </div>
		{/if}
		 
        
    </div>
</form>
<div class="form-actions">
		{if !$infoMsj}
            <div class="row">
                <div class="col-md-offset-3 col-md-9">
                    <button type="button" class="btn {$BUTTON_COLOR} submitForm" id="addMajor" name="addMajor" onClick="onEnviaMsj()" >Guardar</button>
                    <button type="button" class="btn default closeModal" onClick="closeModal()">Cancelar</button>
                </div>
            </div>
		{/if}
        </div>
<script type="text/javascript">
    tinyMCE.init({
        mode : "textareas",
        theme : "advanced",
        skin : "o2k7"

    });
</script>

        </div>
    </div>
</div>
</body>
</html>

