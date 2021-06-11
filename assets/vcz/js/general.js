
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
        let text = $(this).data('alert');
        Swal.fire({
            html: text,
            width: 800,
            icon: 'info'
        });
    });
});