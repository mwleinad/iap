function deleteActividad(Id){
	
	var resp = confirm("Esta seguro de eliminar la actividad?");
	
	if(!resp)
		return;
	
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/module.php',
	  	data: $("#frmGral").serialize(true)+'&Id='+Id+'&type=deleteActividad',
		beforeSend: function(){			
			// $('#tblContent').html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");

			if($.trim(splitResp[0]) == "ok"){
					location.reload();
				}
			else if($.trim(splitResp[0]) == "fail"){
				alert(response);
			}
		}
    });
	
}

function verRetro(Id)
{
	let content = $("#divRetro_"+Id).html();
	Swal.fire({
		icon: "info",
		title: "Retroalimentación",
		html: content
	});
}

function cancelarSolicitud(){
	
	$("#ajax").hide();
	$("#ajax").modal("hide");
	
}