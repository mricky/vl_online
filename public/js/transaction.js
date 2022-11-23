$(document).ready(function() { 
    var category = 0;
    var query = "";
    var column_name = $('#hidden_column_name').val();
    var sort_type = $('#hidden_sort_type').val();
    var page = $('#hidden_page').val();

    $('#table').val(1);
    sessionStorage.clear();
    var shoppingCart = (function() {
        // =============================
        // Private methods and propeties
        // =============================
        cart = [];
        
        // Constructor
        function Item(id,name,wh_location_id, price, count) {
          this.id = id,
          this.wh_location_id = wh_location_id,
          this.name = name;
          this.price = price;
          this.count = count;
        }
        
        // Save cart
        function saveCart() {
          sessionStorage.setItem('shoppingCart', JSON.stringify(cart));
        }
        
          // Load cart
        function loadCart() {
          cart = JSON.parse(sessionStorage.getItem('shoppingCart'));
        }
        if (sessionStorage.getItem("shoppingCart") != null) {
           loadCart();
        }
        
      
        // =============================
        // Public methods and propeties
        // =============================
        var obj = {};
        
        // Add to cart
        obj.addItemToCart = function(id,wh_location_id,name, price, count) {
          for(var item in cart) {
            if(cart[item].id == id) {
              cart[item].count ++;
              saveCart();
              return;
            }
          }
          var item = new Item(id,wh_location_id,name, price, count);
          cart.push(item);
          saveCart();
        }
        // Set count from item
        obj.setCountForItem = function(id, count) {
          for(var i in cart) {
            if (cart[i].id === id) {
              cart[i].count = count;
              break;
            }
          }
        };
        // Remove item from cart
        obj.removeItemFromCart = function(id) {
            for(var item in cart) {
              if(cart[item].id == id) {
                cart[item].count --;
                if(cart[item].count === 0) {
                  cart.splice(item, 1);
                }
                break;
              }
          }
          saveCart();
        }
      
        // Remove all items from cart
        obj.removeItemFromCartAll = function(id) {
         
          for(var item in cart) {
            if(cart[item].id == id) {
              //console.log(cart[item].id+'-'+id);
              cart.splice(item, 1);
              break;
            }
          }
          saveCart();
        }
      
        // Clear cart
        obj.clearCart = function() {
          cart = [];
          saveCart();
        }
      
        // Count cart 
        obj.totalCount = function() {
          var totalCount = 0;
          for(var item in cart) {
            totalCount += cart[item].count;
          }
          return totalCount;
        }
      
        // Total cart
        obj.totalCart = function() {
          var totalCart = 0;
          for(var item in cart) {
            totalCart += cart[item].price * cart[item].count;
          }
          return Number(totalCart.toFixed(2));
        }
      
        // List cart
        obj.listCart = function() {
         
          var cartCopy = [];
          for(i in cart) {
            item = cart[i];
            itemCopy = {};
            for(p in item) {
              itemCopy[p] = item[p];
      
            }
            itemCopy.total = Number(item.price * item.count).toFixed(2);
            cartCopy.push(itemCopy)
          }
          
          return cartCopy;
        }
      
        // cart : Array
        // Item : Object/Class
        // addItemToCart : Function
        // removeItemFromCart : Function
        // removeItemFromCartAll : Function
        // clearCart : Function
        // countCart : Function
        // totalCart : Function
        // listCart : Function
        // saveCart : Function
        // loadCart : Function
        return obj;
      })();
    
    var transaction = {
        'customer' : '',
        'table'    : '',
        'order_date' : '',
        'subtotal'  : '',
        'discount' : '',
        'total' : '',
        'detail'  : []
    }
   
    $(document).on('click','.check',function(){ 
        let currentRow=$(this).closest("tr");     
        let id =currentRow.find("td:eq(0)").text();    
        let name =currentRow.find("td:eq(1)").text(); // get current row 3rd TD
        let price =currentRow.find("td:eq(2)").text();
        let wh_location_id = currentRow.find("td:eq(3)").text(); // location
        shoppingCart.addItemToCart(id,wh_location_id,name, price, 1);
        displayCart();
              
    });
    var clearCart = () =>{
    
      var cartArray = shoppingCart.listCart();
      var output = "";
      for(var i in cartArray) {
        shoppingCart.removeItemFromCartAll(cartArray[i].id)
      }
    }
    var getItemCart = () => {
      return shoppingCart.listCart();
    }
    var displayCart = () =>{
        var cartArray = shoppingCart.listCart();
        var output = "";
        for(var i in cartArray) {
            output += "<tr>"
            + "<td>" + cartArray[i].name + "</td>" 
            + "<td>"+formatRupiah(cartArray[i].price, 'Rp. ') + "</td>"
            + "<td><div><button class='minus-item btn btn-info'  data-name=" + cartArray[i].id + ">-</button></td>"
            + "<td><input type='number' style='width: 75px;' class='item-count form-control' data-name='" + cartArray[i].name + "' value='" + cartArray[i].count + "'></td>"
            + "<td><button class='plus-item btn btn-info' data-name=" + cartArray[i].id + ">+</button></div></td>"
            + "<td><button class='delete-item btn btn-danger' data-name=" + cartArray[i].id + ">X</button></td>"
            + " = " 
            + "<td style='visibility:hidden'>" + cartArray[i].total + "</td>" 
            +  "</tr>";
        }
        let total = shoppingCart.totalCart();
        $('#table-cart-order tbody').html(output);
        $('#subtotal').html(formatRupiah(total.toString(),'Rp .'));
        $('#total').html(formatRupiah(total.toString(),'Rp .'));
        $('#about_big').html(formatRupiah(total.toString(),'Rp .'));
    }

    function formatRupiah(angka, prefix){
			var number_string = angka.replace(/[^,\d]/g, '').toString(),
			split   		= number_string.split(','),
			sisa     		= split[0].length % 3,
			rupiah     		= split[0].substr(0, sisa),
			ribuan     		= split[0].substr(sisa).match(/\d{3}/gi);
 
			// tambahkan titik jika yang di input sudah menjadi angka ribuan
			if(ribuan){
				separator = sisa ? '.' : '';
				rupiah += separator + ribuan.join('.');
			}
 
			rupiah = split[1] != undefined ? rupiah + ',' + split[1] : rupiah;
			return prefix == undefined ? rupiah : (rupiah ? 'Rp. ' + rupiah : '');
		}

    $(document).on("click", ".delete-item", function(event) {
        var id = $(this).data('name');
        shoppingCart.removeItemFromCartAll(id);
        displayCart();
        
      })
      $(document).on("click", ".minus-item", function(event) {
        var id = $(this).data('name')
        shoppingCart.removeItemFromCart(id);
        displayCart();
      })
      // +1
      $(document).on("click", ".plus-item", function(event) {
        var id = $(this).data('name')
        shoppingCart.addItemToCart(id);
        displayCart();
      })
    $(document).on('keyup', '#serach', function(){
        query = $(this).val();
        fetch_data(page, sort_type, column_name,category, query);
    });

    $('#add-cust-table-btn').click(function(){
        transaction.customer = $('#customer').val();
        transaction.table = $('#table').val();
        transaction.order_date = 'orderdate';

        $('#order-customer').html(transaction.customer);
        $('#order-table').html(transaction.table);
    });
    $('#cash-btn').click(function(){
       handleSave(1);
       //initPrint();
    });
   
    $('#edc-btn').click(function(){
       handleSave(2);
       
    });
    function handleSave(payment_method){
      transaction.customer = $('#order-customer').text();
      transaction.table = $('#order-table').text();
      transaction.order_date = '2020-09-4';
      transaction.subtotal = shoppingCart.totalCart();
      transaction.discount = 0,
      transaction.total = shoppingCart.totalCart()
      var cartArray = shoppingCart.listCart();
      var output = "";

      transaction.detail = [];
      transaction.id = [];
      transaction.name = [];
      transaction.count = [];
      transaction.price = [];
      transaction.total = [];

      for(var i in cartArray) {
         transaction.id.push(cartArray[i].id); // barang
         transaction.name.push(cartArray[i].name);
         transaction.price.push(cartArray[i].price);
         transaction.count.push(cartArray[i].count);
         transaction.total.push(cartArray[i].total);
      }

      // VALIDATION
    
      if(cartArray.length == 0){
        alert('anda belum memilih items');
        return;
      }
  
      $.ajax({
          url: '/mall-ukm/save-cashier',
          type: 'POST',
          data:  {
                    id: transaction.id,
                    name: transaction.name,
                    price: transaction.price,
                    count: transaction.count,
                    totalItem: transaction.total,  
                    customer: transaction.customer,
                    subtotal: shoppingCart.totalCart(),
                    discount: 0, 
                    total: shoppingCart.totalCart()
                } ,
          success: function(result){
               if(result){

                     sessionStorage.clear();
                     clearCart();
                     displayCart();
                     initPrint(result.last_id);
               }  
          },
          error: function(result){
              alert('failed to store transaction');
          }
          
      })
     
     
    }
    $('#all-btn').click(function(){
        // TODO:
        category = 'all';
        fetch_data(page, sort_type, column_name, category,query);
        // alert('all');
    });
    $('#craft-btn').click(function(){
        category = 2;
        fetch_data(page, sort_type, column_name, category,query);
        //alert('craft');
    });
    $('#fashion-btn').click(function(){
      category = 13;
      fetch_data(page, sort_type, column_name, category,query);
      //alert('fashion');
    });
    $('#fnb-btn').click(function(){
        category = 11;
        fetch_data(page, sort_type, column_name, category,query);
        //alert('fnb');
    });
    $('#cancel-btn').click(function(){
        sessionStorage.clear();
        displayCart();
    });
    function fetch_data(page,sort_type, sort_by, category,query){
        var base_url = base_url = window.location.origin;
        var host = window.location.host;
        console.log(host);
        var tableItems = $('#table-items');
        $('#table-items tbody tr').remove();
        $.ajax({
            url:"/mall-ukm/fetchItems/filter?page="+page+"&sortby="+sort_by+"&sorttype="+sort_type+"&category="+category+"&query="+query,
            success:function(result)
            {
                result.data.map(item=>{
                    tableItems.append(
                        `<tr>
                            <td class="column_name p-1" style="display: none;" data-column_name="platform" data-id=${item.id}>${item.id}</td>
                            <td class="column_name p-1" data-column_name="platform" data-id=${item.name}>${item.name}</td>
                            <td class="column_name p-1" data-column_name="platform" data-id=${item.product_price}>${item.product_price}</td>
                            <td class="column_name p-1" data-column_name="platform" data-id=${item.wh_location_id}>${item.wh_location_id}</td>
                            <td style="text-align: center"><a id="" href="javascript:void(0)"><i data-id="{{$item->id}}" class="fa fa-check check"></i></a></td>
                        <tr>`
                    )
                   // console.log(item.name);
                });
               
            }
        })
    }

    function initPrint(last_id)
    {
        var iframes = document.querySelectorAll('iframe');
        for (var i = 0; i < iframes.length; i++) {
            iframes[i].parentNode.removeChild(iframes[i]);
        }
                    
        var route = "/doPrint";
        var formData = {order_id:last_id};
      
        $.post(route, formData, function(data){
          
            if(data.success === 'true')
            {
                //console.log(data);
                var iframe = document.createElement('iframe');   
                // console.log(iframe);             
                iframe.style.display = "none";
                document.body.appendChild(iframe);
                iframe.contentWindow.document.open();
                iframe.contentWindow.document.write(data.view);
                iframe.contentWindow.document.close();
               
                return false;
            }
    	});
    }
});