
$('#purchase_order_id').change(function(){
    let id = $('#purchase_order_id .input-id').val();
    
    if($.isNumeric(id))
    {
         getItemLineProductPO(id);
    } 
});

 $("#btn-add-table-detailpenerimaan").click(function () {
        
        var fired_button = $(this).val();
     
        if (fired_button == 'Add To Table') {
            // check product
            $("#table-detailpenerimaan tbody .product_id").each(function(){
                var product_id = $(this).text();
                if(product_id == ' undefined' || product_id=='' || product_id=='** Silahkan pilih Produk'){
                    swal('Silahkan pilih product');
                    removeTable($(this).val())
                    return false
                }
            });
             $("#table-detailpenerimaan tbody .qty_in").each(function(){
                var qty = $(this).text();
                if(qty_in == ' undefined' || qty_in=='' || qty_in==0){
                    swal('Silahkan quantity product masuk dengan benar, qty masuk tidak boleh 0 atau kosong');
                    //removeTable($(this).val())
                    return false
                }
            });
            $("#table-detailpenerimaan tbody .price").each(function(){
                var price = $(this).text();
                if(price == ' undefined' || price=='' || price==0){
                    swal('Silahkan harga product dengan benar, harga tidak boleh 0 atau kosong');
                    //removeTable($(this).val())
                    return false
                }
            });

        } 
    });

const getItemLineProductPO = (id) => {
    const containerTable =   $('#table-detailpenerimaan');
    const receiveDate = $('#receipt_date').val();
   
    const receiveDateFormat = receiveDate.replace(/-/g, "");
    $('#table-detailpenerimaan tbody').remove();	
    // detailpenerimaan-qty_in[]
    // is_store_vendor_location detailpenerimaan-is_store_vendor_location[]
    // lot_number detailpenerimaan-lot_number[]
    $.ajax({
        type: 'GET',
        url: '/searchItemLinePO/'+id,
        success: (data)=>{ 
            data.map(function(item){
                let vendor_code = item.vendor_code;
                let lotNumber = "";
                if(item.is_track_lot_number === 1){
                    lotNumber =  vendor_code.concat("-",receiveDateFormat);
                }
               
                containerTable.append(`<tr>
                <td class="product_id">${item.product_name}<input type="hidden" name="detailpenerimaan-product_id[]" value=${item.product_id}></td>\
                <td class="qty_in">${item.qty}<input type="hidden" name="detailpenerimaan-qty_in[]" value=${item.qty}></td>\
                <td class="price">${item.price}<input type="hidden" name="detailpenerimaan-price[]" value=${item.price}></td>\
                <td class="is_store_vendor_location">0<input type="hidden" name="detailpenerimaan-is_store_vendor_location[]" value=0></td>\
                <td class="lot_number">${lotNumber}<input type="hidden" name="detailpenerimaan-lot_number[]" value=${lotNumber}></td>\
                <td><a href="#panel-form-detailpenerimaan" onclick="editRowdetailpenerimaan(this)" class="btn btn-warning btn-xs"><i class="fa fa-pencil"></i></a> <a href="javascript:void(0)" onclick="deleteRowitemorder(this)" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></a></td>
                </tr>`)
            });
        }
    });
}

 function removeTable(value){
    if(value !=null){      
         $('#table-ordersdetail tr td').each(function() {
                if($(this).text().toLowerCase().indexOf(value.toLowerCase()) >= 0) {
                    $(this).parent().remove();
                    return false;
                }
            });
        }
 }