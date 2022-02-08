function onVerPass() {
	// $('#show').attr('checked', false);
	name = $('#nuevo').attr('name');
	value = $('#nuevo').attr('value');
	if ($('#nuevo').attr('checked')) {
		html = '<input type="text" name="' + name + '" value="' + value + '" id="nuevo"/>';
		$('#nuevo').after(html).remove();
	} else {
		html = '<input type="nuevo" name="' + name + '" value="' + value + '" id="nuevo"/>';
		$('#nuevo').after(html).remove();
	}
}

function onSavePass() {
	$("#type").val("onSavePass")
	$.ajax({
		type: "POST",
		url: WEB_ROOT + '/ajax/student.php',
		data: $("#frmPass").serialize(true) + '&type=onSavePass',
		beforeSend: function () {
			$("#res_").html('<i class="fas fa-spinner fa-pulse fa-lg"></i> Cargando..');
		},
		success: function (response) {
			$("#res_").html('');
			console.log(response)
			var splitResp = response.split("[#]");

			if ($.trim(splitResp[0]) == "ok") {
				location.reload();
			} else if ($.trim(splitResp[0]) == "fail") {

				$("#res_").html(splitResp[1]);

			}
		},
		error: function () {
			alert(msgError);
		}
	});
} //activar

function CalificacionesAct(id) {
	$.ajax({
		type: "POST",
		url: WEB_ROOT + '/ajax/studentCurricula.php',
		data: "type=calificaciones&id=" + id,
		beforeSend: function () {
			// $("#td_"+id).html(LOADER3);
		},
		success: function (response) {

			$("#td_" + id).html(response);
			$("#td_" + id).toggle();
		},
		error: function () {
			alert(msgError);
		}
	});
} //AddReg


function closeModal() {
	$("#ajax").hide();
	$("#ajax").modal("hide");
}

function addxxx() {
	//alert(WEB_ROOT)
	new Ajax.Request(WEB_ROOT + '/ajax/student.php', {
		method: 'post',
		parameters: $('frmAddCurricula').serialize(true),
		onSuccess: function (transport) {
			var response = transport.responseText || "no response text";
			//alert(response);
			var splitResponse = response.split("[#]");
			if (splitResponse[0] == "fail") {
				ShowStatus(splitResponse[1])
			} else {
				ShowStatus(splitResponse[1])
				$('tblContent').innerHTML = splitResponse[2];
				CloseFview();
			}
		},
		onFailure: function () {
			alert('Something went wrong...')
		}
	});
}

function borrarNot(id) {
	$.ajax({
		url: WEB_ROOT + '/ajax/notificacion.php',
		type: "POST",
		data: {
			type: "deleteNotificacion",
			id: id
		},
		beforeSend: function () {},
		success: function (transport) {
			var response = transport.responseText || "no response text";
			console.log(response)
			var splitResponse = response.split("[#]");
			if (splitResponse[0] == "fail") {
				Swal.fire({
					icon: 'error',
					title: 'Error',
					text: 'La notificación no fue eliminada, intenta más tarde..'
				});
			} else {
				Swal.fire({
					icon: 'success',
					title: 'Notificación Eliminada'
				});
				$("#not-" + id).remove();
			}
		},
		error: function (err) {
			console.log(err);
			Swal.fire({
				icon: 'error',
				title: 'Error',
				text: 'La notificación no fue eliminada, intenta más tarde..'
			});
		}
	});
} //CalificacionesAct


function CalificacionesExa(id) {
	$.ajax({
		type: "POST",
		url: WEB_ROOT + '/ajax/studentCurricula.php',
		data: "type=calificacionesExa&id=" + id,
		beforeSend: function () {
			// $("#td_"+id).html(LOADER3);
		},
		success: function (response) {

			$("#td_" + id).html(response);
			$("#td_" + id).toggle();

		},
		error: function () {
			alert(msgError);
		}
	});
}

function solicitarReferencia(id) {
	$.ajax({
		type: "POST",
		url: WEB_ROOT + '/ajax/homepage.php',
		data: "type=solicitarReferencia&id=" + id,
		beforeSend: function () {
			// $("#td_"+id).html(LOADER3);
			$("#load").html(LOADER3);
		},
		success: function (response) {
			console.log(response)
			var splitResponse = response.split("[#]");
			if ($.trim(splitResponse[0]) == "ok") {
				$("#msj5").html(splitResponse[1]);
				$("#load").html('');
			} else if ($.trim(splitResponse[0]) == "ok") {
				$("#msj5").html(splitResponse[2]);
			}
		},
		error: function () {
			alert(msgError);
		}
	});
}

function descargaFormato(courseId, semestreId) {
	url = WEB_ROOT + "/ajax/formato-reinscripcion.php?" + $('#frmfiltro').serialize(true) + '&courseId=' + courseId + '&semestreId=' + semestreId;
	open(url, "voucher", "toolbal=0,width=800,resizable=1");
}

function abrirReins(subjectId, courseId, semesterId) {
	$("#tabla1").hide();
	$.ajax({
		type: "POST",
		url: WEB_ROOT + '/ajax/homepage.php',
		data: "type=abrirReins&subjectId=" + subjectId + '&courseId=' + courseId + '&semesterId=' + semesterId,
		beforeSend: function () {
			// $("#td_"+id).html(LOADER3);
		},
		success: function (response) {
			console.log(response)
			var splitResponse = response.split("[#]");

			$("#modal1").html(splitResponse[1]);

		},
		error: function () {
			alert(msgError);
		}
	});
}

function verCalendario() {
	url = WEB_ROOT + "/ajax/pagos.php?" + $('#frmfiltro').serialize(true);
	open(url, "voucher", "toolbal=0,width=800,resizable=1");
}

function printReferencia() {
	url = WEB_ROOT + "/ajax/referencia_pdf.php?" + $('#frmfiltro').serialize(true);
	open(url, "voucher", "toolbal=0,width=800,resizable=1");
}

function recargarPage()
{
	WEB_ROOTDoc = WEB_ROOT + '/';
	$(location).attr('href', WEB_ROOTDoc);
}

$('#btnUpdateStudent').click(function() {
	updateStudentRegister();
});

function updateStudentRegister() {
	$.ajax({
        url: WEB_ROOT+'/ajax/student.php',
        type: "POST",
        data: $('#updateStudentForm').serialize(),
		beforeSend: function() {		
			$(".hide-element").hide();
			$("#loader").html(LOADER3);
		},
        success: function(data)
        {
			$("#loader").html('');
			var splitResponse = data.split("[#]");
			if($.trim(splitResponse[0]) == "ok") {
				ShowStatus($(splitResponse[1]));
				CloseFview();
                $('#loader').html(splitResponse[2]);
				setTimeout("recargarPage()", 3000);
			} else {
				$(".hide-element").show();
				ShowStatusPopUp($(splitResponse[1]));
			}
        }
    });
}

function estado_dependenciat()
{
    var paisId = $("#paist").val();
    $.ajax({
        url : WEB_ROOT+'/ajax/new/dependencia-estadot.php',
        type: "POST",
        data : {type: "loadCities",  paisId: paisId},
        success: function(data)
        {
            var splitResponse = data.split("[#]");
            $('#Statepositiont').html(splitResponse[0]);
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexión a internet');
        }
    });
}

function ciudad_dependenciat()
{
    var estadoId = $("#estadot").val();
    $.ajax({
        url : WEB_ROOT+'/ajax/new/dependencia-ciudadest.php',
        type: "POST",
        data : {type: "loadCities",  estadoId: estadoId},
        success: function(data)
        {
            var splitResponse = data.split("[#]");
            $('#Citypositiont').html(splitResponse[0]);
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexión a internet');
        }
    });
}

function estado_dependencia()
{
    var paisId = $("#pais").val();
    $.ajax({
        url : WEB_ROOT+'/ajax/new/dependencia-estado.php',
        type: "POST",
        data : {type: "loadCities",  paisId: paisId},
        success: function(data)
        {
            var splitResponse = data.split("[#]");
            $('#Stateposition').html(splitResponse[0]);
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexión a internet');
        }
    });
}

function ciudad_dependencia()
{
    var estadoId = $("#estado").val();
    $.ajax({
        url : WEB_ROOT+'/ajax/new/dependencia-ciudades.php',
        type: "POST",
        data : {type: "loadCities",  estadoId: estadoId},
        success: function(data)
        {
            var splitResponse = data.split("[#]");
            $('#Cityposition').html(splitResponse[0]);
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexión a internet');
        }
    });
}