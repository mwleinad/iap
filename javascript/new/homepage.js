




  
function onVerPass(){
	 // $('#show').attr('checked', false);

      name = $('#nuevo').attr('name'); 
      value = $('#nuevo').attr('value');

      if($('#nuevo').attr('checked'))
      {
         html = '<input type="text" name="'+ name + '" value="' + value + '" id="nuevo"/>';
         $('#nuevo').after(html).remove();
      }

      else
      {
         html = '<input type="nuevo" name="'+ name + '" value="' + value + '" id="nuevo"/>';
         $('#nuevo').after(html).remove();
      }
  
}


function onSavePass(){
	
	$("#type").val("onSavePass")

	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/student.php',
	  	data: $("#frmPass").serialize(true)+'&type=onSavePass',
		beforeSend: function(){			
			$("#res_").html('Cargando..');
		},
	  	success: function(response) {	
			$("#res_").html('');
			console.log(response)
			var splitResp = response.split("[#]");
			
			if($.trim(splitResp[0]) == "ok"){
					location.reload();
				}
			else if($.trim(splitResp[0]) == "fail"){

				$("#res_").html(splitResp[1]);
			
			}
			

		},
		error:function(){
			alert(msgError);
		}
    });
	
}//activar

function CalificacionesAct(id){
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/studentCurricula.php',
	  	data: "type=calificaciones&id="+id,
		beforeSend: function(){			
			// $("#td_"+id).html(LOADER3);
		},
	  	success: function(response) {	
		
			  $("#td_"+id).html(response);
			  $("#td_"+id).toggle();


		},
		error:function(){
			alert(msgError);
		}
    });
	
}//AddReg


function closeModal(){
	
	$("#ajax").hide();
	$("#ajax").modal("hide");
	
}


// function CalificacionesAct(id){

// grayOut(true);
	// $('fview').show();

		
	// new Ajax.Request(WEB_ROOT+'/ajax/studentCurricula.php', 
	// {
		// method:'post',
		// parameters: {type: "calificaciones", id:id},
    // onSuccess: function(transport){
			// var response = transport.responseText || "no response text";
			// FViewOffSet(response);
			// Event.observe($('closePopUpDiv'), "click", function(){ CancelFview(); });
			// Event.observe($('btnCancel'), "click", function(){ CancelFview(); });
			// Event.observe($('editRole'), "click", EditRole);

		// },
    // onFailure: function(){ alert('Something went wrong...') }
  // });
// }


function addxxx(){
//alert(WEB_ROOT)

new Ajax.Request(WEB_ROOT+'/ajax/student.php', 
	{
		method:'post',
		parameters: $('frmAddCurricula').serialize(true),
    onSuccess: function(transport){
			var response = transport.responseText || "no response text";
			//alert(response);
			var splitResponse = response.split("[#]");
			if(splitResponse[0] == "fail")
			{
				ShowStatus(splitResponse[1])
			}
			else
			{
				ShowStatus(splitResponse[1])
				$('tblContent').innerHTML = splitResponse[2];
				CloseFview();
			}

		},
    onFailure: function(){ alert('Something went wrong...') }
  });
   
}

function borrarNot(id){
new Ajax.Request(WEB_ROOT+'/ajax/notificacion.php', 
	{
		method:'post',
		parameters: {type: "deleteNot",id : id},
    onSuccess: function(transport){
			var response = transport.responseText || "no response text";
			alert(response)
			var splitResponse = response.split("[#]");
			if(splitResponse[0] == "fail")
			{
				ShowStatus(splitResponse[1])
			}
			else
			{
				ShowStatus(splitResponse[1])
				$('tblNot').innerHTML = splitResponse[2];
				CloseFview();
			}

		},
    onFailure: function(){ alert('Something went wrong...') }
  });

}//CalificacionesAct


function CalificacionesExa(id){

$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/studentCurricula.php',
	  	data: "type=calificacionesExa&id="+id,
		beforeSend: function(){			
			// $("#td_"+id).html(LOADER3);
		},
	  	success: function(response) {	
		
			  $("#td_"+id).html(response);
			  $("#td_"+id).toggle();

		},
		error:function(){
			alert(msgError);
		}
    });


}



function solicitarReferencia(id){

$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/homepage.php',
	  	data: "type=solicitarReferencia&id="+id,
		beforeSend: function(){			
			// $("#td_"+id).html(LOADER3);
			$("#load").html(LOADER3);
		},
	  	success: function(response) {	
			console.log(response)
			var splitResponse = response.split("[#]");
			if($.trim(splitResponse[0]) == "ok"){
				$("#msj5").html(splitResponse[1]);
				$("#load").html('');
			}else if ($.trim(splitResponse[0]) == "ok"){
				$("#msj5").html(splitResponse[2]);
			}
			  

		},
		error:function(){
			alert(msgError);
		}
    });


}


function descargaFormato(courseId,semestreId){
	url=WEB_ROOT+"/ajax/formato-reinscripcion.php?"+$('#frmfiltro').serialize(true)+'&courseId='+courseId+'&semestreId='+semestreId;
	open(url,"voucher","toolbal=0,width=800,resizable=1");
}



function abrirReins(subjectId,courseId,semesterId){
	
	$("#tabla1").hide();
	
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/homepage.php',
	  	data: "type=abrirReins&subjectId="+subjectId+'&courseId='+courseId+'&semesterId='+semesterId,
		beforeSend: function(){			
			// $("#td_"+id).html(LOADER3);
		},
	  	success: function(response) {	
			console.log(response)
			var splitResponse = response.split("[#]");
			
				$("#modal1").html(splitResponse[1]);
	
		},
		error:function(){
			alert(msgError);
		}
    });
}



function verCalendario(){
	url=WEB_ROOT+"/ajax/pagos.php?"+$('#frmfiltro').serialize(true);
	open(url,"voucher","toolbal=0,width=800,resizable=1");
}




function printReferencia(){
	url=WEB_ROOT+"/ajax/referencia_pdf.php?"+$('#frmfiltro').serialize(true);
	open(url,"voucher","toolbal=0,width=800,resizable=1");
}



function AddStudentRegister()
{
    
    $.ajax({
        url : WEB_ROOT+'/ajax/student.php',
        type: "POST",
        data :  $('#addStudentForm').serialize()+'&'+$('#frmConfirma').serialize(),  
		beforeSend: function(){		
			$("#addStudent").hide();
			$("#loader").html(LOADER3);
		},
        success: function(data)
        {
			console.log(data)
			$("#loader").html('');
			 var splitResponse = data.split("[#]");
			if($.trim(splitResponse[0]) == "ok"){
				ShowStatus($(splitResponse[1]));
				CloseFview();
                // $('#res_').html(splitResponse[1]);
                $('#tblContent').html(splitResponse[2]);
				setTimeout("recargarPage()",2000);
			}else{
				$("#addStudent").show();
				 // $('#res_').html(splitResponse[1]);
				ShowStatusPopUp($(splitResponse[1]));
			}	
			// $("#loader").html('');
            // var splitResponse = data.split("[#]");
            // if(splitResponse[0] == "fail")
            // {
                // ShowStatusPopUp($(splitResponse[1]));
            // }
            // else
            // {
                // ShowStatus($(splitResponse[1]));
				// CloseFview();
                // $('#tblContent').html(splitResponse[2]);
				// setTimeout("recargarPage()",5000);

				
            // }
        },
        // error: function ()
        // {
            // alert('En breve recibirás un correo con la confirmación de tu registro, favor de verificar en tu bandeja de correo no deseado');
        // }
    });


}


function recargarPage()
{
	WEB_ROOTDoc = WEB_ROOT+'/';
	$(location).attr('href',WEB_ROOTDoc);
}


function onSendINE(){

	// En esta var va incluido $_POST y $_FILES
	var fd = new FormData(document.getElementById("frmGral"));
	fd.append('type','onSendINE');
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


function ciudad_dependenciat(subjectId){
	
	var e = $("#estado").val();
	
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/student.php',
	  	data: "type=ciudad_dependenciat&estadoId="+e,
		beforeSend: function(){			
			// $("#td_"+id).html(LOADER3);
		},
	  	success: function(response) {	
			console.log(response)
			
			
				$("#divMunicipio").html(response);
	
		},
		error:function(){
			alert(msgError);
		}
    });
}
