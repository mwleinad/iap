var DOC_ROOT = "../";
var DOC_ROOT_TRUE = "../";
var DOC_ROOT_SECTION = "../../";


var LOADER3 = "<div align='center'><img src='"+WEB_ROOT+"/images/cargando.gif'><br>Cargando...</div>";

// var WEB_ROOT ="http://"+document.location.hostname+"/iap";

// var WEB_ROOT = "http://www.iapchiapasenlinea.mx";

$( document ).ready(function() {
    $(document).on("click",".closeModal",function() {
        bootbox.hideAll();
    });

    $(document).on("focus", ".date-picker", function () {
        $( ".date-picker" ).datepicker( {
            format: 'dd-mm-yyyy',
            autoclose: true
        } );
    });

    $(document).on("submit", ".form", function (ev) {
        ev.preventDefault();
        var form = $(this);
        var data = new FormData(document.getElementById(form.attr('id')));
        var btnSubmit = form.find("button[type='submit'], input[type='submit']");
        var textoBtn = btnSubmit.html();
        $.ajax({
            type: "POST",
            url: form.attr('action'),
            data: data,
            processData: false,  // tell jQuery not to process the data
            contentType: false,   // tell jQuery not to set contentType
            beforeSend: function () {
                btnSubmit.prop('disabled',true);
                btnSubmit.html("<i class='fa fa-spinner'><i>");
                form.find(".is-invalid").removeClass('is-invalid');
                form.find(".invalid-feedback").remove();
            }
        })
        .done(function (response) { 
            try {
                response = JSON.parse(response);
                console.log(response)
                actionPostAjax(form, response);
                setTimeout(() => {
                    btnSubmit.prop('disabled',false);
                    btnSubmit.html(textoBtn);
                }, 2000); 
            } catch (error) {
                console.error(error);
                growl("Ocurrió un error, intente de nuevo.","danger");
                btnSubmit.prop('disabled',false);
                btnSubmit.html(textoBtn);
            }
            
        })
        .fail(function(response){
            setTimeout(() => {
                btnSubmit.prop('disabled',false);
                btnSubmit.html(textoBtn);
            }, 2000);   
            if (response.status == 422) {
                response = JSON.parse(response.responseText);
                growl("Existe un error con los campos requeridos, revise por favor.","danger");
                actionPostAjax(form, response);
                $.each(response.errors,function(index, value){
                    // form.find("input[name="+index+"],textarea[name="+index+"],select[name="+index+"]").addClass('is-invalid').focus();
                    form.find("input[name="+index+"],textarea[name="+index+"],select[name="+index+"]").addClass('is-invalid').parent().append(`<span class="invalid-feedback d-block">${value}</span>`).focus(); 
                });
            }
        });
    });

    $(document).on("click","[data-target]", function(){
        if($(this).data('target') == "#ajax"){
            var ancho = $(this).data("width");
            if(typeof ancho !== 'undefined' ){
                $(".modal-dialog").css({"max-width":ancho});
            }
        } 
    })

    $(document).on("click", ".ajax_sin_form", function(ev){
        ev.preventDefault();
        let data = JSON.parse("{"+$(this).data("data")+"}");
        console.log(data);
        $.ajax({
            url:$(this).attr('href'),
            data:data,
            type:"POST"
        }).done(function(response){
            response = JSON.parse(response);
            actionPostAjax("", response);
        }).fail(function(response){
            console.log(response);
        });
    });

    $("body").on('keyup', '.money', function(){
        var valor = moneda($(this).val());
        $(this).val(valor);
    }); 
});

function moneda(v) {
    v = v.replace(/([^0-9\.]+)/g, '');
    v = v.replace(/^[\.]/, '');
    v = v.replace(/[\.][\.]/g, '');
    v = v.replace(/\.(\d)(\d)(\d)/g, '.$1$2');
    v = v.replace(/\.(\d{1,2})\./g, '.$1');
    v = v.toString().split('').reverse().join('').replace(/(\d{3})/g, '$1,');
    v = v.split('').reverse().join('').replace(/^[\,]/, '');
    return v;
}

function actionPostAjax(form, response){
    console.log(response);
    if (response.growl) {
        growl(response.message,response.type);
    }
    if (response.modal_close) {
        $(".bootbox-close-button").click();
        $("#ajax").modal('hide');
        if ($('.modal-backdrop').is(':visible')) {
            $('body').removeClass('modal-open'); 
            $('.modal-backdrop').remove(); 
        };
    }
    if (response.html) {
        if (response.modal) { 
            $("#ajax .modal-content").html(response.html);
        }else{
            $(document).find(response.selector).html(response.html);
        }
    }
    if (response.location) {
        var duracion = response.duracion ? response.duracion : 2000;
        setTimeout(() => {
            window.location.href = response.location;
        }, duracion); 
    }
    if (response.reload) {
        var duracion = response.duracion ? response.duracion : 2000;
        setTimeout(() => {
            location.reload();
        }, duracion); 
    }
}

function showModal(title, data)
{
    bootbox.dialog({
        message: data,
        title: title,
        buttons: {},
        size: 'large'
    });
}

function growl(message, type)
{
    $.bootstrapGrowl(message,
        {
            type: type,
            delay: 5000,
            allow_dismiss: true,
        }
    );
}

function ShowStatusPopUp(html)
{
//    var $div = $(html);
    //var $error = $div.find(".errorStatusBox").html();
    var $error = html;
    growl($error, "danger");
}

function ShowStatus(html)
{
//    var $div = $(html);
//    var $error = $div.find(".successStatusBox").html();
    var $error = html;
    growl($error, "success");
}

function CloseFview()
{
    bootbox.hideAll();
}

$('#ajax').on('show.bs.modal', function (event) {
    $("#ajax .modal-content").html(`<div class="modal-body"> <i class="fas fa-spinner fa-pulse fa-lg"></i> Cargando... </div>`);
})