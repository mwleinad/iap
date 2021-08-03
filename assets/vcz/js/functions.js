
function open_modal_async(url, modal_id) {
    return new Promise(resolve => {
        jQuery.get(url).done(function(response) {
            if(response.title != '')
                jQuery(modal_id + '-title').html(response.title);
            if(response.body != '')
                jQuery(modal_id + '-body').html(response.body);
            if(response.footer != '')
                jQuery(modal_id + '-footer').html(response.footer);
            resolve('resolved');
        });
    })
}

function init_select2()
{
    $('.select2').select2({
        width: '100%'
    });
}

function init_select2_search(id, route)
{
    $(id).select2({
        width: '100%',
        ajax: {
            url: route,
            dataType: 'json',
            data: function (params) {
                var query = {
                    search: params.term,
                    type: 'public'
                }
                // Query parameters will be ?search=[term]&type=public
                return query;
            }
        }
    });
}

function initCountDown(id, seconds, form_id) {
    var timer = setInterval( function () {
        let text = Math.floor(seconds/60) + ":" + (seconds % 60 < 10 ? "0" : "") + seconds % 60;
        $(id).html(text);
        if(seconds == 10) {
            Swal.fire({
                icon: 'warning',
                title: 'Tu tiempo esta por agotarse',
                text: 'Las respuestas se guardaran automáticamente'
            });
        }
        if(seconds == 0)
            $(form_id).submit();
        seconds--;
    }, 1000);
}

module.exports = {
    open_modal_async : open_modal_async,
    init_select2 : init_select2,
    init_select2_search : init_select2_search,
    init_countdown: initCountDown,
};