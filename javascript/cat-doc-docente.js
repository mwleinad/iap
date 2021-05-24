function onSave(){
	
	
	
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/new/personal.php',
	  	data: $("#frmGral").serialize(true)+'&type=onSaveDocumento',
		beforeSend: function(){			
			// $('#tblContent').html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");

			if($.trim(splitResp[0]) == "ok"){
					btnClose();
					$("#msj").html(splitResp[1]);
					$("#contenido").html(splitResp[2]);
				}
			else if(splitResp[0] == "fail"){
				$("#msj").html(splitResp[1]);
			}
		}
    });
	
}


function closeModal(){
	
	$("#ajax").hide();
	$("#ajax").modal("hide");
	
}


function onDelete(Id){
	
	var resp = confirm("Esta seguro de eliminar el Documento?");
	
	if(!resp)
		return;
	
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/new/personal.php',
	  	data: $("#frmGral").serialize(true)+'&Id='+Id+'&type=onDeleteDocumento',
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
				$("#msj").html(splitResp[1]);
			}
		}
    });
	
}


function cancelarSolicitud(){
	
	$("#ajax").hide();
	$("#ajax").modal("hide");
	
}