
function saveMsj(){
	
	$("#type").val("saveMsj")

	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/foro.php',
	  	data: $("#frmGral").serialize(true)+'&auxMsj=1',
		beforeSend: function(){			
			$("#centeredDivOnPopup").hide();
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");
			
		
			if(splitResp[0] == "ok"){
					closeModal()
					// $("#contenido").html(splitResp[1]);
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
	
}//saveMsj

function closeModal(){
	
	$("#ajax").hide();
	$("#ajax").modal("hide");
	
}


function enviarArchivo(){
// alert("h")



// En esta var va incluido $_POST y $_FILES
	var fd = new FormData(document.getElementById("frmGral"));
	$.ajax({
		url : WEB_ROOT+'/ajax/new/personal.php',
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
				$("#msj").html(splitResp[1]);
				$("#contenido").html(splitResp[2]);
				btnClose();
			}else if($.trim(splitResp[0]) == "fail"){
				$("#txtErrMsg").show();
	
			}else{
				alert(msgFail);
			}
		},
	})
	
}


function onDelete(Id,personalId){
	
var resp = confirm("Seguro de  eliminar el documento?");
	
	if(!resp)
		return;

	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/info-docente.php',
	  	data: $("#frmGral_"+Id).serialize(true)+'&Id='+Id+'&type=onDelete&personalId='+personalId,
		beforeSend: function(){			
			// $('#tblContent').html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");

			if($.trim(splitResp[0]) == "ok"){
					$("#msj").html(splitResp[1]);
					$("#contenido").html(splitResp[2]);
				}
			else if($.trim(splitResp[0]) == "fail"){
				$("#msj_"+Id).html(splitResp[1]);
			}
		}
    });
	
}//onDelete