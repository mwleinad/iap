$(document).ready(function() {



});


function VerGrupo(id){

    $.ajax({
        url : WEB_ROOT+'/ajax/new/studentCurricula.php',
        type: "POST",
        data : {type: "Student", id:id},
        success: function(data)
        {
            showModal("Ver Grupo Activos", data);
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });

/*
    new Ajax.Request(WEB_ROOT+'/ajax/studentCurricula.php',
        {
            method:'post',
            parameters: {type: "Student", id:id},
            onSuccess: function(transport){
                var response = transport.responseText || "no response text";
                FViewOffSet(response);
                Event.observe($('closePopUpDiv'), "click", function(){ CancelFview(); });
                Event.observe($('btnCancel'), "click", function(){ CancelFview(); });
                Event.observe($('editRole'), "click", EditRole);

            },
            onFailure: function(){ alert('Something went wrong...') }
        });
*/

}


function viewAccions(Id){
	
		$("#divAcciones_"+Id).toggle();
	}
	
function VerGrupoInactivo(id){
    $.ajax({
        url : WEB_ROOT+'/ajax/new/studentCurricula.php',
        type: "POST",
        data : {type: "StudentInactivo", id:id},
        success: function(data)
        {
            showModal("Ver Grupo Inactivo", data);
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}

function generar(courseId,tipo){

    if(tipo=="ESPECIALIDAD"){
        tipo=1;
        type="genera_especialidad";
    }
    if(tipo=="MAESTRIA"){
        type="genera_maestrias";
        tipo=2;
    }

    $.ajax({
        url : WEB_ROOT+'/ajax/new/matricula.php',
        type: "POST",
        data : {type: type, courseId: courseId, tipo : tipo},
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
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });

/*    new Ajax.Request(WEB_ROOT+'/ajax/matricula.php',
        {
            method:'post',
            parameters: {type: type, courseId: courseId, tipo : tipo},
            onSuccess: function(transport){
                var response = transport.responseText || "no response text";
                //alert(response)
                var splitResponse = response.split("[#]");
                if(splitResponse[0] == "fail")
                {
                    ShowStatus(splitResponse[1])
                }
                else
                {
                    ShowStatus(splitResponse[1])
                    //$('tblContent').innerHTML = splitResponse[2];
                    CloseFview();
                }

            },
            onFailure: function(){ alert('Something went wrong...') }
        });*/


}

