var editor = null;

$(function() {
	editor = new Jodit('#mensaje', {
		language: "es",
		toolbarButtonSize: "small",
		autofocus: true,
		toolbarAdaptive: false
	});
});




function cargaInbox(tipo,courseMId){  
	
	// alert(tipo)

	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/student.php',
	  	data: $("#editStudentForm").serialize(true)+'&type=cargaInbox&tipo='+tipo+'&courseMId='+courseMId,
		beforeSend: function(){			
			
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");
			

			$("#contentInbox").html(response);
			if (tipo=='enviados'){
				$("#linkEnviado").addClass("active");
				$("#linkEntrada").removeClass("active");
				$("#linkBorrador").removeClass("active");
				$("#linkEliminado").removeClass("active");
			}else if (tipo=='entrada'){
				$("#linkEntrada").addClass("active");
				$("#linkEnviado"). removeClass("active");
				$("#linkBorrador").removeClass("active");
				$("#linkEliminado").removeClass("active");
			}else if (tipo=='borrador'){
				$("#linkBorrador").addClass("active");
				$("#linkEntrada").removeClass("active");
				$("#linkEnviado"). removeClass("active");
				$("#linkEliminado").removeClass("active");
			}else if (tipo=='eliminados'){
				$("#linkEliminado").addClass("active");
				$("#linkBorrador").removeClass("active");
				$("#linkEntrada").removeClass("active");
				$("#linkEnviado"). removeClass("active");
				
			}
			
				
		},
		error:function(){
			alert(msgError);
		}
    });
	
}//cargaInbox

function SaveMsj(courseMId,status,chatId){
	
	
	$('#mensaje').html(editor.value);
	//$("#type").val("saveReply")
	
	if(status=='borrar'){
		var resp = confirm("Seguro de  eliminar el mensaje?");
	
		if(!resp)
			return;
		

		if (chatId==0){
			// window.location.href = WEB_ROOT+"/docente/id/"+courseMId;
			window.location.href = WEB_ROOT+"/inbox";
		}else{
			window.location.href = WEB_ROOT+"/inbox";
		}
		
		return;
	}

	 var fd = new FormData(document.getElementById("frmGral"));
	 fd.append('courseMId',courseMId);
	 fd.append('status',status);
	 fd.append('chatId',chatId);
	 fd.append('asunto1',$('#subject1').val());
	 fd.append('asunto2',$('#subject2').val());
	 fd.append('type','saveReply');
	
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/foro.php',
		processData: false,
		contentType: false,
		data: fd,
		beforeSend: function(){			
			$("#centeredDivOnPopup").hide();
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");
			
		
			if($.trim(splitResp[0]) == "ok"){
					closeModal()
					if (chatId==0){
						window.location.href = WEB_ROOT+"/inbox";
					}else{
						window.location.href = WEB_ROOT+"/inbox";
					}
					
				}
			else if(splitResp[0] == "fail"){
				// alert(splitResp[1])
				$("#res_").html(splitResp[1]);
				$("#centeredDivOnPopup").show();
			}
		},
		// error:function(){
			// alert(msgError);
		// }
    });
	
}//SaveMsj

function closeModal(){
	
	$("#ajax").hide();
	$("#ajax").modal("hide");
	
}

function verArchivo(){
	$("#divFileAdjunto").show();
}