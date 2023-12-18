$("#posgrado").change(function(){
    if ($(this).val() != "") {
        $.ajax({
            type: "POST",
            url: $(this).data('url'),
            data: { posgrado: $(this).val(), opcion: 'grupos' }
        }).done(function (response) {
            console.log(response); 
            response = JSON.parse(response); 
            $("#grupo").html("<option value=''>Todos</option>");
            $.each(response, function(index, value){
                $("#grupo").append("<option value='"+value.courseId+"'>"+value.group+"("+value.initialDate+" - "+value.finalDate+")"+"</option>");
            })
        });
    }else{
        $("#grupo").html("<option value=''>Todos</option>");
    } 
});
$("#grupo").change(function(){
    if($(this).val() != ""){
        $.ajax({
            type: "POST",
            url: $(this).data('url'),
            data: { curso: $(this).val(), opcion: 'periodos' }
        }).done(function (response) {
            console.log(response); 
            $("#periodo").html("<option value=''>Todos</option>");
            for (let index = 1; index <= response; index++) {
                $("#periodo").append("<option value='"+index+"'>"+index+"</option>");
            }
        });
    }else{
        $("#periodo").html("<option value=''>Todos</option>");
    }
   
});