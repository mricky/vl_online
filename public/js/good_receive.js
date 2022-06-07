$('#purchase_order_id').change(function(){
  
    var selectedVal = $('#purchase_order_id option:selected').val();
    
    if($.isNumeric(selectedVal))
    {
         getItemLineProductPO(selectedVal);
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