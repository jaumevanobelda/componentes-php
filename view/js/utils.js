function ajaxPromise(url,type,data_type, data = undefined){
    return new Promise((resolve, reject) => {
        $.ajax({
            type:type,
            url:url,
            data:data,
            dataType:data_type,
        }).done((data) =>{
            resolve(data);
        }).fail((jqXHR,textStatus,
            errorThrow) =>{
                reject(errorThrow);
            });        
    });

}