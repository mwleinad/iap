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
	   
	   Certificacion:
	   <select name="subjectId" id="" class="form-control" onChange="busEval()">
			<option></option>
			{foreach from=$registros  item=item}
			<option value="{$item.subjectId}"  >{$item.certificacion}</option>
			{/foreach}
		</select>
		Evaluador
		<div id="divEval">
		</div>

	  
	  </form>
	  <br>
	  <br>
	  <center><button type="button" class="btn default" data-dismiss="modal">Cerrar</button>
	  <button type="submit" class="btn green submitForm" onClick="saveCalificador()">Enviar</button>
	  </center>
        </div>
    </div>
</div>


