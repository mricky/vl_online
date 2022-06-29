@extends('crudbooster::admin_template')
@section('content')
<script src="{{ asset ('vendor/crudbooster/assets/adminlte/plugins/jQuery/jquery-2.2.3.min.js') }}"></script> 
    <!-- Bootstrap 3.3.2 JS -->
    <script src="{{ asset ('vendor/crudbooster/assets/adminlte/bootstrap/js/bootstrap.min.js') }}" type="text/javascript"></script>
<!-- Your html goes here -->
<!-- <p><a title='Return' href='{{CRUDBooster::mainpath()}}'><i class='fa fa-chevron-circle-left '></i> &nbsp; {{trans("crudbooster.form_back_to_list",['module'=>CRUDBooster::getCurrentModule()->name])}}</a></p>  -->
<style>
#det_billing {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: separate;
  width: 100%;
}

#det_billing td, th {
  border: 1px solid #ddd;
  padding: 8px;
}

#det_billing tr:nth-child(even){background-color: #f2f2f2;}

#det_billing tr:hover {background-color: #ddd;}

#det_billing th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #3a86de;
  color: white;
}
</style>
<div class="panel panel-default">
    <div class="panel-heading">
        <strong><i class="fa fa-gears"></i> Penjualan</strong>
          @if ($sales_order->delivery_order == 0)
               <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#approval_notes" id="approve" onclick="set_approve()">Approve</button>  
          @endif

          <!-- <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#approval_notes" id="reject"  onclick="set_reject()">Reject</button>  -->

    </div> 
  <!-- modal approval -->
  
            <div class="modal fade" tabindex="-1" role="dialog" id="approval_notes">
                <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="alert alert-danger" style="display:none"></div>
                    <div class="modal-header">
                    
                    <h5 class="modal-title">Field Break Request Approval/reject</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    </div>
                   
                    <form method="post" action="{{CRUDBooster::mainpath('kirim')}}" id="form_approval"  name="form_approval">
                  
                    {{ csrf_field() }}
                    <div class="modal-body">
                
                    <div class="row">
                        <div class="form-group col-md-10">
                        <input  type="hidden"  class="form-control" name="sales_order_id" id="sales_order_id" value={{$sales_order->id}}>
                        <input  type="hidden"  class="form-control" name="approval_status" id="approval_status" >  
                        </div>
                        </div>
                        <div class="row">
                        <div class="form-group col-md-12 ; max-height: calc(100vh - 120px); overflow: scroll; ">
                            <label for="Name" id="stat_notes">Notes</label>
                                <textarea  class="form-control" style="width: 100%;height:100%"  name="acknowledge_notes" id="acknowledge_notes" >  </textarea>
                        </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                    <!-- <input type='submit' class='btn btn-primary' value='Save changes'/> -->

                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button  class="btn btn-success" type='submit' >Submit</button>
                    </div>
                    </form>
                </div>
                </div>
            </div>


  <!-- end modal approval -->
    <div class='panel-body'>   
        <div class='form-group'>
        <strong>
            <table style="padding: 15px;">

            <tbody>
            <tr>
            <td style="padding:5px;width:10%;">No Order</td>
            <td>:</td>
            <td>{{$sales_order->order_number}}</td>
            </tr>
            <tr>
            <td style="padding:5px;width:10%;">Tgl Order</td>
            <td>:</td>
            <td>{{$sales_order->order_date}}</td>
            </tr>
            <tr>
            <td style="padding:5px;width:10%;">Pelanggan</td>
            <td>:</td>
            <td>{{$sales_order->customer_name}}</td>
            </tr>
            <td style="padding:5px;width:10%;">No HP</td>
            <td>:</td>
            <td>{{$sales_order->customer_phone}}</td>
            </tr>
            <tr>
            <td style="padding:5px;width:10%;">Alamat</td>
            <td>:</td>
            <td>{{$sales_order->customer_address}}</td>
            <tr>
            <td style="padding:5px;width:10%;">Expedisi</td>
            <td>:</td>
            <td>{{$sales_order->expedition_name}}</td>
            </tr>
            <tr>
            <td style="padding:5px;width:10%;">Keterangan</td>
            <td>:</td>
            <td>{{$sales_order->description}}</td>
            </tr>
            </tbody>
            </table>
            </strong>
            <h2>Detail Penjualan</h2>

            <table style="width:100%;border:1px solid black" id="det_billing">
            <thead>
            <tr>
                <th>Produk</th>
                <th>Lot Number</th>
                <th>Qty</th>
                <th>Harga</th>
                <th>Total</th>
            </tr>
            </thead>
            <tbody> 
            <?php $i = 0 ?>
              @foreach($detail_sales as $detail)
              <?php $i++;?>
              <tr>
                <td>{{$detail->product_name}}</td>
                <td>{{$detail->lot_number}}</td>
                <td>{{$detail->qty}}</td>
                <td  style="text-align:right">{{number_format($detail->price)}}</td>
                <td  style="text-align:right">{{number_format($detail->total)}}</td>
              </tr>
              @endforeach
            <tfoot>
        <tr>
            <td colspan="3"></td>
            <td >Total Amount</td>
            <td align="right">{{number_format($sales_order->subtotal)}}</td>
        </tr>
        <tr>
            <td colspan="3"></td>
            <td >Diskon </td>
            <td align="right">{{number_format($sales_order->discount)}}</td>
          
        </tr>
        <tr>
            <td colspan="3"></td>
            <td >Expedisi </td>
            <td align="right">{{number_format($sales_order->expedition_cost)}}</td>
          
        </tr>
        <tr>
            <td colspan="3"></td>
            <td ><b>Grand Total</b></td>
            <td align="right">{{number_format($sales_order->total)}}</td>
        </tr>
    </tfoot>
            </table>
        </div>
    </div>
</div>
<script>
      function set_approve() { 
        var inputF = document.getElementById("approval_status"); 
        var notes_labtel = document.getElementById("stat_notes"); 
            inputF.value  = "1"; 
            notes_labtel.innerHTML =" Approval Notes";
         
        } 
        function set_reject() { 
        var inputF = document.getElementById("a"); 
        var notes_labtel = document.getElementById("stat_notes"); 
           inputF.value  = "9"; 
            notes_labtel.innerHTML ="Rejection Notes";
         
        } 
      </script>


@endsection