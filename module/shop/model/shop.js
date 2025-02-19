
function load_productos(){
    ajaxPromise('module/shop/controller/controller_shop.php?op=select_all_productos','GET', 'JSON')
    .then(function(data){
        console.log(data);
        $('#body_shop_productos').empty();
        $('#details_productos').empty();

        for(row in data){
            $('<div></div>').attr({'id': data[row].id_producto,'class': 'list_producto'}).appendTo('#body_shop_productos')
            .html(
                "<div class='div_img'>"+
                "<img src='"+ data[row].imagen + "'> </img>"+
                "</div>"+
                "<div class='list_producto_text'>"+
                "<div class='list_producto_nombre'>"+
                "<p>"+ data[row].nombre +"</p>"+
                "</div>"+
                "<div class='list_producto_precio'>"+
                "<p>"+ data[row].precio +"€ </p>"+
                "</div>"+
                "<div class='list_producto_estado'>"+
                "<p>"+ data[row].estado +"</p>"+
                "</div>"+


                "</div>"

            )

        }




    })
}

function click_detail(){
    $(document).on("click",".list_producto",function(){
        console.log("DETAILS");
        let id = this.getAttribute('id');
        load_details_producto(id);
    })
}

function load_details_producto(id){
    console.log("DETAILS");
    $('#body_shop_productos').empty();
    $('#details_productos').empty();

    // $('<div></div>').attr({'id': data[row].id_producto,'class': 'details_producto'}).appendTo('#details_productos')
    // .html(
    //     "<div class='details_producto_img'></div>"+
    //     "<div class='details_producto_body'></div>"
    // )

    ajaxPromise('module/shop/controller/controller_shop.php?op=select_one_producto&id=' + id ,'GET', 'JSON')
    .then(function (data){
        console.log(data);
        console.log(data[1]);
        let imagenes = "";
        let imagenesbottom = "";
        let specs = "";
        for(row in data[0]){
            console.log(data[0][row].imagen);
            imagenes = imagenes + " <swiper-slide class='details_producto_carusel_imagen'>"+
            "<img src='" + data[0][row].imagen + "'> </img> </swiper-slide> "
            imagenesbottom = imagenesbottom + " <swiper-slide class='details_producto_carusel_imagen_bottom'>"+
            "<img src='" + data[0][row].imagen + "'> </img> </swiper-slide> "; 
        }

 console.log(imagenes);
        $('<div></div>').attr('class', 'details_producto_img').appendTo('#details_productos')
        .html(
            "<swiper-container id='details_producto_carusel_imagenes' class=' carusel_details_imagenes' navigation='true' pagination='true' pagination-clickable='true'"+
            " css-mode='true'  loop='true' thumbs-swiper='.carusel_details_imagenes_bottom' slides-per-view='1' >"+
            imagenes +
            " </swiper-container>"+
            "<swiper-container id='details_producto_carusel_imagenes_foot' class=' carusel_details_imagenes_bottom'  slides-per-view='5' free-mode='true'"+
            "watch-slides-progress='true' >"+
            imagenesbottom +
            " </swiper-container>"
        )

        $('<div></div>').attr('class', 'details_producto_body').appendTo('#details_productos')
        .html(
            "<div class='details_producto_nombre'>"+
            "<h1>" + data[1].nombre + "</h1>"+
            "</div>"+
            "<div class='details_producto_precio'>"+
            "<p>" + data[1].precio + "€</p>"+
            "</div>"+
            "<div class='details_producto_tipo'>"+
            // "<i class='fa-solid fa-microchip'></i>"+
            "<p>" + data[1].ico_tipo  + data[1].tipo + "</p>"+
            "</div>"+
            "<div class='details_producto_marca'>"+
            "<p>" + data[1].marca + "</p>"+
            "</div>"+
            "<div class='details_producto_estado'>"+
            "<p>" + data[1].estado + "</p>"+
            "</div>"+
            "<div class='details_producto_ciudad'>"+
            "<p>" + data[1].ciudad + "</p>"+
            "</div>"+
            "<div class='details_producto_descripcion'>"+
            "<p>" + data[1].descripcion + "</p>"+
            "</div>"
        )
        for(row in data[2]){
            specs = specs + " <div class='details_producto_especificacion'>"+
            "<div class='details_producto_especificacion_parametro'> <p> " + data[2][row].parametro + ": </p> </div>"+ 
            "<div class='details_producto_especificacion_valor'> <p> " + data[2][row].valor + "</p> </div>"+ 
            "</div>";
        }



        $('<div></div>').attr('class', 'details_producto_specs').appendTo('.details_producto_body')
        .html( "<h3>Especificaciones</h3>" + specs)

    })


}
 


$(document).ready(function(){
    load_productos();
    click_detail();
});