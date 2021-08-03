function EditTest(){
	
	// alert(WEB_ROOT)
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/configuracion-examen.php',
	  	// data: "type=EditTest&id="+id,
		data: $("#editMajorForm").serialize(true)+'&type=EditTest&activityId='+$("#activityId").val(),
		beforeSend: function(){			
			$("#msj").html(LOADER3);
		},
	  	success: function(response) {	
				console.log(response)

			  $("#msj").html('');
			 var splitResponse = response.split("[#]");

			 if($.trim(splitResponse[0])=="ok"){

				 $("#tblContent2").html(splitResponse[1]);
				 btnClose();
			 }else{
				 $("#msj").html(splitResponse[1]);
			 }


		},
		error:function(){
			// alert(msgError);
		}
    });

	
}//AddReg