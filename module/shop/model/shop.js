
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
                "<div class='list_producto_tipo'>"+
                "<p>"+ data[row].tipo +"</p>"+
                "</div>"+
                "<div class='list_producto_estado'>"+
                "<p>"+ data[row].estado +"</p>"+
                "</div>"+
                "<div class='list_producto_precio'>"+
                "<p>"+ data[row].precio +"€ </p>"+
                "</div>"+



                "</div>"

            )

        }




    })
}

function click_detail(){
    $(document).on("click",".list_producto",function(){
        let id = this.getAttribute('id');
        load_details_producto(id);
    })
}

function load_details_producto(id){
    $('#body_shop_productos').empty();
    $('#details_productos').empty();

    $('<div></div>').attr({'id': data[row].id_producto,'class': 'details_producto'}).appendTo('#details_productos')
    .html(
        "<div class='details_producto_img'></div>"+
        "<div class='details_producto_body'></div>"
    )

    $('<div></div>').attr('class', 'details_producto_body').appendTo('#details_productos')
    .html(
        
    )
}



$(document).ready(function(){
    load_productos();
});