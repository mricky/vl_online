
$(document).ready(function () {
   
$('#good_receipt_id').change(function(){
    let id = $('#good_receipt_id').val();
    
    if($.isNumeric(id))
    {
         getPOByReceipt(id);

         getItemLineReceipt(id);
    } 

});
$("#btn-add-table-ordersdetail").click(function() {
    var fired_button = $(this).val();
    console.log(fired_button)

     if(fired_button =='Add To Table'){
       
      $('th:nth-child(6), tr td:nth-child(6)').hide();
      $('th:nth-child(7), tr td:nth-child(7)').hide();
      $('th:nth-child(8), tr td:nth-child(8)').hide();
       
       $("#table-ordersdetail tbody .product_location_id").each(function(){
            var is_product_location = $(this).text();
            console.log(is_product_location);

            if(is_product_location == ' undefined' || is_product_location==''){
                swal('Silahkan pilih line product retur');
                removeTable($(this).val())
                return false
            }
            
        });
       
    } else {
        $("#table-ordersdetail tbody .product_location_id").each(function(){
            var is_product_location = $(this).text();
            console.log(is_product_location);

            if(is_product_location == ' undefined' || is_product_location==''){
                swal('Silahkan pilih line product retur');
                removeTable($(this).val())
                return false
            }
            
        });
    }
    //alert(fired_button);
    //btn btn-danger btn-xs
    //$('.btn-danger').hide();
});
const getPOByReceipt = (id) => {
    $.ajax({
        type: 'GET',
        url: '/find-order-number-by-receipt/'+id,
        success: (data)=> {
                $('#order_number').val(data.order_number);
                $('#vendor_name').val(data.vendor_name);
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
const getItemLineReceipt = (id) => {

    const containerTable = $('#table-ordersdetail');

    $('#table-ordersdetail tbody').remove();

    $.ajax({
        type: 'GET',
        url: '/find-product-location-item-receive/'+id,
        success: (data)=> {
            data.map(function(item){
            let subtotal = item.price * item.qty_in;
            containerTable.append(`<tr>
            <td class="product_id">${item.product_id} - ${item.product_name} -- ${item.wh_location_name}<input type="hidden" name="ordersdetail-product_id[]" value=${item.product_id} ></td>\
            <td class="return_qty">0<input type="hidden" name="ordersdetail-return_qty[]" value=0></td>\
            <td class="qty">${item.qty_in}<input type="hidden" name="ordersdetail-qty[]" value=${item.qty_in}></td>\
            <td class="price">${item.price}<input type="hidden" name="ordersdetail-price[]" value=${item.price}></td>\
            <td class="subtotal">${subtotal}<input type="hidden" name="ordersdetail_subtotal[]" value=${subtotal}</td>\
            <td class="product_location_id" style="display:none;"><input type="text" name="ordersdetail-product_location_id[]" value=${item.product_location_id} ></td>\
            <td class="good_receipt_id" style="display:none;"><input type="text" name="ordersdetail-good_receipt_id[]" value=${item.good_receipt_id} ></td>\
            <td class="good_receipt_detail_id" style="display:none;"><input type="text" name="ordersdetail-good_receipt_detail_id[]" value=${item.good_receipt_detail_id} ></td>\
            <td></td>\
            <td></td>\
            <td></td>\
            <td><a href="#panel-form-ordersdetail" onclick="editRowordersdetail(this)" class="btn btn-warning btn-xs"><i class="fa fa-pencil"></i></a><a href="javascript:void(0)" onclick="deleteRowordersdetail(this)" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></a></td>
            </tr>`)
           });
         }
    });

  
}
});