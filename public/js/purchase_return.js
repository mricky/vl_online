$('#purchase_order_id').change(function(){
    let id = $('#purchase_order_id').val();
    
    alert(id);
    if($.isNumeric(id))
    {
         getItemLineProductPO(id);
    } 
});

const getItemLineProductPO = (id) => {
    const containerTable = $('#table-ordersdetailreturn');

    $('#table-ordersdetailreturn tbody').remove();

    $.ajax({
        type: 'GET',
        url: '/find-product-location-item-purchase/'+id,
        success: (data)=> {
            data.map(function(item){
            containerTable.append(`<tr>
            <td class="product_location_id">${item.wh_location_name} - ${item.product_name}<input type="hidden" name="table-ordersdetailreturn-product_location_id[]" value=${item.id}></td>\
            <td class="invoice_qty">${item.qty_onhand}<input type="hidden" name="table-ordersdetailreturn-invoice_qty[]" value=${item.qty_onhand}></td>\
            <td class="price">${item.product_price}<input type="hidden" name="table-ordersdetailreturn-price[]" value=${item.product_price}></td>\
            <td class="return_qty">0<input type="hidden" name="table-ordersdetailreturn-return_qty[]" value=0</td>\
            <td class="subtotal">0<input type="hidden" name="table-ordersdetailreturn-return_subtotal[]" value=0</td>\
            <td><a href="#panel-form-ordersdetailreturn" onclick="editRowordersdetailreturn(this)" class="btn btn-warning btn-xs"><i class="fa fa-pencil"></i></a> <a href="javascript:void(0)" onclick="deleteRowordersdetailreturn(this)" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></a></td>
            </tr>`)
           });
         }
    });
}