$(document).ready(function () {
    
    $('#ordersdetailqty').val(0);
    $('#ordersdetailprice').val(0);
    $('#ordersdetailsubtotal').val(0);
    $('#ordersdetaildownpayment').val(0);
    $('#ordersdetailpaid_off').val(0);
    $('#ordersdetailtotal').val(0);
    $('#discount').val(0);

    $("#btn-add-table-ordersdetail").click(function () {
        var fired_button = $(this).val();
       
        if (fired_button == 'Add To Table') {
            // check product
            $("#table-ordersdetail tbody .product_id").each(function(){
                var product_id = $(this).text();
                if(product_id == ' undefined' || product_id=='' || product_id=='** Silahkan pilih Produk'){
                    swal('Silahkan pilih product');
                    removeTable($(this).val())
                    return false
                }
            });
             $("#table-ordersdetail tbody .qty").each(function(){
                var qty = $(this).text();
                if(qty == ' undefined' || qty=='' || qty==0){
                    swal('Silahkan quantity product dengan benar, qty tidak boleh 0 atau kosong');
                    removeTable($(this).val())
                    return false
                }
            });
               $("#table-ordersdetail tbody .price").each(function(){
                var price = $(this).text();
                if(price == ' undefined' || price=='' || price==0){
                    swal('Silahkan harga product dengan benar, harga tidak boleh 0 atau kosong');
                    removeTable($(this).val())
                    return false
                }
            });

        } 
    });

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
});