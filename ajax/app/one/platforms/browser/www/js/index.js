/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
var app = {
    // Application Constructor
    initialize: function() {
        this.bindEvents();
		iniciaMysql()
    },
    // Bind Event Listeners
    //
    // Bind any events that are required on startup. Common events are:
    // 'load', 'deviceready', 'offline', and 'online'.
    bindEvents: function() {
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    // deviceready Event Handler
    //
    // The scope of 'this' is the event. In order to call the 'receivedEvent'
    // function, we must explicitly call 'app.receivedEvent(...);'
    onDeviceReady: function() {
        console.log('Received Device Ready Event');
        console.log('calling setup push');
        app.setupPush();
    },
    setupPush: function() {
        console.log('calling push init');
        var push = PushNotification.init({
            "android": {
                "senderID": "363912183478" 
            },
            "browser": {},
            "ios": {
                "sound": true,
                "vibration": true,
                "badge": true
            },
            "windows": {}
        });
        console.log('after init');

        push.on('registration', function(data) {
			
            console.log('registration event: ' + data.registrationId);

            var oldRegId = localStorage.getItem('registrationId');
			
            if (oldRegId !== data.registrationId) {
                // Save new registration ID
                localStorage.setItem('registrationId', data.registrationId);
                // Post registrationId to your app server as the value has changed
            }

            var parentElement = document.getElementById('registration');
            var listeningElement = parentElement.querySelector('.waiting');
            var receivedElement = parentElement.querySelector('.received');

            listeningElement.setAttribute('style', 'display:none;');
            receivedElement.setAttribute('style', 'display:block;');
        });

        push.on('error', function(e) {
			alert(e)
            console.log("push error = " + e.message);
        });

        push.on('notification', function(data) {
            console.log('notification event');
			alert(data)
            navigator.notification.alert(
                data.message,         // message
                null,                 // callback
                data.title,           // title
                'Ok'                  // buttonName
            );
       });
    }
};




var urlLoc = "localhost";

 // var WEB_ROOT = "http://" + urlLoc + "/iap";
  // var WEB_ROOT = "http://www.iapchiapasenlinea.mx/dev/iap";
 var WEB_ROOT = "http://www.iapchiapasenlinea.mx/";

var LOADER3 = "<div align='center'><img src='"+WEB_ROOT+"/images/loading.gif'><br>Cargando...</div>";


function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}
	
function DoLogin()
{
// alert(WEB_ROOT)
    $.ajax({
        url : WEB_ROOT+'/ajax/app/querys.php',
        type: "POST",
        data : $('#frmGral').serialize(),
        success: function(data)
        {
			console.log(data)
            var splitResponse = data.split("[#]");

            if($.trim(splitResponse[0]) == "ok")
            {
				document.cookie = "usuarioId="+splitResponse[1];
                $.mobile.changePage("#home");
				iniciaMysql()
            }
            else if($.trim(splitResponse[0]) == "fail")
            {
               alert('Tu usuario o contraseña son incorrectas. Favor de verificarlas.');
            }
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}


function iniciaMysql()
{
	
	// alert(getCookie("usuarioId"))
	
	$.ajax({
		url : WEB_ROOT+'/ajax/app/querys.php',
        type: "POST",
        data : 'type=inicio&usuarioId='+getCookie("usuarioId"),
        success: function(data)
        {
			
			
			console.log(data)
           var splitResponse = data.split("[#]");
		   $("#fotoheader").html(splitResponse[1])
           $("#dataAlumnos").html(splitResponse[2])
           $("#divActiva").html(splitResponse[3])
           $("#divInactiva").html(splitResponse[4])
           $("#divFinalizada").html(splitResponse[5])
           if($.trim(splitResponse[6])>0){
			    $("#curricula_1").show()
		   } 
			if($.trim(splitResponse[7])>0){
			    $("#curricula_2").show()
		   } 
			if($.trim(splitResponse[8])>0){
			    $("#curricula_3").show()
		   }   		   
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}


function viewModules(Id,estatus)
{

	$.mobile.changePage("#divModules");
	
	document.cookie = "courseId="+Id;
	 
	$.ajax({
		url : WEB_ROOT+'/ajax/app/querys.php',
        type: "POST",
        data : 'type=viewModules&courseId='+Id+'&estatus='+estatus+'&usuarioId='+getCookie("usuarioId"),
        success: function(data)
        {
			
			console.log(data)
           var splitResponse = data.split("[#]");
           $("#divModule").html(splitResponse[1])
            
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
	
}


function verDetalle(Id,estatus)
{

	
	
	document.cookie = "courseId="+Id;
	  $("#seccion_1").hide()
	  $("#seccion_4").hide()
	  $("#seccion_5").hide()
	  $("#seccion_6").hide()
	  $("#seccion_7").hide()
	$.ajax({
		url : WEB_ROOT+'/ajax/app/querys.php',
        type: "POST",
        data : 'type=verDetalle&courseId='+Id+'&estatus='+estatus+'&usuarioId='+getCookie("usuarioId"),
        success: function(data)
        {
			console.log(data)
			var splitResponse = data.split("[#]");
			if(estatus=="Activo"){
				$.mobile.changePage("#divDetalle");
			   $("#divAnuncios").html(splitResponse[1])
			   $("#divInformacion").html(splitResponse[2])
			   $("#divActividad").html(splitResponse[3])
			   $("#divExamen").html(splitResponse[4])
			   $("#divRecursos").html(splitResponse[5])
			   $("#divForo").html(splitResponse[6])
			   $("#divDocente").html(splitResponse[7])
			   if(splitResponse[8]>0){
					 $("#seccion_1").show()
				}
				if($.trim(splitResponse[9])>0){
					 $("#seccion_4").show()
				}
				if(splitResponse[10]>0){
					 $("#seccion_5").show()
				}
				if(splitResponse[11]>0){
					 $("#seccion_6").show()
				}
				if(splitResponse[12]>0){
					 $("#seccion_7").show()
				}

			}else{
				$.mobile.changePage("#divCal");
				$("#divActividades").html(splitResponse[1])
			    $("#divExamenes").html(splitResponse[2])

				if(splitResponse[3]>0){
					 $("#cal_1").show()
				}
				if(splitResponse[4]>0){
					$("#cal_2").show()
				}
			}
			
            
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
	
}	

function miCuenta()
{
	$.mobile.changePage("#cuenta");
	$.ajax({
		url : WEB_ROOT+'/ajax/app/querys.php',
        type: "POST",
        data : 'type=miCuenta&usuarioId='+getCookie("usuarioId"),
        success: function(data)
        {
			console.log(data)
           var splitResponse = data.split("[#]");
           $(".fotoher").html(splitResponse[1])
           $("#divPersonal").html(splitResponse[2])
           $("#divDomicilio").html(splitResponse[3])
           $("#divLaborales").html(splitResponse[4])
           $("#divEstudios").html(splitResponse[5])
            
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}

function back(id)
{
	$(".msj").html("")
	$.mobile.changePage("#"+id);
}


function openAnuncio(Id)
{
	$("#divanun_"+Id).toggle();
}



function detalleActividad(id,tipo)
{
	$.mobile.changePage("#divDetalleActividad");
	$.ajax({
		url : WEB_ROOT+'/ajax/app/querys.php',
        type: "POST",
        data : 'type=detalleActividad&usuarioId='+getCookie("usuarioId")+'&actividadId='+id+'&tipo='+tipo,
        success: function(data)
        {
			console.log(data)
			
			
           var splitResponse = data.split("[#]");
		   $("#divDetalleP").html(splitResponse[1])
			if(tipo=="actividad"){
				$("#tituloactividad").html("Actividad")
			}else{
				$("#tituloactividad").html("Examenes")
			}

            
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}




function detalleRecurso(id)
{
	$.mobile.changePage("#divDetaRecurso");
	$.ajax({
		url : WEB_ROOT+'/ajax/app/querys.php',
        type: "POST",
        data : 'type=detalleRecurso&usuarioId='+getCookie("usuarioId")+'&actividadId='+id,
        success: function(data)
        {
			console.log(data)
           var splitResponse = data.split("[#]");
           $("#divDetalleR").html(splitResponse[1])

            
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}


function openConfig()
{
	$.mobile.changePage("#divConfig");
}

function Close()
{
	$.mobile.changePage("#login");
	document.cookie = "courseId=''";
	document.cookie = "usuarioId=''";
	$("#passwd").val('');
}


function acercaDe()
{
	$.mobile.changePage("#divAcerca");
}





function verSubforo(topicId,courseId)
{
	$.mobile.changePage("#divSubForo");
	$.ajax({
		url : WEB_ROOT+'/ajax/app/querys.php',
        type: "POST",
        data : 'type=verSubforo&usuarioId='+getCookie("usuarioId")+'&topicId='+topicId+'&courseId='+courseId,
        success: function(data)
        {
			console.log(data)
           var splitResponse = data.split("[#]");
           $("#subForo").html(splitResponse[1])
           $("#forotopicId").val(splitResponse[2])

            
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}


function verSubforoDetalle(topicId,courseId)
{
	$.mobile.changePage("#divSubForoDetalle");
	$.ajax({
		url : WEB_ROOT+'/ajax/app/querys.php',
        type: "POST",
        data : 'type=verSubforoDetalle&usuarioId='+getCookie("usuarioId")+'&topicId='+topicId+'&courseId='+courseId,
        success: function(data)
        {
			console.log(data)
           var splitResponse = data.split("[#]");
           $("#subForoDetalle").html(splitResponse[1])
           $("#dtopicId").val(splitResponse[2])
           $("#dcourseId").val(splitResponse[3])
           //$("#forotopicId").val(splitResponse[2])

            
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}


function saveForo(topicId,courseId)
{
	
	$.ajax({
		url : WEB_ROOT+'/ajax/app/querys.php',
        type: "POST",
        data : 'type=saveForo&usuarioId='+getCookie("usuarioId")+'&'+$('#frmForo').serialize(),
		beforeSend: function(){			
			$("#btnSave").hide();
			$(".loader").html(LOADER3);
			$(".msj").html('')
		},
        success: function(data)
        {
			console.log(data)
			$(".loader").html("");
			
           var splitResponse = data.split("[#]");
           if($.trim(splitResponse[0])=="ok"){
			    $("#subForo").html(splitResponse[1])
				$("#asunto").val('')
				$("#mensaje").val('')
		   }else if($.trim(splitResponse[0])=="fail"){
			    $(".msj").html(splitResponse[1])
		   }
		   $("#btnSave").show();
            
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}



/*
function saveAportacion(topicId,courseId)
{
	
	$.ajax({
		url : WEB_ROOT+'/ajax/app/querys.php',
        type: "POST",
        data : 'type=saveAportacion&usuarioId='+getCookie("usuarioId")+'&'+$('#frmAportacion').serialize(),
        beforeSend: function(){	
			// alert("lel")
			$("#btnAportacion").hide();
			$(".loader").html(LOADER3);
			$(".msj").html('')
		},
		success: function(data)
        {
			console.log(data)
			$(".loader").html("");
			
           var splitResponse = data.split("[#]");
		    if(splitResponse[0]=="ok"){
			   $("#subForoDetalle").html(splitResponse[1])
			   $("#aportacion").val('')
			}else if(splitResponse[0]=="fail"){
				$(".msj").html(splitResponse[1])
			}
			$("#btnAportacion").show();
            
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}
*/

function saveAportacion(){
	
	// En esta var va incluido $_POST y $_FILES
	var fd = new FormData(document.getElementById("frmAportacion"));
	fd.append('type','saveAportacion');
	fd.append('usuarioId',getCookie("usuarioId"));

	$.ajax({
		url : WEB_ROOT+'/ajax/app/querys.php',
		data: fd,
		processData: false,
		contentType: false,
		type: 'POST',
		xhr: function(){
				var XHR = $.ajaxSettings.xhr();
				XHR.upload.addEventListener('progress',function(e){
					console.log(e)
					var Progress = ((e.loaded / e.total)*100);
					Progress = (Progress);
					console.log(Progress)
					$('#progress_').val(Math.round(Progress));						
					
				},false);
			return XHR;
		},
		beforeSend: function(){		
			$(".loader").html(LOADER3);
			$(".msj").hide(0);
			$("#btnAportacion").hide();
		},
		success: function(response){
			
			console.log(response);
			var splitResp = response.split("[#]");

			$(".loader").html("");
			$("#btnAportacion").show();
			if($.trim(splitResp[0]) == "ok"){
				  $(".archivoscargados").html('')
				  $("#subForoDetalle").html(splitResp[1])
				  $("#aportacion").val('')
			}else if($.trim(splitResp[0]) == "fail"){
				 $(".msj").html(splitResp[1])			
			}else{
				 alert('Algo salio mal, compruebe su conexion a internet');
			}
			
			
		},
	})

}



function detalleAportacion()
{
	$.mobile.changePage("#Aportacion");
	$.ajax({
		url : WEB_ROOT+'/ajax/app/querys.php',
        type: "POST",
        data : 'type=detalleAportacion&usuarioId='+getCookie("usuarioId")+'&topicId='+topicId+'&courseId='+courseId,
        success: function(data)
        {
			console.log(data)

           $("#divAportacion").html(data)


            
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}

function verComentario(Id)
{
	$("#div_"+Id).toggle();
}



function addComentario(replyId,topicId,courseId)
{
	$.mobile.changePage("#divAddComentario");
	$("#replyId").val(replyId);
	$("#ccourseId").val(courseId);
	$("#ctopicId").val(topicId);
	$("#usuarioId").val(getCookie("usuarioId"));

}







function SaveComentario(){
	
	// En esta var va incluido $_POST y $_FILES
	var fd = new FormData(document.getElementById("frmRetro"));
	fd.append('type','SaveComentario');
	fd.append('usuarioId',getCookie("usuarioId"));

	$.ajax({
		url : WEB_ROOT+'/ajax/app/querys.php',
		data: fd,
		processData: false,
		contentType: false,
		type: 'POST',
		xhr: function(){
				var XHR = $.ajaxSettings.xhr();
				XHR.upload.addEventListener('progress',function(e){
					console.log(e)
					var Progress = ((e.loaded / e.total)*100);
					Progress = (Progress);
					console.log(Progress)
					$('#progress_').val(Math.round(Progress));						
					
				},false);
			return XHR;
		},
		beforeSend: function(){		
			$(".loader").html(LOADER3);
			$(".msj").hide(0);
			$("#btnComentario").hide();
		},
		success: function(response){
			
			console.log(response);
			var splitResp = response.split("[#]");

			$(".loader").html("");
			$("#btnComentario").show();
			if($.trim(splitResp[0]) == "ok"){
				  $("#comentario").val('');
				  $(".archivoscargados").html('');
			   verSubforoDetalle(splitResp[2],splitResp[3])
			}else if($.trim(splitResp[0]) == "fail"){
				 $(".msj").html(splitResp[1])			
			}else{
				 alert('Algo salio mal, compruebe su conexion a internet');
			}
			
			
		},
	})

}



function verFormUp(Id,modl,tipo)
{


	$.mobile.changePage("#divUp");
	$("#upactividadId").val(Id);
	$("#upmodalidad").val(modl);
	$("#tipoactivi").val(tipo);
	$("#upusuarioId").val(getCookie("usuarioId"));
}





function upActividad(){
	
	// En esta var va incluido $_POST y $_FILES
	var fd = new FormData(document.getElementById("frmUpActividad"));
	fd.append('type','upActividad');
	fd.append('usuarioId',getCookie("usuarioId"));

	$.ajax({
		url : WEB_ROOT+'/ajax/app/querys.php',
		data: fd,
		processData: false,
		contentType: false,
		type: 'POST',
		xhr: function(){
				var XHR = $.ajaxSettings.xhr();
				XHR.upload.addEventListener('progress',function(e){
					console.log(e)
					var Progress = ((e.loaded / e.total)*100);
					Progress = (Progress);
					console.log(Progress)
					$('#progress_').val(Math.round(Progress));						
					
				},false);
			return XHR;
		},
		beforeSend: function(){		
			$(".loader").html(LOADER3);
			$(".msj").hide(0);
			$("#btnUpActividad").hide();
		},
		success: function(response){
			
			console.log(response);
			var splitResp = response.split("[#]");

			$(".loader").html("");
			$("#btnUpActividad").show();
			if($.trim(splitResp[0]) == "ok"){
					
					$(".archivoscargados").html('');
				  $("#titulo").val('');
			   detalleActividad(splitResp[1],splitResp[2])
			}else if($.trim(splitResp[0]) == "fail"){
				 $(".msj").html(splitResp[1])			
			}else{
				 alert('Algo salio mal, compruebe su conexion a internet');
			}
			
			
		},
	})

}





function editFoto(){
	
	// En esta var va incluido $_POST y $_FILES
	var fd = new FormData(document.getElementById("frmAlumno"));
	fd.append('type','editFoto');
	fd.append('usuarioId',getCookie("usuarioId"));

	$.ajax({
		url : WEB_ROOT+'/ajax/app/querys.php',
		data: fd,
		processData: false,
		contentType: false,
		type: 'POST',
		xhr: function(){
				var XHR = $.ajaxSettings.xhr();
				XHR.upload.addEventListener('progress',function(e){
					console.log(e)
					var Progress = ((e.loaded / e.total)*100);
					Progress = (Progress);
					console.log(Progress)
					$('#progress_').val(Math.round(Progress));						
					
				},false);
			return XHR;
		},
		beforeSend: function(){		
			$(".loader").html(LOADER3);
			$(".msj").hide(0);
			$("#btnUpActividad").hide();
		},
		success: function(response){
			
			console.log(response);
			var splitResp = response.split("[#]");

			$(".loader").html("");
			$("#btnUpActividad").show();
			if($.trim(splitResp[0]) == "ok"){
				$.mobile.changePage("#home");
				iniciaMysql()
			}else if($.trim(splitResp[0]) == "fail"){
				 $(".msj").html(splitResp[1])			
			}else{
				 alert('Algo salio mal, compruebe su conexion a internet');
			}
			
			
		},
	})

}

function compruebaExistencia(Id){
	$("#archiivocargado_"+Id).html('<font color="276e36">Archivo adjunto</font>');
}



function verSeccion(Id){
	
	$(".menuPrincipal").attr("href", "#myPanel");
	$.ajax({
		url : WEB_ROOT+'/ajax/app/querys.php',
        type: "POST",
        data : 'type=verSeccion&Id='+Id,
		beforeSend: function(){			
			$("#btnSave").hide();
			$(".loader").html(LOADER3);
			$(".msj").html('')
		},
        success: function(data)
        {
			 console.log(data)

		// $("#myPanel").html(data);
			
			$("#divmyPanel").html(data);
            
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
	
}





function backHome()
{
	if($("#auxMenu").val() == 1){
		clickMenu(13)
	}else{
		$.mobile.changePage("#welcome");
	}
	
}



function CargaDoLogin()
{

	$.mobile.changePage("#login");
}





function verSubSeccion(Id){
	
	// $(".menuPrincipal").attr("href", "#myPanel");
	$.ajax({
		url : WEB_ROOT+'/ajax/app/querys.php',
        type: "POST",
        data : 'type=verSubSeccion&Id='+Id,
		beforeSend: function(){			
			$("#btnSave").hide();
			$(".loader").html(LOADER3);
			$(".msj").html('')
		},
        success: function(data)
        {
			 console.log(data)
			var splitResp = data.split("[#]");
		// $("#myPanel").html(data);
			$.mobile.changePage("#pagSubSeccion");
			$("#divSubSeccion").html(splitResp[1]);
			$("#divFooter").html(splitResp[2]);
			

		
			
            
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
	
}




function clickMenu(Id){
	
	// $(".menuPrincipal").attr("href", "#myPanel");
	$.ajax({
		url : WEB_ROOT+'/ajax/app/querys.php',
        type: "POST",
        data : 'type=clickMenu&Id='+Id,
		beforeSend: function(){			
			$("#btnSave").hide();
			$(".loader").html(LOADER3);
			$(".msj").html('')
		},
        success: function(data)
        {
			 console.log(data)
			var splitResp = data.split("[#]");
		// $("#myPanel").html(data);
			// $.mobile.changePage("#pagSubSeccion");
			$("#contenidoAjax").html(splitResp[1]);
			// $("#divFooter").html(splitResp[2]);
			

		
			
            
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
	
}


function saveContacto(topicId,courseId)
{
	
	$.ajax({
		url : WEB_ROOT+'/ajax/app/querys.php',
        type: "POST",
        data : 'type=saveContacto&usuarioId='+getCookie("usuarioId")+'&'+$('#frmContacto').serialize(),
		beforeSend: function(){			
			$("#btnSave").hide();
			$(".loader").html(LOADER3);
			$(".msj").html('')
		},
        success: function(data)
        {
			console.log(data)
			$(".loader").html("");
			
           var splitResponse = data.split("[#]");
           if($.trim(splitResponse[0])=="ok"){
			    $("#msjContacto").html(splitResponse[1])
			    $(".txts").val('')
		   }else if($.trim(splitResponse[0])=="fail"){
			    $(".msj").html(splitResponse[1])
		   }
		   $("#btnSave").show();
            
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}


function verPortal(Id)
{
	if(Id == 7){
		$.mobile.changePage("#portal");
	}else if(Id == 9){
		$.mobile.changePage("#portalprodim");
	}else if(Id == 12){
		$.mobile.changePage("#portalred");
	}else if(Id == 24){
		$.mobile.changePage("#portalprofe");
	}else if(Id == 6){
		$.mobile.changePage("#portalconta");
	}
	
}