<form id="addStudentForm" name="addStudentForm" method="POST">
    <input type="hidden" id="type" name="type" value="saveAddStudentRegister" />
    <input type="hidden" id="redireccion" name="redireccion" value="1"/>
    <input type="hidden" id="tam" name="tam" value="0"/>
    <input type="hidden" id="permiso" name="permiso" value="0"/>

    <span class="badge badge-dark"><i class="fas fa-user"></i> Información Personal</span><hr />
    <div class="row">
        <div class="form-group col-md-4">
            <label for="names">Nombre:</label>
            <input type="text" name="names" id="names" class="form-control" />
        </div>
        <div class="form-group col-md-4">
            <label for="lastNamePaterno">Apellido Paterno:</label>
            <input type="text" name="lastNamePaterno" id="lastNamePaterno" value="" class="form-control" />
        </div>
        <div class="form-group col-md-4">
            <label for="lastNameMaterno">Apellido Materno:</label>
            <input type="text" name="lastNameMaterno" id="lastNameMaterno" class="form-control" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="sexo">Sexo:</label>
            <select name="sexo" id="sexo" class="form-control">
                <option value="m">Masculino</option>
                <option value="f">Femenino</option>
            </select>
        </div>
        <div class="form-group col-md-6">
            {* day-month-year *}
            <label for="birthday">Fecha de Nacimiento:</label>
            <input type="text" id="birthday" name="birthday" class="form-control i-calendar" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="maritalStatus">Estado Civil:</label>
            {include file="forms/maritalStatus.tpl" selected=$info.maritalStatus}
        </div>
        <div class="form-group col-md-6">
            <label for="password">Contraseña del Sistema (Minimo 6 caracteres):</label>
            <input type="password" name="password" id="password" class="form-control" autocomplete="new-password" />
        </div>
    </div>

    <span class="badge badge-dark"><i class="fas fa-map-marked-alt"></i> Domicilio</span><hr />
    <div class="row">
        <div class="form-group col-md-4">
            <label for="street">Calle:</label>
            <input type="text" name="street" id="street" class="form-control" />
        </div>
        <div class="form-group col-md-4">
            <label for="number">Número:</label>
            <input type="text" name="number" id="number" class="form-control" />
        </div>
        <div class="form-group col-md-4">
            <label for="colony">Colonia:</label>
            <input type="text" name="colony" id="colony" class="form-control" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-3">
            <label for="pais">País:</label>
            <select id="pais" name="pais" onChange="estado_dependencia();" class="form-control">
                <option value="0">Selecciona Tu Pa&iacute;s</option>
                {foreach from=$paises item=pais}
                    <option value="{$pais.paisId}">{$pais.nombre} </option>
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-3">
            <label for="estado">Estado:</label>
            <div id="Stateposition">
                <select id="estado" name="estado" onChange="ciudad_dependencia();" class="form-control">
                    <option value="0">Selecciona tu Estado</option>
                </select>
            </div>
        </div>
        <div class="form-group col-md-3">
            <label for="ciudad">Municipio:</label>
            <div id="Cityposition">
                <select id="ciudad" name="ciudad" class="form-control">
                    <option value="0">Selecciona tu Ciudad</option>
                </select>
            </div>
        </div>
        <div class="form-group col-md-3">
            <label for="postalCode">Código Postal:</label>
            <input type="text" name="postalCode" id="postalCode" class="form-control" />
        </div>
    </div>

    <div class="portlet box red">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-bullhorm"></i>Datos de contacto
            </div>
        </div>
        <div class="portlet-body">

            <div class="form-group">
                <label class="col-md-3 control-label">Correo Electr&oacute;nico:</label>
                <div class="col-md-8">
                    <input type="text" name="email" id="email" value=""  class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Celular:</label>
                <div class="col-md-8">
                    <input type="text" name="mobile" id="mobile"  class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Tel&eacute;fono Local:</label>
                <div class="col-md-8">
                    <input type="text" name="phone" id="phone" value=""  class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Teléfono Alternativo:</label>
                <div class="col-md-8">
                    <input type="text" name="fax" id="fax" value=""  class="form-control" />
                </div>
            </div>
        </div>
    </div>

    <div class="portlet box red">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-bullhorm"></i>Datos laborales
            </div>
        </div>
        <div class="portlet-body">

            <div class="form-group">
                <label class="col-md-3 control-label">Ocupacion:</label>
                <div class="col-md-8">
                    <select name="workplaceOcupation" id="workplaceOcupation" style="width:300px"  class="form-control">
                        <option value="FUNCIONARIO PUBLICO MUNICIPAL" {if $info.workplaceOcupation == "FUNCIONARIO PUBLICO MUNICIPAL"} selected="selected" {/if}>FUNCIONARIO PUBLICO MUNICIPAL</option>
                        <option value="FUNCIONARIO PUBLICO ESTATAL" {if $info.workplaceOcupation == "FUNCIONARIO PUBLICO ESTATAL"} selected="selected" {/if}>FUNCIONARIO PUBLICO ESTATAL</option>
                        <option value="FUNCIONARIO PUBLICO FEDERAL" {if $info.workplaceOcupation == "FUNCIONARIO PUBLICO FEDERAL"} selected="selected" {/if}>FUNCIONARIO PUBLICO FEDERAL</option>
                        <option value="OTROS" {if $info.workplaceOcupation == "OTROS"} selected="selected" {/if}>OTROS</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Lugar de Trabajo:</label>
                <div class="col-md-8">
                    <input type="text" name="workplace" id="workplace" value=""  class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Domicilio de Trabajo:</label>
                <div class="col-md-8">
                    <input type="text" name="workplaceAddress" id="workplaceAddress" value=""  class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">País:</label>
                <div class="col-md-8">
                    <select id="paist" name="paist" style="width:350px" onChange="estado_dependenciat();" class="form-control">
                        <option value="0">Selecciona Tu Pa&iacute;s</option>
                        {foreach from=$paises item=pais}
                            <option value="{$pais.paisId}">{$pais.nombre} </option>
                        {/foreach}
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Estado:</label>
                <div class="col-md-8">
                    <div id="Statepositiont">
                        <select id="estadot" name="estadot" onChange='ciudad_dependenciat();' style="width:350px" class="form-control" >
                            <option value="0">Selecciona tu Estado</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label"> Municipio:</label>
                <div class="col-md-8">
                    <div id="Citypositiont">
                        <select id="ciudadt" name="ciudadt" style="width:350px" class="form-control" >
                            <option value="0">Selecciona tu Ciudad</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Área:</label>
                <div class="col-md-8">
                    <input type="text" name="workplaceArea" id="workplaceArea" value=""  class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Puesto:</label>
                <div class="col-md-8">
                    <input type="text" name="workplacePosition" id="workplacePosition"  class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Telefono Oficina:</label>
                <div class="col-md-8">
                    <input type="text" name="workplacePhone" id="workplacePhone" value=""  class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Correo Electrónico Oficial:</label>
                <div class="col-md-8">
                    <input type="text" name="workplaceEmail" id="workplaceEmail" value=""  class="form-control" />
                </div>
            </div>
        </div>
    </div>

    <div class="portlet box red">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-bullhorm"></i>Estudios
            </div>
        </div>
        <div class="portlet-body">
            <div class="form-group">
                <label class="col-md-3 control-label">Grado Académico:</label>
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
                <label class="col-md-3 control-label">Profesion:</label>
                <div class="col-md-8">
                    <select name="profesion" id="profesion" style="width:300px" class="form-control" >
                        {foreach from=$prof item=item}
                            <option value="{$item.profesionId}" {if $info.profesion == $item.profesionId} selected="selected" {/if}>{$item.profesionName}</option>
                            item{/foreach}
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Escuela o Institución Universitaria:</label>
                <div class="col-md-8">
                    <input type="text" name="school" id="school" value=""  class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Maestría en:</label>
                <div class="col-md-8">
                    <input type="text" name="masters" id="masters"  class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Escuela o Institución Maestría:</label>
                <div class="col-md-8">
                    <input type="text" name="mastersSchool" id="mastersSchool" value=""  class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Escuela o Institución Bachillerato:</label>
                <div class="col-md-8">
                    <input type="text" name="highSchool" id="highSchool" value=""  class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Selecciona el programa académico al que te quieres registrar:</label>
                <div class="col-md-8">
                    <select name='curricula' id="curricula" style="width:400px" class="form-control">
                        {foreach from=$activeCourses item=course}
                            <option value="{$course.courseId}">{$course.majorName} - {$course.name} - {$course.group}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
        </div>
    </div>
    </div>
   

</form>
<div id="loader">
</div>
 <div class="form-actions">
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
                <button type="button" class="btn default" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn green submitForm" onclick="AddStudentRegister();" id="addStudent" >Guardar</button>
            </div>
        </div>
    </div>
	<br>
	<br>
	<div>
	<a href="{$WEB_ROOT}/graybox.php?page=aviso" data-target="#ajax" data-toggle="modal" data-width="1000px" title='AVISO DE PRIVACIDAD'>
	<font style="color:#73b760; font-weight: bold;">Aviso de Privacidad
	</font>
	</a>
	</div>

    <script>
        flatpickr('.i-calendar', {
            dateFormat: "Y-m-d"
        });
    </script>
