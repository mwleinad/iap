<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Agregar Actividad
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body">
        <div id="tblContent">
           <!-- TinyMCE -->
{*
<script type="text/javascript" src="{$WEB_ROOT}/tinymce/tiny_mce.js"></script>
*}
<!-- /TinyMCE -->

<form  id="frmGral" name="frmGral" >
    <input type="hidden" id="activitycId" name="activitycId" value="{$actividad.activityConfigId}"/>
    <input type="hidden" id="courseModuleId" name="courseModuleId" value="{$courseModuleId}"/>
    <input type="hidden" id="auxTpl" name="auxTpl" value="{$auxTpl}"/>
    <input type="hidden" id="id" name="id" value="{$id}"/>
    <input type="hidden" id="type" name="type" value="saveAddMajor"/>
    <div class="form-body">
        <div class="form-group">
            <label class="col-md-3 control-label">Tipo de Actividad:</label>
            <div class="col-md-8">
                <select id="activityType" name="activityType" class="form-control">
                      <option value="Lectura" {if $actividad.activityType == "Lectura"} selected="selected"{/if}>Lectura</option>
                    <option value="Tarea" {if $actividad.activityType == "Tarea"} selected="selected"{/if}>Tarea</option>
                    <option value="Examen" {if $actividad.activityType == "Examen"} selected="selected"{/if}>Examen</option>
                    <option value="Foro" {if $actividad.activityType == "Foro"} selected="selected"{/if}>Foro</option>
                    <option value="Otro" {if $actividad.activityType == "Otro"} selected="selected"{/if}>Otro</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Dia Inicial:</label>
            <div class="col-md-8">
                <input type="text" name="diaInicial" id="diaInicial" value="{$actividad.diaInicial}"  class="form-control"/>
            </div>
        </div>
		<div class="form-group">
            <label class="col-md-3 control-label">Hora Inicial:</label>
            <div class="col-md-8">
                <input type="time" name="horaInicial" id="horaInicial" value="{$actividad.horaInicial}"    style="width:200px" class="form-control "/>
               
            </div>
        </div>
		
		
        <div class="form-group">
            <label class="col-md-3 control-label">Dia Final:</label>
            <div class="col-md-8">
               <input type="text" name="diaFinal" id="diaFinal" value="{$actividad.diaFinal}"  class="form-control"/>
            </div>
        </div>
		<div class="form-group">
            <label class="col-md-3 control-label">Hora Final:</label> 
            <div class="col-md-8">
                <input type="time" name="hora" id="hora" {if $actividad.horaFinal eq ''} value="23:59:00" {else} value="{$actividad.horaFinal}" {/if}   style="width:200px" class="form-control "/>
               
            </div>
        </div>
		<!--
		<div class="form-group">
            <label class="col-md-3 control-label">Hora Final:</label>
            <div class="col-md-8">
                <input type="time" name="hora" id="hora" value="{$actividad.horaFinal}"   style="width:200px" class="form-control "/>
               
            </div>
        </div>-->

        <div class="form-group">
            <label class="col-md-3 control-label">Modalidad:</label>
            <div class="col-md-8">
                <select id="modality" name="modality" class="form-control">
                    <option value="Individual" {if $actividad.modality == "Individual"} selected="selected"{/if}>Individual</option>
                    <option value="Por Equipo" {if $actividad.modality == "Por Equipo"} selected="selected"{/if}>Por Equipo</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Titulo:</label>
            <div class="col-md-8">
                <input type="text" name="resumen" id="resumen" value="{$actividad.resumen}" maxlength="30" class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Descripcion:</label>
            <div class="col-md-8">
{*
                TODO check text areas in graybox
*}
                <textarea name="description" id="description" style="width:150px">{$actividad.description}</textarea>
{*
                <input type="text" name="description" id="description" value="" maxlength="30" class="form-control"/>
*}
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Actividad Requerida:</label>
            <div class="col-md-8">
                <select id="requiredActivity" name="requiredActivity" class="form-control">
                    <option value="0">Ninguna</option>
                    {foreach from=$actividades item=item}
                                <option value="{$item.activityId}" {if $actividad.requiredActivity == $item.activityId} selected="selected"{/if}>{$item.resumen}</option>
                    {/foreach}
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Ponderacion:</label>
            <div class="col-md-8">
                <input type="text" name="ponderation" id="ponderation" value="{$actividad.ponderation}" maxlength="3" class="form-control"/>
            </div>
        </div>
</form>
  </div>
        <div class="form-actions">
            <div class="row">
                <div class="col-md-offset-3 col-md-9">
                    <button  class="btn {$BUTTON_COLOR}" id="addMajor" name="addMajor" onClick="SaveAc()">Enviar</button>

                    <button type="button" class="btn default closeModal">Cancelar</button>
                </div>
            </div>
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

