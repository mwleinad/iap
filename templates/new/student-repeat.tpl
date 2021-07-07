<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-portrait"></i> Recursar Módulo
    </div>
    <div class="card-body">
        <form id="frmAddCourseModule" name="frmAddCourseModule" method="post" onsubmit="return false">
            <input type="hidden" id="userId" name="userId" value="{$id}"/>
            <input type="hidden" id="type" name="type" value="addCourseModuleStudent"/>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="curricula"><span class="text-danger">*</span> Selecciona Curricula:</label>
                    <select name="curricula" id="curricula" class="form-control" onchange="getModules()">
                        <option value="">-- Seleccionar --</option>
                        {foreach from=$curricula item=curso}
                            <option value="{$curso.courseId}">{$curso.majorName} - {$curso.name} - {$curso.group} - {$curso.courseId}</option>
                        {/foreach}  
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="courseModuleId"><span class="text-danger">*</span> Selecciona Módulo:</label>
                    <div id="divModules">
                        <select name="modulo" id="modulo" class="form-control">
                            <option value=""></option>
                        </select>
                    </div>
                </div>
            </div>
        </form>
        <div class="row">
            <div class="form-group col-md-12 text-center">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Salir</button>
                <button  class="btn btn-success submitForm" onClick="addCourseModule()">Asignar Módulo</button>
            </div>	
        </div>
    </div>
</div>
    