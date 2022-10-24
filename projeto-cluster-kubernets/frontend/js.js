$("#button-blue").on("click", function() {
    
    var txt_nome = $("#name").val();
	var txt_sobrenome = $("#sobrenome").val();
    var txt_email = $("#email").val();
    var txt_comentario = $("#comentario").val();

    $.ajax({
        url: "http://IP DO LOADBALANCER",
        
        type: "post",
        data: {nome: txt_nome, sobrenome: txt_sobrenome, email: txt_email, comentario: txt_comentario},
        beforeSend: function() {
        
            console.log("Tentando enviar os dados....");

        }
    }).done(function(e) {
        alert("Dados Salvos");
    })

});