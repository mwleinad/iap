
function saveEditContrato(){
	


	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/reportes.php',
	  	data: $("#frmGral").serialize(true)+'&type=saveEditContrato',
		beforeSend: function(){			
			// $('#tblContent').html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");

			if($.trim(splitResp[0]) == "ok"){
					btnClose()
					$("#msj").html(splitResp[1]);
					$("#tblContent").html(splitResp[2]);
				}
			else if($.trim(splitResp[0]) == "fail"){
				$("#msjErr").html(splitResp[1]);
			}
		}
    });
	
}//saveEditContrato


function closeModal(){
	
	$("#ajax").hide();
	$("#ajax").modal("hide");
	
}
