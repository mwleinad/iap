function EditTest() {

	// alert(WEB_ROOT)
	$.ajax({
		type: "POST",
		url: WEB_ROOT + '/ajax/configuracion-examen.php',
		// data: "type=EditTest&id="+id,
		data: $("#editMajorForm").serialize(true) + '&type=EditTest&activityId=' + $("#activityId").val(),
		beforeSend: function () {
			$("#msj").html(LOADER3);
		},
		success: function (response) { 
			$("#msj").html('');
			var splitResponse = response.split("[#]"); 
			if ($.trim(splitResponse[0]) == "ok") { 
				$("#ajax").modal("hide");
				if ($('.modal-backdrop').is(':visible')) {
					$('body').removeClass('modal-open');
					$('.modal-backdrop').remove();
				};
				setTimeout(() => {
					location.reload();
				}, 500);
			} else {
				$("#msj").html(splitResponse[1]);
			} 
		} 
	});


}//AddReg