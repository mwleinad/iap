function closeModal()
{	
	$("#ajax").hide();
	$("#ajax").modal("hide");	
}

function enviarArchivo()
{
	var fd = new FormData(document.getElementById("frmGral"));
	$.ajax({
		url : WEB_ROOT + '/ajax/new/studentCurricula.php',
		data: fd,
		processData: false,
		contentType: false,
		type: 'POST',
		beforeSend: function(){	},
		success: function(response)
        {
			console.log(response);
			var splitResp = response.split("[#]");
			$("#loader").html("");
			if($.trim(splitResp[0]) == "ok")
            {
				$("#msj").html(splitResp[1]);
				$("#contenido").html(splitResp[2]);
				btnClose();
			}
            else if($.trim(splitResp[0]) == "fail")
				$("#txtErrMsg").show();
			else
				alert(msgFail);
		},
	})
	
}

function onDelete(Id, userId)
{
    var resp = confirm("Seguro de eliminar el documento?");
	if(!resp)
	    return;
	$.ajax({
	    type: "POST",
	    url: WEB_ROOT + '/ajax/new/studentCurricula.php',
	  	data: $("#frmGral_" + Id).serialize(true) + '&Id=' + Id + '&type=onDelete&userId=' + userId,
		beforeSend: function(){	},
	  	success: function(response) 
        {	
			console.log(response)
			var splitResp = response.split("[#]");

			if($.trim(splitResp[0]) == "ok")
            {
                $("#msj").html(splitResp[1]);
                $("#contenido").html(splitResp[2]);
            }
			else if($.trim(splitResp[0]) == "fail")
				$("#msj_"+Id).html(splitResp[1]);
		}
    });	
}