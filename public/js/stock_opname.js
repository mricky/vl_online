
var items = null;
var whLocationId = null;

$("#wh_location_id").on("select2:select select2:unselect", function (e) {
     whLocationId = $(this).val(); 

     renderProductLocation(items,whLocationId);
});


$("#product_filters").on("select2:select select2:unselect", function (e) {

    //this returns all the selected item
    items= $(this).val();       

    renderProductLocation(items,whLocationId);

})

const renderProductLocation = (items, whLocationId) => {
    const containerTable =   $('#table-barang');

    $('#table-barang tbody').remove();	
    $.ajax({
        url: '/find-product-location-item',
        dataType: 'json',
        data: {q : items,whLocationId: whLocationId},
        success: (data)=>{
            data.map(function(item){
               
                containerTable.append(`<tr>
                <td class="product_location_id">Supplier : ${item.vendor_name} ${item.product_name}<input type="hidden" name="barang-product_location_id[]" value=${item.id}></td>\
                <td class="qty_onhand">${item.qty_onhand}<input type="hidden" name="barang-qty_onhand[]" value=${item.qty_onhand}></td>\
                <td class="qty_actual">0<input type="hidden" name="barang-qty_actual[]" value=0></td>\
                <td class="qty_difference">0<input type="hidden" name="barang-qty_difference[]" value=0></td>\
                <td class="adjust_cost">${item.product_price}<input type="hidden" name="barang-adjust_cost[]" value=${item.product_price}></td>\
                <td><a href="#panel-form-barang" onclick="editRowbarang(this)" class="btn btn-warning btn-xs"><i class="fa fa-pencil"></i></a> <a href="javascript:void(0)" onclick="editRowbarang(this)" </a></td>
                </tr>`)
            });
        }
        
    })
}