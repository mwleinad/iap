$( document ).ready(function() {

    $(document).on("click",".spanDelete",function() {
        var $id = $(this).data('id');
        DeleteActivity($id);
    });

    $(document).on("click",".spanDeleteResource",function() {
        var $id = $(this).data('id');
        DeleteResource($id);
    });

});


function DeleteActivity(id)
{
    var $message = "¿Está seguro de eliminar esta actividad?";
    bootbox.confirm($message, function(result) {
        if(result == false)
        {
            return;
        }

        $.ajax({
            url : WEB_ROOT+'/ajax/new/activity.php',
            type: "POST",
            data : {type: "deleteActivity", activityId: id},
            success: function(data, textStatus, jqXHR)
            {
                var splitResponse = data.split("[#]");
                ShowStatus(splitResponse[1]);
                $('#tblContent-activities').html(splitResponse[2]);
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Algo salio mal, compruebe su conexión a internet');
            }
        });

    });
}

function DeleteResource(id)
{
    var $message = "¿Está seguro de eliminar este recurso?";
    bootbox.confirm($message, function(result) {
        if(result == false)
        {
            return;
        }

        $.ajax({
            url : WEB_ROOT+'/ajax/new/resource.php',
            type: "POST",
            data : {type: "deleteResource", resourceId: id},
            success: function(data, textStatus, jqXHR)
            {
                var splitResponse = data.split("[#]");
                ShowStatus(splitResponse[1]);
                $('#tblContentResources').html(splitResponse[2]);
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Algo salio mal, compruebe su conexión a internet');
            }
        });

    });
}




function upFile(Id,reqId,tramiteId){
	// alert("h")
		$(".type").val("upFile");
		$("#auxrequisito").val(reqId);

		// En esta var va incluido $_POST y $_FILES
			var fd = new FormData(document.getElementById("frmGral_"+Id));
			$.ajax({
				url: AJAX_PATH,
				data: fd,
				processData: false,
				contentType: false,
				type: 'POST',
				beforeSend: function(){		
					$("#loader").html(LOADER);
					$("#txtErrMsg").hide(0);
				},
				success: function(response){
					
					console.log(response);
					var splitResp = response.split("[#]");

					$("#loader").html("");
					
					if(splitResp[0] == "ok"){
						$("#preLoad_"+reqId).html(splitResp[1]);		
					}else if(splitResp[0] == "fail"){
						$("#txtErrMsg").show();
						$("#txtErrMsg").show();
						$("#txtErrMsg").html(splitResp[1]);				
					}else{
						alert(msgFail);
					}
				},
			})
			
		}
		