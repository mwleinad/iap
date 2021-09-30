$(document).ready(function() {



});

function descargarConstancias(Id,tipodocId){
	
	
	
	 $.ajax({
        url : WEB_ROOT+'/ajax/new/studentCurricula.php',
        type: "POST",
        data : {type: "descargarConstancias", Id:Id, tip:"Activo",tipodocId:tipodocId},
		beforeSend: function(){			

			$('#load_'+Id).html(LOADER3);
		},
        success: function(data)
        {
			console.log(data)
			 $('#load_'+Id).html('');
			 $('#tr_'+Id).toggle();
			 $('#td_'+Id).html(data);

        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}


function VerSolicitud(id){

    $.ajax({
        url : WEB_ROOT+'/ajax/new/studentCurricula.php',
        type: "POST",
        data : {type: "VerSolicitud", id:id, tip:"Activo"},
        success: function(data)
        {
            showModal("&nbsp;", data);
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });

}

function VerGrupo(id,tipo){

    $.ajax({
        url : WEB_ROOT+'/ajax/new/studentCurricula.php',
        type: "POST",
        data : {type: "Student", id:id, tip:"Activo",tipo:tipo},
        success: function(data)
        {
            showModal("&nbsp;", data);
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

function editPeriodos(id){

    $.ajax({
        url : WEB_ROOT+'/ajax/new/studentCurricula.php',
        type: "POST",
        data : {type: "editPeriodos", id:id, tip:"Activo"},
        success: function(data)
        {
            showModal("&nbsp;", data);
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });


}


function verAcciones(id){

$("#divAccion_"+id).toggle();

}


function VerGrupoAdmin(id){

    $.ajax({
        url : WEB_ROOT+'/ajax/new/studentCurricula.php',
        type: "POST",
        data : {type: "StudentAdmin", id:id, tip:"Activo"},
        success: function(data)
        {
            showModal("&nbsp;", data);
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}

function VerGrupoInactivo(id){
    $.ajax({
        url : WEB_ROOT+'/ajax/new/studentCurricula.php',
        type: "POST",
        data : {type: "StudentInactivo", id:id, tip:"Inactivo"},
        success: function(data)
        {
            showModal("&nbsp;", data);
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}

function VerGrupoInactivoAdmin(id){
    $.ajax({
        url : WEB_ROOT+'/ajax/new/studentCurricula.php',
        type: "POST",
        data : {type: "StudentInactivoAdmin", id:id, tip:"Inactivo"},
        success: function(data)
        {
            showModal("&nbsp;", data);
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





function saveNumReferencia(id,activo){
	
	$("#type").val("saveNumReferencia")

	$.ajax({
	  	type: "POST",
	  	url : WEB_ROOT+'/ajax/new/studentCurricula.php',
	  	data: $("#frmGral").serialize(true)+'&id='+id+'&activo='+activo+'&type=saveNumReferencia',
		beforeSend: function(){			
			// $('#tblContent').html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");
			
			// DoSearch()
			if($.trim(splitResp[0]) == "ok"){
					$("#msj").html($.trim(splitResp[1]));
					location.reload();
				}
			else if($.trim(splitResp[0]) == "fail"){
				$("#res_").html(splitResp[1]);
				$("#centeredDivOnPopup").show();
			}
		},
		error:function(){
			alert(msgError);
		}
    });
	
}//saveNumReferencia



function saveMatricula(id,activo){
	
	$("#type").val("saveMatricula")

	$.ajax({
	  	type: "POST",
	  	url : WEB_ROOT+'/ajax/new/studentCurricula.php',
	  	data: $("#frmGral").serialize(true)+'&id='+id+'&activo='+activo+'&type=saveMatricula',
		beforeSend: function(){			
			// $('#tblContent').html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");
			
			// DoSearch()
			if($.trim(splitResp[0]) == "ok"){
					$("#msj").html($.trim(splitResp[1]));
					location.reload();
				}
			else if($.trim(splitResp[0]) == "fail"){
				$("#res_").html(splitResp[1]);
				$("#centeredDivOnPopup").show();
			}
		},
		error:function(){
			alert(msgError);
		}
    });
	
}//saveNumReferencia


function addSaveSolicitud(){
	
	var resp = confirm("¿Seguro de generar el documento?");
	
	if(!resp)
		return;


	$("#type").val("addSaveSolicitud")
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/new/studentCurricula.php',
	  	data: $("#frmGral").serialize(true)+'&solicitudId='+$('#solicitudId').val()+'&type=addSaveSolicitud',
		beforeSend: function(){			
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");
			
		
			if($.trim(splitResp[0]) == "ok"){
					
					// $("#ajax").attr("width","100px");
					// $("#ajax").attr("top","100px");
					
					url=WEB_ROOT+"/ajax/formato-constancia.php?"+$('#frmfiltro').serialize(true)+'&q='+$.trim(splitResp[1]);
					open(url,"Constancia de Estudios","toolbal=0,width=800,resizable=1");
					// $('#tr_'+Id).toggle();
					$("#tr_"+$.trim(splitResp[2])).hide();
					// $("#container").html(splitResp[2]);
					// $("#ajax").html('');
					// $("#ajax").hide();
					// $("#ajax").modal("hide");
					
				}
			else if($.trim(splitResp[0]) == "fail"){
				
				$("#msjgg").html(splitResp[1]);
				// return;

			}
		},
		error:function(){
			alert(msgError);
		}
    });
	
}//addSolicitud




function onBuscar(){
	
	
	
	 $.ajax({
        url : WEB_ROOT+'/ajax/new/studentCurricula.php',
        type: "POST",
       	data: $("#frmFlt1").serialize(true)+'&type=onBuscar',
		beforeSend: function(){			 

			// $('#load_'+Id).html(LOADER3);
		},
        success: function(data)
        {
			console.log(data)
			
			 // $('#load_'+Id).html('');
			 // $('#tr_'+Id).toggle();
			 $('#tblContent').html(data);

        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}





function savePeriodos(){
	
	
	
	 $.ajax({
        url : WEB_ROOT+'/ajax/new/studentCurricula.php',
        type: "POST",
       	data: $("#frmGral").serialize(true)+'&type=savePeriodos',
		beforeSend: function(){			 

			// $('#load_'+Id).html(LOADER3);
		},
        success: function(data)
        {
			console.log(data)
			
			 // $('#load_'+Id).html('');
			 // $('#tr_'+Id).toggle();
			 CloseFview();
			 onBuscar()
			 // $('#tblContent').html(data);

        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}


function DeleteStudentCurricula(userId, courseId)
{
    CloseFview();
    Swal.fire({
        title: '¿Estas seguro que deseas eliminar este alumno de esta curricula?',
        html: '<p><small>Para dar de baja al alumno, debes ingresar el último cuatrimestre o semestre cursado por el alumno.</small></p><input type="text" id="period" class="swal2-input" placeholder="Último cuatrimestre/semestre cursado">',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#58ff85',
        cancelButtonColor: '#ff4545',
        confirmButtonText: 'Confirmar',
        preConfirm: () => {
            const period = Swal.getPopup().querySelector('#period').value
            if (!period ) {
              Swal.showValidationMessage('Por favor, ingresa cuatrimestre/semestre')
            }
            return { period: period }
        }
      }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url : WEB_ROOT + '/ajax/new/studentCurricula.php',
                type: "POST",
                data: {type: "deleteStudentCurricula", courseId: courseId, userId : userId, period: result.value.period},
                beforeSend: function(){			 
                },
                success: function(transport)
                {
                    var response = transport.responseText || "no response text";
                    console.log(response);
        
                    var splitResponse = response.split("[#]");
                    
                    //alert(splitResponse[2])
                    if(splitResponse[0] == "fail")
                    {
                        ShowStatusPopUp(splitResponse[1])
                        CloseFview();
                        
                    }
                    else
                    {
                        Swal.fire(
                            'Exito',
                            'El alumno se elimino correctamente',
                            'success'
                        );
                        //ShowStatusPopUp(splitResponse[1])
                        CloseFview();
                    }
                    grayOut(false);
                    setInterval('window.location.reload()',3000);
                },
                error: function (){ alert('Something went wrong...'); }
            });
        }
    });
}

function EnableStudentCurricula(userId, courseId)
{
    Swal.fire({
        title: '¿Estas seguro que deseas activar al alumno?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '	#58ff85',
        cancelButtonColor: '#ff4545',
        confirmButtonText: 'Confirmar'
      }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url : WEB_ROOT + '/ajax/new/studentCurricula.php',
                type: "POST",
                data: {type: "enableStudentCurricula", courseId: courseId, userId : userId},
                beforeSend: function(){			 
                },
                success: function(transport)
                {
                    var response = transport.responseText || "no response text";
                    console.log(response);
        
                    var splitResponse = response.split("[#]");
                    
                    //alert(splitResponse[2])
                    if(splitResponse[0] == "fail")
                    {
                        ShowStatusPopUp(splitResponse[1])
                        CloseFview();
                        
                    }
                    else
                    {
                        Swal.fire(
                            'Exito',
                            'El alumno se activo correctamente.',
                            'success'
                        );
                        //ShowStatusPopUp(splitResponse[1])
                        CloseFview();
                    }
                    grayOut(false);
                    setInterval('window.location.reload()',3000);
                },
                error: function (){ alert('Something went wrong...'); }
            });
        }
    });
}


function additional() {
    let course = document.getElementById('co').value;
    let cuatri = document.getElementById('cu').value;
    console.log('[Prueba - OK]');
    $.ajax({
        url : WEB_ROOT+'/ajax/new/studentCurricula.php',
        type: "POST",
            data: {type: "additional", course: course, cuatri: cuatri},
        beforeSend: function() {
        },
        success: function(data)
        {
           console.log(data);
            $('#additional').html(data);
        },
        error: function ()
        {
           alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}