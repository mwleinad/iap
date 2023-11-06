$(".list-group-item").on("click", function () {
	$(".list-group-item").removeClass("active");
	$(this).addClass("active");
});

function cargaInbox(tipo, modulo) {
	$.ajax({
		type: "POST",
		url: WEB_ROOT + '/ajax/student.php',
		data: $("#editStudentForm").serialize(true) + '&type=cargaInbox&tipo=' + tipo + '&courseMId=' + modulo,
		beforeSend: function () {
		},
		success: function (response) {
			var splitResp = response.split("[#]");
			$("#contentInbox").html(response);
		},
		error: function () {
			alert(msgError);
		}
	});
}

function deleteInbox(Id, courseId) {
	var resp = confirm("Seguro de  elimina el mensaje?");
	if (!resp)
		return;
	$.ajax({
		type: "POST",
		url: WEB_ROOT + '/ajax/foro.php',
		data: $("#frmFiltro").serialize(true) + '&Id=' + Id + '&type=deleteInbox',
		success: function (response) {
			var splitResp = response.split("[#]");
			cargaInbox('entrada');

		},
		error: function () {
			alert(msgError);
		}
	});

}

function accionesEliminar() {
	var resp = confirm("¿Está seguro de querer eliminar los mensajes?");
	if (!resp)
		return;
	let data = $("#form-inbox").serialize(true);
	$.ajax({
		type: "POST",
		url: WEB_ROOT + '/ajax/foro.php',
		data: data + '&type=accionesEliminar',
		success: function (response) {
			var splitResp = response.split("[#]");
			$(".list-group-item.active").trigger('click');
		},
		error: function () {
			alert(msgError);
		}
	});
}

function accionesFavoritos() {

	// var resp = confirm("Seguro de  elimina los mensajes?");

	// if(!resp)
	// return;

	$.ajax({
		type: "POST",
		url: WEB_ROOT + '/ajax/foro.php',
		data: $("#frmGral").serialize(true) + '&type=accionesFavoritos',
		beforeSend: function () {
			// $('#tblContent').html(LOADER3);
		},
		success: function (response) {
			var splitResp = response.split("[#]");
			cargaInbox('entrada');

		},
		error: function () {
			alert(msgError);
		}
	});

}

function verMateria(Id) {

	$("#td_" + Id).toggle()
}
