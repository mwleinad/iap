function onChangePicture(Id){

	var fd = new FormData(document.getElementById("frmFoto"));
	fd.append('type','onChangePicture');
	fd.append('personalId',Id);
	// +'&cId=admin',
	$.ajax({
		url : WEB_ROOT+'/ajax/student.php',
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
					$('#progress_'+Id).val(Math.round(Progress));
					$('#porcentaje_'+Id).html(Math.round(Progress)+'%');
					
					
				},false);
			return XHR;
		},
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
				// closeModal()
				location.reload();
			}else if($.trim(splitResp[0]) == "fail"){
				$("#txtErrMsg").show();
	
			}else{
				alert(msgFail);
			}
		},
	})
}



function onSavePerfil()
{	
    $.ajax({
        url : WEB_ROOT+'/ajax/student.php',
        type: "POST",
        data :  $('#frmGral').serialize(),
        success: function(data)
        {
            var splitResponse = data.split("[#]");

			console.log(data);
            if($.trim(splitResponse[0]) == "fail")
            {
                alert('Algo salio mal, compruebe su conexión a internet');
            }
            else
            {
                 location.href=WEB_ROOT;
            }
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexión a internet');
        }
    });
}
