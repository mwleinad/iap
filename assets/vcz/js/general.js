
$(function() {
    flatpickr('.i-calendar', {
        dateFormat: "d-m-Y"
    });
});

function btnClose() {
    $("#btn-close").click();
    $("#btn-close").click();
}

$(function() {
    $('body').on('click', '.data-alert', function() {
        let title = $(this).data('title');
        let text = $(this).data('text');
        Swal.fire({
            html: '<h3>' + title + '</h3>' + '<br><br>' + text,
            width: 800,
            icon: 'info'
        });
    });

    $('body').on('click', '.btn-loading', function() {
        let btn = $(this);
        // let btn_text = btn.html();
		btn.attr('disabled', true);
		btn.html('<i class="fas fa-spinner fa-pulse"></i> Espere por favor...');
    });

    $('body').on('click', '.input-loading', function() {
        let input = $(this);
        let id = input.data('id');
        let formId = input.data('form');
		input.attr('disabled', true);
		$('#' + id).html('<h3><i class="fas fa-spinner fa-pulse"></i> Espere por favor...</h3>');
        $('#' + formId).submit();
    });

    $('body').on('click', 'a[href="#"]', function(e) {
        e.preventDefault ? e.preventDefault() : e.returnValue = false;
    });
});