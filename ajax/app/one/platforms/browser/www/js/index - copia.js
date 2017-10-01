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
		iniciaMysql();
    },
    // Bind Event Listeners
    //
    // Bind any events that are required on startup. Common events are:
    // 'load', 'deviceready', 'offline', and 'online'.
    bindEvents: function() {
        document.addEventListener('deviceready', this.onDeviceReady, false);
		
		function deviceReady() {
			var push = PushNotification.init({
                    android: {
                        senderID: "XXXXXXXX"
                    },
                    ios: {
                        alert: "true",
                        badge: "true",
                        sound: "true"
                    }
                });
				
				 push.on('registration', function(data) {
					 // alert(data.registrationId)
					
                    document.getElementById("idDispositivo").innerHTML = data.registrationId;
                });
				
				 push.on('notification', function(data) {
                    var ul = document.getElementById("notificacionesPush");
                    var li = document.createElement("li");
                    li.appendChild(document.createTextNode(data.title+": "+data.message));
                    ul.appendChild(li);
                });
				
		}
    },
    // deviceready Event Handler
    //
    // The scope of 'this' is the event. In order to call the 'receivedEvent'
    // function, we must explicitly call 'app.receivedEvent(...);'
    onDeviceReady: function() {
        app.receivedEvent('deviceready');
		
    },
    // Update DOM on a Received Event
    receivedEvent: function(id) {
        var parentElement = document.getElementById(id);
        // var listeningElement = parentElement.querySelector('.listening');
        // var receivedElement = parentElement.querySelector('.received');

        // listeningElement.setAttribute('style', 'display:none;');
        // receivedElement.setAttribute('style', 'display:block;');

        console.log('Received Event: ' + id);
    }
	
	
	
};





var urlLoc = "localhost";

// var WEB_ROOT = "http://" + urlLoc + "/iap";
var WEB_ROOT = "http://www.iapchiapasenlinea.mx/dev/iap";
// var WEB_ROOT = "http://www.iapchiapasenlinea.mx/";

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
           if(splitResponse[6]>0){
			    $("#curricula_1").show()
		   } 
			if(splitResponse[7]>0){
			    $("#curricula_2").show()
		   } 
			if(splitResponse[8]>0){
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
				if(splitResponse[9]>0){
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
        data : 'type=detalleActividad&usuarioId='+getCookie("usuarioId")+'&actividadId='+id,
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
           if(splitResponse[0]=="ok"){
			    $("#subForo").html(splitResponse[1])
				$("#asunto").val('')
				$("#mensaje").val('')
		   }else if(splitResponse[0]=="fail"){
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
			if(splitResp[0] == "ok"){
				  $("#subForoDetalle").html(splitResp[1])
				  $("#aportacion").val('')
			}else if(splitResp[0] == "fail"){
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
			if(splitResp[0] == "ok"){
				  $("#comentario").val('');
			   verSubforoDetalle(splitResp[2],splitResp[3])
			}else if(splitResp[0] == "fail"){
				 $(".msj").html(splitResp[1])			
			}else{
				 alert('Algo salio mal, compruebe su conexion a internet');
			}
			
			
		},
	})

}



function verFormUp(Id,modl)
{


	$.mobile.changePage("#divUp");
	$("#upactividadId").val(Id);
	$("#upmodalidad").val(modl);
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
			if(splitResp[0] == "ok"){
				  $("#titulo").val('');
			   detalleActividad(splitResp[1],splitResp[2])
			}else if(splitResp[0] == "fail"){
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
			if(splitResp[0] == "ok"){
				$.mobile.changePage("#home");
				iniciaMysql()
			}else if(splitResp[0] == "fail"){
				 $(".msj").html(splitResp[1])			
			}else{
				 alert('Algo salio mal, compruebe su conexion a internet');
			}
			
			
		},
	})

}
