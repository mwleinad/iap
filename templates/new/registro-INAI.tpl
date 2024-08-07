<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-user-plus"></i> Registro de información
    </div>
    <div class="card-body">
        <div id="tblContent">
            <form id="form_student" action="{$WEB_ROOT}/ajax/new/student.php" method="POST" class="form">
                <input type="hidden" name="opcion" value="registro-inai" />
                <span class="badge badge-dark"><i class="fas fa-user"></i> Información Personal</span>
                <hr />
                <div class="row">
                    <div class="form-group col-md-4">
                        <label for="names">Nombre:</label>
                        <input type="text" name="names" id="names" class="form-control" />
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="lastNamePaterno">Apellido Paterno:</label>
                        <input type="text" name="lastNamePaterno" id="lastNamePaterno" value="" class="form-control" />
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="lastNameMaterno">Apellido Materno:</label>
                        <input type="text" name="lastNameMaterno" id="lastNameMaterno" class="form-control" />
                        <span class="invalid-feedback"></span>
                    </div>
                </div>
                <div class="row align-items-end">
                    <div class="form-group col-md-4">
                        <label for="sexo">Sexo:</label>
                        <select name="sexo" id="sexo" class="form-control">
                            <option value="m">Masculino</option>
                            <option value="f">Femenino</option>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="curparchivo">Favor de subir su CURP en formato PDF, si no cuenta con ella puede
                            descargarla en el siguiente enlace: <a href="https://www.gob.mx/curp/"
                                target="_blank">https://www.gob.mx/curp/</a></label>
                        <input type="file" class="form-control" id="curparchivo" name="curparchivo">
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label>Escribe tu curp:</label>
                        <input type="text" class="form-control" id="curp" name="curp">
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="password">Contraseña del Sistema (Minimo 6 caracteres):</label>
                        <input type="password" name="password" id="password" class="form-control"
                            autocomplete="new-password" />
                        <span class="invalid-feedback"></span>
                    </div>
                </div>
                <span class="badge badge-dark"><i class="fas fa-address-book"></i> Datos de Contacto</span>
                <hr />
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="email">Correo Electrónico:</label>
                        <input type="text" name="email" id="email" class="form-control" />
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="mobile">Celular:</label>
                        <input type="text" name="mobile" id="mobile" class="form-control" />
                        <span class="invalid-feedback"></span>
                    </div>
                </div>

                <span class="badge badge-dark"><i class="fas fa-briefcase"></i> Datos laborales</span>
                <hr />
                <div class="row">
                    <div class="form-group col-md-4">
                        <label for="funcion">Función archivística que desempeña</label>
                        <select class="form-control" id="funcion" name="funcion">
                            <option value="1">Coordinador de archivos</option>
                            <option value="2">Correspondencia</option>
                            <option value="3">Archivo de trámite</option>
                            <option value="4">Archivo de concentración</option>
                            <option value="5">Archivo histórico</option>
                            <option value="6">Grupo interdisciplinario</option>
                            <option value="7">Ninguna de las anteriores</option>
                        </select>
                        <span class="invalid-feedback"></span>
                    </div>
                </div>
                <span class="badge badge-dark"><i class="fas fa-graduation-cap"></i> Estudios</span>
                <hr />
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="academicDegree">Grado Académico:</label>
                        <select name="academicDegree" id="academicDegree" class="form-control">
                            <option value="UNIVERSITARIO" {if $info.academicDegree == "UNIVERSITARIO"}
                                selected="selected" {/if}>
                                UNIVERSITARIO</option>
                            <option value="LICENCIATURA" {if $info.academicDegree == "LICENCIATURA"} selected="selected"
                                {/if}>
                                LICENCIATURA</option>
                            <option value="MAESTRIA" {if $info.academicDegree == "MAESTRIA"} selected="selected" {/if}>
                                MAESTRIA
                            </option>
                            <option value="DOCTORADO" {if $info.academicDegree == "DOCTORADO"} selected="selected"
                                {/if}>DOCTORADO
                            </option>
                            <option value="OTROS" {if $info.academicDegree == "OTROS"} selected="selected" {/if}>OTROS
                            </option>
                        </select>
                    </div>
                </div>
                <div id="loader"></div>
                <div class="form-group text-center">
                    {if isset($no_admin)}
                        <a href="{$WEB_ROOT}" class="btn btn-danger">Regresar</a>
                    {else}
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                    {/if}
                    <button type="submit" class="btn btn-success" id="addStudent">Guardar</button>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <a href="https://iapchiapas.edu.mx/aviso_privacidad" target="_blank"
                            title="Aviso de Privacidad">
                            Aviso de Privacidad
                        </a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>