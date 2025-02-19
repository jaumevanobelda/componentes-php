
function load_tipo_producto(){
    console.log("load_tipo_producto");
    ajaxPromise('module/home/controller/controller_home.php?op=home_tipo_producto','GET', 'JSON')
    .then(function(data){
        console.log(data);
        for(row in data){

            $('<swiper-slide></swiper-slide>').attr('class', "div_tipo_producto").attr({ 'id': data[row].nombre }).appendTo('#tipos_productos')
                .html(
                    "<div class='col-md-4 col-xs-6'>"+
						"<div class='shop'>"+
                            "<div class='shop-img'>"+
								"<img class='tipo_producto_img' src='"+data[row].imagen+"'>"+
							"</div>"+
                            "<div class='shop-body'>"+
                                "<h3>"+ data[row].nombre +"</h3>"+
                            "</div>"+
                        "</div>"+
                    "</div>"
                )  
        }


    })
}


function load_marcas(){
    ajaxPromise('module/home/controller/controller_home.php?op=home_marca','GET', 'JSON')
    .then(function(data){
        console.log(data);
        for(row in data){

            $('<swiper-slide></swiper-slide>').attr('class', "div_marca").attr({ 'id': data[row].nombre }).appendTo('#marcas')
                .html(
                    "<div class='col-md-4 col-xs-6'>"+
						"<div class='shop'>"+
                            "<div class='shop-img'>"+
								"<img class='marca_img' src='"+data[row].imagen+"'>"+
							"</div>"+
                            "<div class='shop-body'>"+
                                "<h3>"+ data[row].nombre +"</h3>"+
                            "</div>"+
                        "</div>"+
                    "</div>"
                )  
        }


    })
}



$(document).ready(function(){
    load_tipo_producto();
    load_marcas();
});