<form class="form-horizontal" id="addStudentForm" name="addStudentForm" method="post"   >
    <input type="hidden" id="type" name="type" value="saveAddStudentRegister"/>
    <input type="hidden" id="redireccion" name="redireccion" value="1"/>
    <input type="hidden" id="tam" name="tam" value="0"/>
    <input type="hidden" id="permiso" name="permiso" value="0"/>
    <div class="portlet box red">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-bullhorm"></i>Información Personal
            </div>
        </div>
        <div class="portlet-body">

            <div class="form-group">
                <label class="col-md-3 control-label">Nombre:</label>
                <div class="col-md-8">
                    <input type="text" name="names" id="names" class="form-control" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label"> Apellido Paterno:</label>
                <div class="col-md-8">
                    <input type="text" name="lastNamePaterno" id="lastNamePaterno" value="" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Apellido Materno:</label>
                <div class="col-md-8">
                    <input type="text" name="lastNameMaterno" id="lastNameMaterno"  class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Sexo:</label>
                <div class="col-md-8">
                    <select name='sexo' id="sexo" class="form-control">
                        <option value="m">Masculino</option>
                        <option value="f">Femenino</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Fecha de Nacimiento:</label>
                <div class="col-md-8">
                    <select name="day" id="day" style="width:70px" class="form-control">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                        <option value="19">19</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="23">23</option>
                        <option value="24">24</option>
                        <option value="25">25</option>
                        <option value="26">26</option>
                        <option value="27">27</option>
                        <option value="28">28</option>
                        <option value="29">29</option>
                        <option value="30">30</option>
                        <option value="31">31</option>
                    </select>
                    <select name="month" id="month"  style="width:100px" class="form-control">
                        <option value="1">Enero</option>
                        <option value="2">Febrero</option>
                        <option value="3">Marzo</option>
                        <option value="4">Abril</option>
                        <option value="5">Mayo</option>
                        <option value="6">Junio</option>
                        <option value="7">Julio</option>
                        <option value="8">Agosto</option>
                        <option value="9">Septiembre</option>
                        <option value="10">Octubre</option>
                        <option value="11">Noviembre</option>
                        <option value="12">Diciembre</option>
                    </select>
                    {include file="forms/year.tpl" name="year"}
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Estado Civil:</label>
                <div class="col-md-8">
                    {include file="forms/maritalStatus.tpl" selected=$info.maritalStatus}
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Contraseña del Sistema (Minimo 6 caracteres):</label>
                <div class="col-md-8">
                    <input type="password" name="password" id="password" value=""  class="form-control" />
                </div>
            </div>
        </div>
    </div>

    <div class="portlet box red">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-bullhorm"></i>Domicilio
            </div>
        </div>
        <div class="portlet-body">
            <div class="form-group">
                <label class="col-md-3 control-label">Calle:</label>
                <div class="col-md-8">
                    <input type="text" name="street" id="street" value=""  class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Número:</label>
                <div class="col-md-8">
                    <input type="text" name="number" id="number"  class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Colonia:</label>
                <div class="col-md-8">
                    <input type="text" name="colony" id="colony" value=""  class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">País:</label>
                <div class="col-md-8">
                    <select id="pais" name="pais" style="width:350px" onChange="estado_dependencia();"  class="form-control">
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
                    <div id="Stateposition">
                        <select id="estado" name="estado" onChange='ciudad_dependencia();' style="width:350px" class="form-control">
                            <option value="0">Selecciona tu Estado</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label"> Municipio:</label>
                <div class="col-md-8">
                    <div id="Cityposition">
                        <select id="ciudad" name="ciudad" style="width:350px" class="form-control">
                            <option value="0">Selecciona tu Ciudad</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">C&oacute;digo Postal:</label>
                <div class="col-md-8">
                    <input type="text" name="postalCode" id="postalCode" value=""  class="form-control" />
                </div>
            </div>
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

 <div class="form-actions">
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
                <button type="button" class="btn default" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn green submitForm" onclick="AddStudentRegister();" id="addStudent" >Guardar</button>
            </div>
        </div>
    </div>
