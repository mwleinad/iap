function comprueba_extension(archivo) { 
   extensiones_permitidas = new Array(".png",".jpg");  
      extension = (archivo.substring(archivo.lastIndexOf("."))).toLowerCase(); 
      permitida = false; 
      for (var i = 0; i < extensiones_permitidas.length; i++) { 
         if (extensiones_permitidas[i] == extension) { 
         permitida = true; 
         break; 
         } 
      } 
      if (!permitida) { 
         return "no";
      	}else{ 
         return "si"; 
      	} 
   return 0; 
}




function desactivar(id,activo){
	
	

	var resp = confirm("Seguro de  dar de baja al alumno?");
	
	if(!resp)
		return;
	
	
	
	$("#type").val("desactivar")

	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/student.php',
	  	data: $("#frmFiltro").serialize(true)+'&id='+id+'&activo='+activo+'&type=desactivar',
		beforeSend: function(){			
			$('#tblContent').html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");
			
		DoSearch();
			if(splitResp[0] == "ok"){
					// $("#tblContent").html(splitResp[2]);
					// alert("d");
					DoSearch();
				}
			else if(splitResp[0] == "fail"){
				$("#res_").html(splitResp[1]);
				$("#centeredDivOnPopup").show();
			}
		},
		error:function(){
			alert(msgError);
		}
    });
	
}//desactivar


function activar(id,activo){
	
	$("#type").val("activar")

	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/student.php',
	  	data: $("#frmFiltro").serialize(true)+'&id='+id+'&activo='+activo+'&type=activar',
		beforeSend: function(){			
			$('#tblContent').html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");
			
			DoSearch()
			if(splitResp[0] == "ok"){
					// $("#tblContent").html(splitResp[2]);
					DoSearch()
				}
			else if(splitResp[0] == "fail"){
				$("#res_").html(splitResp[1]);
				$("#centeredDivOnPopup").show();
			}
		},
		error:function(){
			alert(msgError);
		}
    });
	
}//activar


function saveEditStudentAlumn(){
	
	$("#type").val("saveEditStudentAlumn")

	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/student.php',
	  	data: $("#editStudentForm").serialize(true)+'&auxMsj=1',
		beforeSend: function(){			
			$("#centeredDivOnPopup").hide();
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");
			
		
			if(splitResp[0] == "ok"){
					DoSearch()
					$("#res_").html(splitResp[1]);
				}
			else if(splitResp[0] == "fail"){
				// alert(splitResp[1])
				$("#res_").html(splitResp[1]);
				$("#centeredDivOnPopup").show();
			}
		},
		error:function(){
			alert(msgError);
		}
    });
	
}//saveEditStudentAlumn




function estado_dependencia(){
	
	 var tam = $("#tam").val();
	var paisId = $("#pais").val();

	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/dependencia-estado.php',
	  	data: $("#editStudentForm").serialize(true)+'&type=estado_dependencia&paisId='+paisId+'&tam='+tam,
		beforeSend: function(){			
			
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");
			

			$("#Stateposition").html(response);
				
		},
		error:function(){
			alert(msgError);
		}
    });
	
}//estado_dependencia


function ciudad_dependencia(){
	

	
	 var estadoId = $("#estado").val();
	 var tam = $("#tam").val();

	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/dependencia-ciudades.php',
	  	data: $("#editStudentForm").serialize(true)+'&type=loadCities&estadoId='+estadoId+'&tam='+tam,
		beforeSend: function(){			
			
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");
			

			$("#Cityposition").html(response);
				
		},
		error:function(){
			alert(msgError);
		}
    });
	
}//estado_dependencia


function estado_dependenciat()
{ 
	
	var tam = $("#tam").val();
   var paisId = $("#paist").val();
   
   // alert(paisId)
	
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/dependencia-estadot.php',
	  	data: $("#editStudentForm").serialize(true)+'&type=loadCities&paisId='+paisId+'&tam='+tam,
		beforeSend: function(){			
			
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");
			

			$("#Statepositiont").html(response);
				
		},
		error:function(){
			alert(msgError);
		}
    });
}




  
  function ciudad_dependenciat(){
	

	
	 var estadoId = $("#estadot").val();
	 var tam = $("#tam").val();

	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/dependencia-ciudadest.php',
	  	data: $("#editStudentForm").serialize(true)+'&type=loadCities&estadoId='+estadoId+'&tam='+tam,
		beforeSend: function(){			
			
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");
			

			$("#Citypositiont").html(response);
				
		},
		error:function(){
			alert(msgError);
		}
    });
	
}//estado_dependencia


 function DoSearch(){

 
 // alert("2d")
	 $("#type").val("DoSearch");

	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/student.php',
	  	data: $("#frmFiltro").serialize(true)+'&type=DoSearch',
		beforeSend: function(){			
			$('#tblContent').html(LOADER3);
		},
	  	success: function(response) {	
		$('divLoading').hide();
			console.log(response)
			var splitResp = response.split("[#]");
			

			$('#tblContent').html(splitResp[1]);
			$('#pagination').html();				
			$('#divLoading').hide();
				
		},
		error:function(){
			alert(msgError);
		}
    });
	
}//DoSearch

function AddStudentRegister()
{
    //alert("hola");
    $.ajax({
        url : WEB_ROOT+'/ajax/student.php',
        type: "POST",
        data :  $('#addStudentForm').serialize(),
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
				setTimeout("",5000);
				 location.reload();
            }
        },
        error: function ()
        {
            alert('En breve recibirás un correo con la confirmación de tu registro, favor de verificar en tu bandeja de correo no deseado');
        }
    });


}




 function viewCourse(){

 
 // alert("2d")
	 $("#type").val("viewCourse");

	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/student.php',
	  	data: $("#frmFiltro").serialize(true)+'&type=viewCourse&courseId='+$("#courseId").val(),
		beforeSend: function(){			
			$('divLoading').show();
		},
	  	success: function(response) {	
		$('divLoading').hide();
			console.log(response)
			var splitResp = response.split("[#]");
			

			$('#tblContentGray').html(splitResp[1]);
			$('#pagination').html();				
			$('#divLoading').hide();
				
		},
		error:function(){
			alert(msgError);
		}
    });
	
}//viewCourse




function addModuls(){

 
 // alert("2d")
 
 // alert(LOADER3)
	 $("#type").val("addModuls");

	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/student.php', 
	  	data: $("#frmFiltro").serialize(true)+'&'+$("#frmAddCurricula").serialize(true)+'&type=addModuls&courseId='+$("#courseId").val(),
		beforeSend: function(){			
			$('#tblContentGray').html(LOADER3);
		},
	  	success: function(response) {	
		$('divLoading').hide();
			console.log(response)
			var splitResp = response.split("[#]");
			

			$('#tblContentGray').html(splitResp[1]);
			// $('#pagination').html();				
			// $('#divLoading').hide();
				
		},
		error:function(){
			alert(msgError);
		}
    });
	
}//viewCourse


function generaSolicitud(alumnoId,courseId){
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/student.php', 
	  	data: $("#frmFiltro").serialize(true)+'&type=generaSolicitud'+'&alumnoId='+alumnoId+'&courseId='+courseId,
		beforeSend: function(){			
			$('#tblContentGray').html(LOADER3);
		},
	  	success: function(response) {	
		$('divLoading').hide();
			console.log(response)
			var splitResp = response.split("[#]");
			

			$('#tblContentGray').html(splitResp[1]);
			// $('#pagination').html();				
			// $('#divLoading').hide();
				
		},
		error:function(){
			// alert(msgError);
		}
    });
}



function onSendINE(){
	
	
	var ine = $("#ine").val();

	var res = comprueba_extension(ine);
	
	if(res == "no"){
		alert("Solo se permiten archivos con extencion PNG y JPG")
		return ;
	}
	

	// En esta var va incluido $_POST y $_FILES
	var fd = new FormData(document.getElementById("frmGral"));
	fd.append('type','onSendFoto');
	$.ajax({
		url: WEB_ROOT+'/ajax/homepage.php',
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
					$('#progress').val(Math.round(Progress));
					$('#porcentaje').html(Math.round(Progress)+'%');


				},false);
			return XHR;
		},
		success: function(response){

			console.log(response);
			// var splitResp = response.split("[#]");
			// $("#msjCourse").html(response);
			var splitResp = response.split("[#]");

			if($.trim(splitResp[0])=="ok"){
				closeModal()
				$('#msjHome').html(splitResp[1]);
			}else if($.trim(splitResp[0])=="fail"){
				alert(splitResp[1])
			}else{
				alert('Ocurrio un error....')
			}
			// alert('llega')
			closeModal()
		},
	})

}

function closeModal(){
	
	$("#ajax").hide();
	$("#ajax").modal("hide");
	
}


function onDeleteCarta(id)
{

	var resp = confirm("Seguro de  eliminar el Documento?");

		if(!resp)
			return;

    $.ajax({
		url: WEB_ROOT+'/ajax/homepage.php',
        type: "POST",
        data : {type: "onDeleteFoto", id:id},
        success: function(data)
        {
           console.log(data);
		    var splitResp = data.split("[#]");
			 if($.trim(splitResp[0]) == "ok")
            {
               closeModal();
			   $('#msjHome').html(splitResp[1]);
			   
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