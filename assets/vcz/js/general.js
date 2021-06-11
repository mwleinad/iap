
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
});