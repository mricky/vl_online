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
                   
                    <form method="post" action="{{CRUDBooster::mainpath('payment')}}" id="form_payment"  name="form_payment">
                  
                    {{ csrf_field() }}
                
                    <div class="modal-footer">
                    </div>
                   
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
            <tr>
            <td style="padding:5px;width:10%;">Total Order</td>
            <td>:</td>
            <td>Rp. {{number_format($sales_order->total)}}</td>
            </tr>
            <tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <td style="padding:5px;width:10%;">Sisa</td>
            <td>:</td>
            <td>Rp. {{number_format($sales_order->amount_due)}}</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <td style="padding:5px;width:10%;">Bayar</td>
            <td>:</td>
            <td> <input  type="hidden"  class="form-control" name="amount_due" id="amount_due" value={{$sales_order->amount_due}}> <input  type="text"  class="form-control" name="total_amount" id="total_amount" value={{$sales_order->id}}></td>
            </tr>
            </tbody>
            </table>
            </strong>
            
        </div>
       
        <div class="row">
             <div class="form-group col-md-5">
              <button  class="btn btn-success" type='submit' >Bayar</button>&nbsp
              <button type="button" class="btn btn-secondary" onclick="history.back()">Batal</button>
            </div>
                   
             </div>
        
    </div>
    </form>
</div>
<script>
      
      var rupiah = document.getElementById('total_amount');

      rupiah.addEventListener('keyup', function(e){
			// tambahkan 'Rp.' pada saat form di ketik
			// gunakan fungsi formatRupiah() untuk mengubah angka yang di ketik menjadi format angka
			rupiah.value = formatRupiah(this.value, 'Rp. ');
		});
    /* Fungsi formatRupiah */
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
</script>


@endsection