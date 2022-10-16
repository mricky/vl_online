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
        <strong><i class="fa fa-edit"></i> Pembelian</strong>
        
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
            <td>{{$purchase_order->order_number}}</td>
            </tr>
            <tr>
            <td style="padding:5px;width:10%;">Tgl Order</td>
            <td>:</td>
            <td>{{$purchase_order->order_date}}</td>
            </tr>
            <tr>
            <td style="padding:5px;width:10%;">Supplier</td>
            <td>:</td>
            <td>{{$purchase_order->vendor_name}}</td>
            </tr>
            <td style="padding:5px;width:10%;">Phone</td>
            <td>:</td>
            <td>{{$purchase_order->vendor_phone}}</td>
            </tr>
            <tr>
            <td style="padding:5px;width:10%;">Alamat</td>
            <td>:</td>
            <td>{{$purchase_order->address}}</td>
            <tr>
            <td style="padding:5px;width:10%;">Keterangan</td>
            <td>:</td>
            <td>{{$purchase_order->description}}</td>
            </tr>
            </tbody>
            </table>
            </strong>
            <h3>Detail Pembelian</h3>
            <table style="width:100%;border:1px solid black" id="det_billing">
                    <tr>
                        <th>Produk</th>
                        <th>Qty</th>
                        <th>Harga</th>
                        <th>DP</th>
                        <th>Pelunasan</th>
                        <th>Sisa</th>
                    </tr>
                    <tbody>
                    <?php $i = 0 ?>
                        @foreach($detail_purchase as $detail)
                        <?php $i++;?>
                        <tr>
                            <td>{{$detail->product_name}}</td>
                            <td>{{$detail->qty}}</td>
                            <td  style="text-align:right">{{number_format($detail->price)}}</td>
                            <td  style="text-align:right">{{number_format($detail->downpayment)}}</td>
                            <td  style="text-align:right">{{number_format($detail->paid_off)}}</td>
                            <td  style="text-align:right">{{number_format(($detail->price - $detail->paid_off))}}</td>
                        </tr>
                        @endforeach
                    </tbody>
            </table>
            </br>
            <h3>Riwayat Penerimaan Barang</h3>
            <table style="width:100%;border:1px solid black" id="det_billing">
                    <tr>
                        <th>No Penerimaan</th>
                        <th>Tgl Terima</th>
                        <th>Barang</th>
                        <th>Qty In</th>
                        <th>Lokasi</th>
                        <th>Penerima</th>
                    </tr>
                    <tbody>
                            @foreach ($detail_receipt as $item)
                             <tr>
                                 <td>{{$item->code}}</td>
                                 <td>{{$item->receipt_date}}</td>
                                 <td>{{$item->product_name}}</td>
                                 <td>{{$item->qty_in}}</td>
                                 <td>{{$item->wh_location_name}}</td>
                                 <td>{{$item->receipt_by}}</td>
                             </tr>
                             
                            @endforeach
                    </tbody>
            </table>
        </div>
    </div>
</div>
@endsection