function onSave(){
	
	// alert(WEB_ROOT)
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/grupos.php',
	  	// data: "type=EditTest&id="+id,
		data: $("#editSubjectForm").serialize(true)+'&type=onSave',
		beforeSend: function(){			
			$("#msj").html(LOADER3);
		},
	  	success: function(response) {	
				console.log(response)

			  $("#msj").html('');
			 var splitResponse = response.split("[#]");

			 if($.trim(splitResponse[0])=="ok"){

				 $("#tblContent2").html(splitResponse[1]);
				 $("#ajax").hide();
				$("#ajax").modal("hide");
			 }else{
				 $("#msj").html(splitResponse[1]);
			 }


		},
		error:function(){
			// alert(msgError);
		}
    });

	
}//AddReg