function sendInfo(){
	
	Id = 1;
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/view-solicitud.php',
	  	data: "type=sendInfo&Id="+Id+'&'+$("#frmGral").serialize(true),
		beforeSend: function(){			
			$("#msj").html('Cargando....');
			$("#btnSaveEncuesta").hide();

		},		
	  	success: function(response) {		
			$(".loader").html('');
			console.log(response)
			var splitResp = response.split("[#]");
									
			if($.trim(splitResp[0]) == "ok"){
				
			console.log(response)
			alert("El correo se envio correctamnte");
			location.reload();
			}else if($.trim(splitResp[0]) == "fail"){
				$("#msj").html(splitResp[1]);
			}else{
				alert("Ocurrio un error al cargar los datos.");
			}
		},
		error:function(){
			
		}
    });

}




function saveCalificador(){
	
	Id = 1;
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/view-solicitud.php',
	  	data: "type=saveCalificador&Id="+Id+'&'+$("#frmGral").serialize(true),
		beforeSend: function(){			
			$("#msj").html('Cargando....');
			$("#btnSaveEncuesta").hide();

		},		
	  	success: function(response) {		
			$(".loader").html('');
			console.log(response)
			var splitResp = response.split("[#]");
									
			if($.trim(splitResp[0]) == "ok"){
				// $("#msj").html(splitResp[1]);
				// $("#contenido").html(splitResp[2]);
				ShowStatus((splitResp[1]));
				closeModal();
				buscarCertificacion();
			console.log(response)
			}else if($.trim(splitResp[0]) == "fail"){
				$("#msj").html(splitResp[1]);
			}else{
				alert("Ocurrio un error al cargar los datos.");
			}
		},
		error:function(){
			
		}
    });

}




function enviarArchivo(){
// alert("h")



// En esta var va incluido $_POST y $_FILES
	var fd = new FormData(document.getElementById("frmGral"));
	$.ajax({
		url : WEB_ROOT+'/ajax/new/usuarios.php',
		data: fd,
		processData: false,
		contentType: false,
		type: 'POST',
		/*xhr: function(){
				var XHR = $.ajaxSettings.xhr();
				XHR.upload.addEventListener('progress',function(e){
					console.log(e)
					var Progress = ((e.loaded / e.total)*100);
					Progress = (Progress);
					console.log(Progress)
					$('#progress_'+reqId).val(Math.round(Progress));
					$('#porcentaje_'+reqId).html(Math.round(Progress)+'%');
					
					
				},false);
			return XHR;
		},*/
		beforeSend: function(){		
			// $("#loader").html(LOADER);
			// $("#erro_"+reqId).hide(0);
		},
		success: function(response){
			
			console.log(response);
			var splitResp = response.split("[#]");

			$("#loader").html("");
			
			if($.trim(splitResp[0]) == "ok"){
				 ShowStatus((splitResp[1]));
				// $("#msj").html(splitResp[1]);
				$("#contenido").html(splitResp[2]);
				closeModal()
			}else if($.trim(splitResp[0]) == "fail"){
				$("#txtErrMsg").show();
	
			}else{
				alert(msgFail);
			}
		},
	})
	
}





function onDeleteCarta(id)
{

	var resp = confirm("Seguro de  eliminar el Documento?");

		if(!resp)
			return;

    $.ajax({
		url: WEB_ROOT+'/ajax/new/usuarios.php',
        type: "POST",
        data : {type: "onDeleteCarta", id:id},
        success: function(data)
        {
           console.log(data);
		    var splitResp = data.split("[#]");
			 if($.trim(splitResp[0]) == "ok")
            {
				ShowStatus((splitResp[1]));
               closeModal()
            }
            else
            {
               alert('Ocurrio un error');
            }
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexión a internet');
        }
    });
}


function closeModal(){
	
	
	
	$('#ajax').hide();
	var elemento = document.querySelectorAll(".bootbox");
	for (var i = 0; i < elemento.length; i++) {

		$(elemento).remove('div')
	  elemento[i].classList.remove("in");
	}
	
	var elemento = document.querySelectorAll(".modal-backdrop");
	for (var i = 0; i < elemento.length; i++) {
		$(elemento).remove('div')
	  elemento[i].classList.remove("in");
	}

}


function buscarCertificacion(){
	
	 $.ajax({
		url: WEB_ROOT+'/ajax/new/usuarios.php',
        type: "POST",
        data: "type=buscarCertificacionAdmin"+'&'+$("#frmBuscar").serialize(true),
        success: function(data)
        {
           console.log(data);
		    $("#tblContent").html(data);
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexión a internet');
        }
    });
	
}	



function LoadPage(page){

	$("#type").val("LoadPage")
	
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/new/usuarios.php',
	  	data: $("#frmBuscar").serialize(true)+'&type=LoadPageAdmin&page='+page,
		beforeSend: function(){			
			$("#load").html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			
			$("#tblContent").html(response);
				

		},
		error:function(){
			alert(msgError);
		}
    });
	
}




function saveEstatus(){
// alert("h")



// En esta var va incluido $_POST y $_FILES
	var fd = new FormData(document.getElementById("frmGral"));
	$.ajax({
		url : WEB_ROOT+'/ajax/new/usuarios.php',
		data: fd,
		processData: false,
		contentType: false,
		type: 'POST',
		/*xhr: function(){
				var XHR = $.ajaxSettings.xhr();
				XHR.upload.addEventListener('progress',function(e){
					console.log(e)
					var Progress = ((e.loaded / e.total)*100);
					Progress = (Progress);
					console.log(Progress)
					$('#progress_'+reqId).val(Math.round(Progress));
					$('#porcentaje_'+reqId).html(Math.round(Progress)+'%');
					
					
				},false);
			return XHR;
		},*/
		beforeSend: function(){		
			// $("#loader").html(LOADER);
			// $("#erro_"+reqId).hide(0);
		},
		success: function(response){
			
			console.log(response);
			var splitResp = response.split("[#]");

			$("#loader").html("");
			
			if($.trim(splitResp[0]) == "ok"){
				 ShowStatus((splitResp[1]));
				// $("#msj").html(splitResp[1]);
				$("#contenido").html(splitResp[2]);
				closeModal()
			}else if($.trim(splitResp[0]) == "fail"){
				$("#txtErrMsg").show();
	
			}else{
				alert(msgFail);
			}
		},
	})
	
}






function addCertificacion(){
	
	Id = 1;
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/view-solicitud.php',
	  	data: "type=addCertificacion"+'&'+$("#frmGral2").serialize(true),
		beforeSend: function(){			
			$("#msj").html('Cargando....');
			$("#btnSaveEncuesta").hide();

		},		
	  	success: function(response) {		
			$(".loader").html('');
			console.log(response)
			var splitResp = response.split("[#]");
									
			if($.trim(splitResp[0]) == "ok"){
				// $("#msj").html(splitResp[1]);
				// $("#contenido").html(splitResp[2]);
				ShowStatus((splitResp[1]));
				closeModal();
			console.log(response)
			}else if($.trim(splitResp[0]) == "fail"){
				$("#msj").html(splitResp[1]);
			}else{
				alert("Ocurrio un error al cargar los datos.");
			}
		},
		error:function(){
			
		}
    });

}


function buscarGrupos(){
	
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/new/usuarios.php',
	  	data: $("#frmBuscar").serialize(true)+'&type=buscarGrupos',
		beforeSend: function(){			
			$("#load").html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			
			$("#divGrupos").html(response);
				

		},
		error:function(){
			alert(msgError);
		}
    });
}




function buscarGrupoModal(){
	
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/new/usuarios.php',
	  	data: $("#frmGral2").serialize(true)+'&type=buscarGrupoModal',
		beforeSend: function(){			
			$("#load").html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			
			$("#divGps").html(response);
				

		},
		error:function(){
			alert(msgError);
		}
    });
}





function busEval(){
	
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/new/usuarios.php',
	  	data: $("#frmGral").serialize(true)+'&type=busEval',
		beforeSend: function(){			
			$("#load").html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			
			$("#divEval").html(response);
				

		},
		error:function(){
			alert(msgError);
		}
    });
}









function sendInfoEvaluador(){
	
	Id = 1;
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/new/usuarios.php',
	  	data: "type=sendInfoEvaluador"+'&'+$("#frmGralEval").serialize(true),
		beforeSend: function(){			
			$("#msj").html('Cargando....');
			$("#btnSaveEncuesta").hide();

		},		
	  	success: function(response) {		
			$(".loader").html('');
			console.log(response)
			var splitResp = response.split("[#]");
									
			if($.trim(splitResp[0]) == "ok"){
				// $("#msj").html(splitResp[1]);
				// $("#contenido").html(splitResp[2]);
				ShowStatus((splitResp[1]));
				closeModal();
			console.log(response)
			}else if($.trim(splitResp[0]) == "fail"){
				$("#msj").html(splitResp[1]);
			}else{
				alert("Ocurrio un error al cargar los datos.");
			}
		},
		error:function(){
			
		}
    });

}
