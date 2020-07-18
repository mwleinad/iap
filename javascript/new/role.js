$( document ).ready(function() {

    $('#btnAddRole').click(function() {
        AddRoleDiv();
    });

    $(document).on("click",".spanDelete",function() {
        var $id = $(this).attr('id');
        DeleteRolePopup($id);
    });

    $(document).on("click",".spanEdit",function() {
        var $id = $(this).attr('id');
        EditRolePopup($id);
    });
	
	 $(document).on("click",".spanActivar",function() {
        var $id = $(this).attr('id');
        ActivarRolePopup($id);
    });
	
});


function AddRoleDiv()
{
    $.ajax({
        url : WEB_ROOT+'/ajax/new/role.php',
        type: "POST",
        data : {type: "addRole"},
        success: function(data)
        {
            showModal("Agregar Rol", data);
            $('.submitForm').click(function() {
                AddRole();
            });
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}

function AddRole()
{
	
	SendModulesData(document.addRoleForm.module_to,document.addRoleForm.list_modules);
	
	
    $.ajax({
        url : WEB_ROOT+'/ajax/new/role.php',
        type: "POST",
        data :  $('#addRoleForm').serialize(),
        success: function(data)
        {
            var splitResponse = data.split("[#]");
console.log(data)
            if(splitResponse[0] == "fail")
            {
                ShowStatusPopUp($(splitResponse[1]));
            }
            else
            {
                ShowStatus($(splitResponse[1]));
                $('#tblContent').html(splitResponse[2]);
                CloseFview();
            }
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}

function DeleteRolePopup(id)
{
    var $message = "¿Esta seguro de eliminar este rol? Toma en cuenta que podrían perdese muchas asociaciones (Horarios, maestros, etc)";
    bootbox.confirm($message, function(result) {
        if(result == false)
        {
            return;
        }

        $.ajax({
            url : WEB_ROOT+'/ajax/new/role.php',
            type: "POST",
            data : {type: "deleteRole", id: id},
            success: function(data, textStatus, jqXHR)
            {
                var splitResponse = data.split("[#]");
                ShowStatus(splitResponse[1]);
                $('#tblContent').html(splitResponse[2]);
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Algo salio mal, compruebe su conexion a internet');
            }
        });

    });
}

function ActivarRolePopup(id)
{
    var $message = "¿Esta seguro de habilitar este rol? ";
    bootbox.confirm($message, function(result) {
        if(result == false)
        {
            return;
        }

        $.ajax({
            url : WEB_ROOT+'/ajax/new/role.php',
            type: "POST",
            data : {type: "ActivarRolePopup", id: id},
            success: function(data, textStatus, jqXHR)
            {
                var splitResponse = data.split("[#]");
                ShowStatus(splitResponse[1]);
                $('#tblContent').html(splitResponse[2]);
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Algo salio mal, compruebe su conexion a internet');
            }
        });

    });
}

function EditRolePopup(id)
{
    $.ajax({
        url : WEB_ROOT+'/ajax/new/role.php',
        type: "POST",
        data : {type: "editRole", id:id},
        success: function(data)
        {
            showModal("Editar Rol", data);
            $('.submitForm').click(function() {
                EditRole();
            });
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}

function EditRole()
{
	SendModulesData(document.editRoleForm.module_to,document.editRoleForm.list_modules);
	
    $.ajax({
        url : WEB_ROOT+'/ajax/new/role.php',
        type: "POST",
        data :  $('#editRoleForm').serialize(),
        success: function(data)
        {
			console.log(data)
            var splitResponse = data.split("[#]");

            if(splitResponse[0] == "fail")
            {
                ShowStatusPopUp($(splitResponse[1]));
            }
            else
            {
                ShowStatus($(splitResponse[1]));
                $('#tblContent').html(splitResponse[2]);
                CloseFview();
            }
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}


function MoveModule(From, To){
    var LOptions = new Array();
    var j=0;
    var k=0;
    OptFrom = From.options;
    OptTo = To.options;
    for(i=0;i<OptFrom.length;i++){
        if(OptFrom[i].selected == true){
            OptTo[OptTo.length] =
                new Option(OptFrom[i].text,OptFrom[i].value);
            OptFrom[i] = null;
            LOptions[j] = i;
            j++;
            i--;
        }//if
    }//for
}//MoveOptions

function SendModulesData(listFrom, fieldTo){
	var ResultLine = "";
	OptionsHandlerSrc = listFrom.options;
	for(i=0;i<OptionsHandlerSrc.length;i++){
		ResultLine+= OptionsHandlerSrc[i].value + ",";
	}//for
	fieldTo.value = ResultLine;		
}//SendModulesData
