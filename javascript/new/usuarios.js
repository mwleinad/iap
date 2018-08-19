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

