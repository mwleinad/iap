
{if $auxImagen ne 1}
<!--<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Cambiar foto de perfil
        </div>
    </div>
    <div class="portlet-body">
        <div class="form-group">
			<table>
			<tr>
			<td>
				<label class="col-md-3 control-label"></label>
				{if $exFoto eq "si"}
				<img src="{$WEB_ROOT}/alumnos/{$info.userId}.jpg?{$rand}" width="110" height="110">
				{else}
				<img src="{$WEB_ROOT}/images/no_foto.jpg?{$rand}" width="110" height="110">
				{/if}
			</td>
			<td>
				<form name="{$item.userId}" id="frmImg" method="post" enctype="multipart/form-data">
					<input type="hidden" name="userId" id="userId" value="{$info.userId}" />
					<input type="hidden" name="permiso" id="permiso" value="1" />
					<input type="file" name="foto" id="foto" style="float:left; width:240px" />
					<br>
					<br>
					
				</form>
				 <button type="submit" class="btn {$BUTTON_COLOR} submitForm" onClick="updateFoto()">Guardar</button>
            </td>
			</tr>
			</table>
			{if $msjConfirma eq "si"}

			<div class="alert alert-success alert-dismissable">
			  <button type="button" class="close" data-dismiss="alert">&times;</button>
			 La Foto de perfil se actualizo correctamente
			</div>
			{/if}
        </div>
    </div>
</div>-->
{/if}



<form class="form-horizontal" id="editStudentForm" name="editStudentForm" method="post">
    <input type="hidden" name="cancelPeriodoId" id="cancelPeriodoId" value="{$info.cancelPeriodoId}" />
    <input type="hidden" id="type" name="type" value="saveEditStudentAlumn"/>
    <input type="hidden" id="id" name="id" value="{$info.userId}"/>
    <input type="hidden" id="tam" name="tam" value="1"/>
    <input type="hidden" id="semestreId" name="semestreId" value="{$sId}"/>
    <input type="hidden" id="courseMxId" name="courseMxId" value="{$courseMId}"/>
    <input type="hidden" id="subjecxtId" name="subjecxtId" value="{$subjectId}"/>
	 <input type="hidden" id="coursexId" name="coursexId" value="{$courseId}"/>
    <div class="portlet box {$PORTLET_COLOR}">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-bullhorm"></i>Información Personal
            </div>
        </div>
        <div class="portlet-body">
            <div class="form-group">
                <label class="col-md-3 control-label">Nombre:</label>
                <div class="col-md-8">
                    <input type="text" name="names" id="names" class="form-control"  value="{$info.names}" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Apellido Paterno:</label>
                <div class="col-md-8">
                    <input type="text" name="lastNamePaterno" id="lastNamePaterno" class="form-control" value="{$info.lastNamePaterno}" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Apellido Materno:</label>
                <div class="col-md-8">
                    <input type="text" name="lastNameMaterno" id="lastNameMaterno" class="form-control" value="{$info.lastNameMaterno}" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Sexo:</label>
                <div class="col-md-8">
                    <select name='sexo' id="sexo" class="form-control">
                        <option value="m"  {if $info.sexo == "m"}selected{/if}>Masculino</option>
                        <option value="f"  {if $info.sexo == "f"}selected{/if}>Femenino</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Fecha de Nacimiento:</label>
                <div class="col-md-8">
                    <select name="day" id="day" style="width:70px" class="form-control">
                        {section name=foo start=1 loop=32 step=1}
                            {$smarty.section.foo.index}
                            <option value="{$smarty.section.foo.index}" {if $info.dayBirthdate == $smarty.section.foo.index}selected{/if}>{$smarty.section.foo.index}</option>
                        {/section}
                    </select>
                    <select name="month" id="month" class="form-control">
                        <option value="1" {if $info.monthBirthdate == 1}selected{/if}>Enero</option>
                        <option value="2" {if $info.monthBirthdate == 2}selected{/if}>Febrero</option>
                        <option value="3" {if $info.monthBirthdate == 3}selected{/if}>Marzo</option>
                        <option value="4" {if $info.monthBirthdate == 4}selected{/if}>Abril</option>
                        <option value="5" {if $info.monthBirthdate == 5}selected{/if}>Mayo</option>
                        <option value="6" {if $info.monthBirthdate == 6}selected{/if}>Junio</option>
                        <option value="7" {if $info.monthBirthdate == 7}selected{/if}>Julio</option>
                        <option value="8" {if $info.monthBirthdate == 8}selected{/if}>Agosto</option>
                        <option value="9" {if $info.monthBirthdate == 9}selected{/if}>Septiembre</option>
                        <option value="10" {if $info.monthBirthdate == 10}selected{/if}>Octubre</option>
                        <option value="11" {if $info.monthBirthdate == 11}selected{/if}>Noviembre</option>
                        <option value="12" {if $info.monthBirthdate == 12}selected{/if}>Diciembre</option>
                    </select>
                    {include file="{$DOC_ROOT}/templates/forms/year.tpl" name="year" selected=$info.yearBirthdate}
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Estado Civil:</label>
                <div class="col-md-8">
                    {include file="{$DOC_ROOT}/templates/forms/maritalStatus.tpl" selected=$info.maritalStatus}
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Contraseña del Sistema (Minimo 6 caracteres):</label>
                <div class="col-md-8">
                    <input type="password" name="password" id="password" class="form-control" value="{$info.password}" />
                </div>
            </div>
        </div>
    </div>

    <div class="portlet box {$PORTLET_COLOR}">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-bullhorm"></i>Domicilio
            </div>
        </div>
        <div class="portlet-body">


            <div class="form-group">
                <label class="col-md-3 control-label">Calle</label>
                <div class="col-md-8">
                    <input type="text" name="street" id="street" class="form-control" value="{$info.street}" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Número</label>
                <div class="col-md-8">
                    <input type="text" name="number" id="number" class="form-control" value="{$info.number}" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Colonia:</label>
                <div class="col-md-8">
                    <input type="text" name="colony" id="colony" class="form-control" value="{$info.colony}" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">País</label>
                <div class="col-md-8">
                    <select id="pais" name="pais" style="width:300px" onChange="estado_dependencia();" class="form-control" >
                        <option value="0">Selecciona Tu Pa&iacute;s</option>
                        {foreach from=$paises item=pais}
                            {if $pais.paisId == $info.pais}
                                <option selected="selected" value="{$pais.paisId}">{$pais.nombre} </option>
                            {else}
                                <option value="{$pais.paisId}">{$pais.nombre} </option>
                            {/if}
                        {/foreach}
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Estado:</label>
                <div class="col-md-8">
                    <div id="Stateposition">
                        <select id="estado" name="estado" style="width:300px" onChange="ciudad_dependencia();" class="form-control">
                            <option value="0">Selecciona Tu Estado</option>
                            {foreach from=$estados item=estado}
                                {if $estado.estadoId == $info.estado}
                                    <option selected="selected" value="{$estado.estadoId}">{$estado.nombre} </option>
                                {else}
                                    <option value="{$estado.estadoId}">{$estado.nombre} </option>
                                {/if}
                            {/foreach}
                        </select>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Municipio</label>
                <div class="col-md-8">
                    <div id="Cityposition">
                        <select id="ciudad" name="ciudad" style="width:300px" class="form-control" >
                            <option value="0">Selecciona Tu ciudad</option>
                            {foreach from=$ciudades item=ciudad}
                                {if $ciudad.municipioId == $info.ciudad}
                                    <option selected="selected" value="{$ciudad.municipioId}">{$ciudad.nombre} </option>
                                {else}
                                    <option value="{$ciudad.municipioId}">{$ciudad.nombre} </option>
                                {/if}
                            {/foreach}
                        </select>

                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Código Postal:</label>
                <div class="col-md-8">
                    <input type="text" name="postalCode" id="postalCode" class="form-control" value="{$info.postalCode}" />
                </div>
            </div>

        </div>
    </div>

    <div class="portlet box {$PORTLET_COLOR}">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-bullhorm"></i>Datos de contacto
            </div>
        </div>
        <div class="portlet-body">

            <div class="form-group">
                <label class="col-md-3 control-label">Email:</label>
                <div class="col-md-8">
                    <input type="text" name="email" id="email" class="form-control" value="{$info.email}" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Celular:</label>
                <div class="col-md-8">
                    <input type="text" name="mobile" id="mobile" class="form-control" value="{$info.mobile}" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Teléfono local</label>
                <div class="col-md-8">
                    <input type="text" name="phone" id="phone" class="form-control" value="{$info.phone}" />
                </div>
            </div>

        </div>
    </div>

    <div class="portlet box {$PORTLET_COLOR}">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-bullhorm"></i>Datos laborales
            </div>
        </div>
        <div class="portlet-body">
            <div class="form-group">
                <label class="col-md-3 control-label">Ocupación</label>
                <div class="col-md-8">
                    <select name="workplaceOcupation" id="workplaceOcupation" style="width:300px" class="form-control">
                        <option value="FUNCIONARIO PUBLICO MUNICIPAL" {if $info.workplaceOcupation == "FUNCIONARIO PUBLICO MUNICIPAL"} selected="selected" {/if}>FUNCIONARIO PUBLICO MUNICIPAL</option>
                        <option value="FUNCIONARIO PUBLICO ESTATAL" {if $info.workplaceOcupation == "FUNCIONARIO PUBLICO ESTATAL"} selected="selected" {/if}>FUNCIONARIO PUBLICO ESTATAL</option>
                        <option value="FUNCIONARIO PUBLICO FEDERAL" {if $info.workplaceOcupation == "FUNCIONARIO PUBLICO FEDERAL"} selected="selected" {/if}>FUNCIONARIO PUBLICO FEDERAL</option>
                        <option value="OTROS" {if $info.workplaceOcupation == "OTROS"} selected="selected" {/if}>OTROS</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Lugar de trabajo:</label>
                <div class="col-md-8">
                    <input type="text" name="workplace" id="workplace" class="form-control" value="{$info.workplace}" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Domicilio:</label>
                <div class="col-md-8">
                    <input type="text" name="workplaceAddress" id="workplaceAddress" class="form-control" value="{$info.workplaceAddress}" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">País</label>
                <div class="col-md-8">
                    <select id="paist" name="paist" style="width:300px" onChange="estado_dependenciat();" class="form-control">
                        <option value="0">Selecciona Tu Pa&iacute;s</option>
                        {foreach from=$paisest item=pais}
                            {if $pais.paisId == $info.paist}
                                <option selected="selected" value="{$pais.paisId}">{$pais.nombre} </option>
                            {else}
                                <option value="{$pais.paisId}">{$pais.nombre} </option>
                            {/if}
                        {/foreach}
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label" >Estado:</label>
                <div class="col-md-8">
                    <div id="Statepositiont">
                        <select id="estadot" name="estadot" style="width:300px" onChange="ciudad_dependenciat();" class="form-control" >
                            <option value="0">Selecciona Tu Estado</option>
                            {foreach from=$estadost item=estado}
                                {if $estado.estadoId == $info.estadot}
                                    <option selected="selected" value="{$estado.estadoId}">{$estado.nombre} </option>
                                {else}
                                    <option value="{$estado.estadoId}">{$estado.nombre} </option>
                                {/if}
                            {/foreach}
                        </select>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Municipio</label>
                <div class="col-md-8">
                    <div id="Citypositiont">
                        <select id="ciudadt" name="ciudadt" style="width:300px" class="form-control" >
                            <option value="0">Selecciona Tu ciudad</option>
                            {foreach from=$ciudadest item=ciudad}
                                {if $ciudad.municipioId == $info.ciudadt}
                                    <option selected="selected" value="{$ciudad.municipioId}">{$ciudad.nombre} </option>
                                {else}
                                    <option value="{$ciudad.municipioId}">{$ciudad.nombre} </option>
                                {/if}
                            {/foreach}
                        </select>

                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Area</label>
                <div class="col-md-8">
                    <input type="text" name="workplaceArea" id="workplaceArea" class="form-control" value="{$info.workplaceArea}" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Teléfono de Oficina</label>
                <div class="col-md-8">
                    <input type="text" name="workplacePhone" id="workplacePhone" class="form-control" value="{$info.workplacePhone}" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Correo Oficial</label>
                <div class="col-md-8">
                    <input type="text" name="workplaceEmail" id="workplaceEmail" class="form-control" value="{$info.workplaceEmail}" />
                </div>
            </div>


        </div>
    </div>

    <div class="portlet box {$PORTLET_COLOR}">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-bullhorm"></i>Estudios
            </div>
        </div>
        <div class="portlet-body">
            <div class="form-group">
                <label class="col-md-3 control-label">Grado Académico</label>
                <div class="col-md-8">
                    <select name="academicDegree" id="academicDegree" class="form-control">
                        <option value="UNIVERSITARIO" {if $info.academicDegree == "UNIVERSITARIO"} selected="selected" {/if}>UNIVERSITARIO</option>
                        <option value="LICENCIATURA" {if $info.academicDegree == "LICENCIATURA"} selected="selected" {/if}>LICENCIATURA</option>
                        <option value="MAESTRIA" {if $info.academicDegree == "MAESTRIA"} selected="selected" {/if}>MAESTRIA</option>
                        <option value="DOCTORADO" {if $info.academicDegree == "DOCTORADO"} selected="selected" {/if}>DOCTORADO</option>
                        <option value="OTROS" {if $info.academicDegree == "OTROS"} selected="selected" {/if}>OTROS</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Profesión</label>
                <div class="col-md-8">
                    <select name="profesion" id="profesion" style="width:300px" class="form-control">
                        {foreach from=$prof item=item}
                            <option value="{$item.profesionId}" {if $info.profesion == $item.profesionId} selected="selected" {/if}>{$item.profesionName}</option>
                            item{/foreach}
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Escuela o Institución  Universitaria:</label>
                <div class="col-md-8">
                    <input type="text" name="school" id="school" class="form-control" value="{$info.school}" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Maestría en:</label>
                <div class="col-md-8">
                    <input type="text" name="masters" id="masters" class="form-control" value="{$info.masters}" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Escuela o Institución Maestría</label>
                <div class="col-md-8">
                    <input type="text" name="mastersSchool" id="mastersSchool" class="form-control" value="{$info.mastersSchool}" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Escuela o Institución Bachillerato</label>
                <div class="col-md-8">
                    <input type="text" name="highSchool" id="highSchool" class="form-control" value="{$info.highSchool}" />
                </div>
            </div>


        </div>
    </div>


   

</form>
<div id="res_">

</div>
 <div class="form-actions">
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
				{if $alumnoSer eq "si"}
				<button type="button" onclick=" location.href='{$WEB_ROOT}/index' " class="btn default" data-dismiss="modal">Regresar</button>
				{else}
				<button type="button" class="btn default" data-dismiss="modal">Salir</button>
				{/if}
                
                <button type="submit" class="btn {$BUTTON_COLOR} submitForm" onClick="saveEditStudentAlumn()">Guardar</button>
            </div>
        </div>
    </div>