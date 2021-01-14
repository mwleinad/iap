$(document).ready(function() {

	"use strict";

	[].slice.call( document.querySelectorAll( 'select.cs-select' ) ).forEach( function(el) {
		new SelectFx(el);
	} );

	$('.selectpicker').selectpicker;


	$('#menuToggle').on('click', function(event) {
		$('body').toggleClass('open');
	});

	$('.search-trigger').on('click', function(event) {
		event.preventDefault();
		event.stopPropagation();
		$('.search-trigger').parent('.header-left').addClass('open');
	});

	$('.search-close').on('click', function(event) {
		event.preventDefault();
		event.stopPropagation();
		$('.search-trigger').parent('.header-left').removeClass('open');
	});

	// $('.user-area> a').on('click', function(event) {
	// 	event.preventDefault();
	// 	event.stopPropagation();
	// 	$('.user-menu').parent().removeClass('open');
	// 	$('.user-menu').parent().toggleClass('open');
	// });
	$.datepicker.regional['es'] = {
		closeText: 'Cerrar',
		prevText: '< Ant',
		nextText: 'Sig >',
		currentText: 'Hoy',
		monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
		monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
		dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
		dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
		dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
		weekHeader: 'Sm',
		dateFormat: 'dd/mm/yy',
		firstDay: 1,
		isRTL: false,
		showMonthAfterYear: false,
		yearSuffix: ''
	};
	$.datepicker.setDefaults($.datepicker.regional['es']);
	$(document).on('focus', '.simple-calendar', function() {
		$(this).datepicker({
			beforeShow: function (input, inst) {
				setTimeout(function () {
					inst.dpDiv.css({
						top: (input.offsetHeight + 65) + 'px'
					});
				}, 0);
			},
			dateFormat: 'dd-mm-yy',
		});
	});

	$(document).on('focus', '.birthday-calendar', function() {
		$(this).datepicker({
			yearRange: '1940:+0',
			changeYear: true,
			changeMonth: true,
			dateFormat: 'dd-mm-yy',
		});
	});

	$(document).on('change', '.sel-pais', function() {
		var pais = $(this).val();
		var inner = $(this).data('select');
		var url = $(this).data('url');
		if(pais == 1)
			set_optEstados(inner, url);
		else 
			$('#' + inner).val('');
	});

	$(document).on('change', '.sel-estado', function() {
		var estado = $(this).val();
		var inner = $(this).data('select');
		var url = $(this).data('url');
		set_optMunicipios(estado, inner, url);
	});

	$(document).on('submit', '.form-submit', function(ev) {
		ev.preventDefault();
		var form = $(this);
		var btn_text = $('button[type=submit]', form).html();
		$('button[type=submit]', form).attr('disabled', true);
		$('button[type=submit]', form).html('<i class="fa fa-spinner fa-pulse fa-fw"></i> Espere por favor...');
		var action = form.attr('action');
		var method = form.attr('method');
		var data = form.serialize();
		$('.form-control').removeClass('is-invalid');
		$('.select2-selection__rendered').removeClass('s2-is-invalid');
		$.ajax({
			url: action,
			method: method,
			data: data
		})
		.done(function(response) {
			$('button[type=submit]', form).attr('disabled', false);
			$('button[type=submit]', form).html(btn_text);
			if(response.alert == 'disabled')
			{
				console.log('[OK]');
			}
			else
			{
				Swal.fire({
					icon: response.type,
					title: response.title,
					text: response.text,
					html: response.html
				});
			}
			if(response.tb_reload)
			{
				var table = $('#' + response.table_id).DataTable();
				table.ajax.reload();
			}
			if(response.close)
				$('#btn-close').click();
			if(response.click)
			{
				$('#' + response.modal).removeData().find('#' + response.modal + '-body').html('');
				$(response.element_click).click();
			}
			if(response.clean)
				$('#' + response.form_id)[0].reset();
		})
		.fail(function(err) {
			$('button[type=submit]', form).attr('disabled', false);
			$('button[type=submit]', form).html(btn_text);
			if(err.status == 422)
			{
				var errors = err.responseJSON.errors;
				var first = true;
				$.each(errors, function(key, value){
					$('#' + key).addClass('is-invalid');
					$('#select2-' + key + '-container').addClass('s2-is-invalid');
					if(first) $('#' + key).focus();
                	first = false;
				});
			}
		});
	});

    $(document).on('submit', '.form-submit-files', function(ev) {
		ev.preventDefault();
		var form = $(this);
		var btn_text = $('button[type=submit]', form).html();
		$('button[type=submit]', form).attr('disabled', true);
		$('button[type=submit]', form).html('<i class="fa fa-spinner fa-pulse fa-fw"></i> Espere por favor...');
		var action = form.attr('action');
		var method = form.attr('method');
		var form_data = new FormData(document.getElementById(form.attr('id')));
		$('.form-control').removeClass('is-invalid');
		$('.select2-selection__rendered').removeClass('s2-is-invalid');
		$.ajax({
			url: action,
			method: method,
			dataType: "json",
            data: form_data,
            cache: false,
            contentType: false,
            processData: false
		})
		.done(function(response) {
			$('button[type=submit]', form).attr('disabled', false);
			$('button[type=submit]', form).html(btn_text);
			Swal.fire({
				icon: response.type,
				title: response.title,
				text: response.text,
				html: response.html
			});
			if(response.tb_reload)
			{
				var table = $('#' + response.table_id).DataTable();
				table.ajax.reload();
			}
			if(response.close)
				$('#btn-close').click();
		})
		.fail(function(err) {
			$('button[type=submit]', form).attr('disabled', false);
			$('button[type=submit]', form).html(btn_text);
			if(err.status == 422)
			{
				var errors = err.responseJSON.errors;
				var first = true;
				$.each(errors, function(key, value){
					$('#' + key).addClass('is-invalid');
					$('#select2-' + key + '-container').addClass('s2-is-invalid');
					if(first) $('#' + key).focus();
                	first = false;
				});
			}
		});
	});

	$(document).on('submit', '.form-submit-confirm', function(ev) {
		ev.preventDefault();
		var action = $(this).attr('action');
		var method = $(this).attr('method');
		var data = '_token=' + $('meta[name="csrf-token"]').attr('content') + '&' + $(this).serialize();
		var message = $(this).data('text');
		$('.form-control').removeClass('is-invalid');
		$('.select2-selection__rendered').removeClass('s2-is-invalid');
		if(message == undefined)
			message = "No podrás revertir esta acción";
		Swal.fire({
			title: '¿Estas seguro?',
			text: message,
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'Si, Estoy Seguro',
			cancelButtonText: 'No, Cancelar'
		}).then((result) => {
			if (result.value) 
			{
				$.ajax({
					url: action,
					method: method,
					data: data
				})
				.done(function(response) {
					Swal.fire({
						icon: response.type,
						title: response.title,
						text: response.text
					});
					if(response.tb_reload)
					{
						var table = $('#' + response.table_id).DataTable();
						table.ajax.reload();
					}
                    if(response.close)
                    	$('#btn-close').click();
				})
				.fail(function(err) {
					if(err.status == 422)
					{
						var errors = err.responseJSON.errors;
						var first = true;
						$.each(errors, function(key, value){
							$('#' + key).addClass('is-invalid');
							$('#select2-' + key + '-container').addClass('s2-is-invalid');
							if(first) $('#' + key).focus();
							first = false;
						});
					}
				});
			}
		});
	});

	$(document).on('click', '.modal-hover', function() {
		var element = $(this);
		var url = element.data('url');
		var modal_id = element.data('target');
		$(modal_id + '-body').html('<div class="text-center"><h5><i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i> Espere por favor...</h5></div>');
		openModal(url, modal_id);
	});

	$(document).on('click', '.modal-click', function() {
		var element = $(this);
		var url = element.data('url');
		var modal_id = element.data('target');
		$(modal_id + '-body').html('<div class="text-center"><h5><i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i> Espere por favor...</h5></div>');
		openModal(url, modal_id);
	});

	$(document).on('change', '.sel-curricula', function() {
        var curricula = $(this).val();
        var url = $(this).data('url');
        $.post(url, {_token: $('meta[name="csrf-token"]').attr('content'), curricula: curricula}).done(function(response) {
            $('#curricula_fields').html(response);
        });
	});
	
	$(document).on('click', '.btn-enable', function() {
		var btn = $(this);
		btn.addClass('d-none');
		$('.form-control').removeAttr('disabled');
		$('.btn-submit').removeClass('d-none');
	});

	$(document).on('click', '.btn-password', function() {
		var btn = $(this);
		var element = btn.data('id');
		var type = $('#' + element).attr('type');
		if(type == 'text')
			$('#' + element).attr('type', 'password');
		if(type == 'password')
			$('#' + element).attr('type', 'text');
	});

	$(document).on('click', '.page-reload', function() {
		location.reload(true);
	});

	$(document).on('click', '.click-form', function() {
		var btn = $(this);
		var form = btn.data('form');
		$(form).submit();
	});

	$(document).on('submit', '.submit-disabled', function() {
		let form = $(this);
		$('button[type=submit]', form).attr('disabled', true);
		$('button[type=submit]', form).html('<i class="fa fa-spinner fa-pulse fa-fw"></i> Espere por favor...');
	});

	$(document).on('focus', '.simple-time', function() {
		$(this).timeDropper({
			format: 'HH:mm'
		});
	});
});

function set_optEstados(inner, url)
{
	$.get(url).done(function(response) {
		$('#' + inner).html(response);
	});
}

function set_optMunicipios(estado, inner, url)
{
	$.get(url + '/' + estado).done(function(response) {
		$('#' + inner).html(response);
	});
}

async function openModal(url, modal_id)
{
    await helper.open_modal_async(url, modal_id);
}

/* function close_modal(modal_id) {
    $('#' + modal_id).one('shown.bs.modal', function(e) {
        $("#" + modal_id).modal('hide');
    });
} */