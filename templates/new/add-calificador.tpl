<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Agregar Calificador
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body">
        <div id="tblContent" class="content-in">
            
		<form id="frmGral">	     
       <input type="hidden" id="" name="subjectId" value="{$cId}">
       <input type="hidden" id="id" name="id" value="{$id}">
		<select name="personalId" id="" class="form-control">
			<option></option>
			{foreach from=$lstCalificador  item=item}
			<option value="{$item.personalId}">{$item.name} {$item.lastname_paterno} {$item.lastname_materno}</option>
			{/foreach}
		</select>
	  
	  </form>
	  <br>
	  <br>
	  <center><button type="button" class="btn default" data-dismiss="modal">Cerrar</button>
	  <button type="submit" class="btn green submitForm" onClick="saveCalificador()">Enviar</button>
	  </center>
        </div>
    </div>
</div>


