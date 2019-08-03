$( document ).ready(function() {

    $('#btnAddPersonal').click(function() {
        AddPersonalDiv();
    });

   $(document).on("click",".spanDelete",function() {
        var $id = $(this).attr('id');
        DeletePersonalPopup($id);
    });

    $(document).on("click",".spanEdit",function() {
        var $id = $(this).attr('id');
        EditPersonalPopup($id);
    });

    $('#my_multi_select1').multiSelect();
});



function EditPersonalPopup(id)
{
    $.ajax({
        url : WEB_ROOT+'/ajax/new/personal.php',
        type: "POST",
        data : {type: "editPersonal", id:id},
        success: function(data)
        {
            showModal("Editar Personal", data);
            $('.submitForm').click(function() {
                EditPersonal();
            });
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexión a internet');
        }
    });
}

function EditPersonal()
{
    $.ajax({
        url : WEB_ROOT+'/ajax/new/personal.php',
        type: "POST",
        data :  $('#editPersonalForm').serialize(),
        success: function(data)
        {
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
            alert('Algo salio mal, compruebe su conexión a internet');
        }
    });
}

function DeletePersonalPopup(id)
{
    var $message = "¿Está seguro de eliminar este usuario? Toma en cuenta que podrían perdese muchas asociaciones (Horarios, materias, etc)";
    bootbox.confirm($message, function(result) {
        if(result == false)
        {
            return;
        }

        $.ajax({
            url : WEB_ROOT+'/ajax/new/personal.php',
            type: "POST",
            data : {type: "deletePersonal", id: id},
            success: function(data, textStatus, jqXHR)
            {
                var splitResponse = data.split("[#]");
                ShowStatus(splitResponse[1]);
                $('#tblContent').html(splitResponse[2]);
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Algo salio mal, compruebe su conexión a internet');
            }
        });

    });
}

function AddPersonal()
{
    $.ajax({
        url : WEB_ROOT+'/ajax/new/personal.php',
        type: "POST",
        data :  $('#addPersonalForm').serialize(),
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
/*
function getCurp()
{

    var name = $('name').value;
    var paterno = $('lastname_paterno').value;
    var materno = $('lastname_materno').value;
    var stateId = $('stateId').value;
    var sexo = $('sexo').value;
    var fecha = $('fecha_nacimiento').value;

    new Ajax.Request(WEB_ROOT+'/ajax/personal.php',
        {
            method:'post',
            parameters: {type: "getCurp", name: name, paterno:paterno, materno:materno, stateId:stateId, sexo:sexo, fecha:fecha},
            onSuccess: function(transport){
                var response = transport.responseText || "no response text";

                var splitResponse = response.split("[#]");
                if(splitResponse[0] == "ok"){
                    $('curp').value = splitResponse[1];
                }else if(splitResponse[0] == "fail"){
                    alert("Lo sentimos, pero no se pudo generar la CURP");
                }else{
                    alert(response);
                }


            },
            onFailure: function(){ alert('Something went wrong...') }
        });
}

*/
function AddPersonalDiv()
{
    $.ajax({
        url : WEB_ROOT+'/ajax/new/personal.php',
        type: "POST",
        data : {type: "addPersonal"},
        success: function(data)
        {
            showModal("Agregar Personal", data);
            $('.submitForm').click(function() {
                AddPersonal();
            });
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexión a internet');
        }
    });
}

function MoveRole(From, To){
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
/*
function SendRolesData(listFrom, fieldTo){
    var ResultLine = "";
    OptionsHandlerSrc = listFrom.options;
    for(i=0;i<OptionsHandlerSrc.length;i++){
        ResultLine+= OptionsHandlerSrc[i].value + ",";
    }//for
    fieldTo.value = ResultLine;
}//SendRolesData*/



function compruebaFirma()
{
	if($("#firmaConstancia").val()=='si'){
		 $.ajax({
			url : WEB_ROOT+'/ajax/new/personal.php',
			type: "POST",
			data : {type: "compruebaFirma"},
			success: function(data)
			{
				console.log(data);
				var splitResponse = data.split("[#]");
				if($.trim(splitResponse[0]) == "fail"){
					$('#divMsj').html($.trim(splitResponse[1]));
					$('#btnEdit').hide();
				}
				
			},
			error: function ()
			{
				alert('Algo salio mal, compruebe su conexión a internet');
			}
		});
	}else{
		$('#btnEdit').show();
	}
   
}