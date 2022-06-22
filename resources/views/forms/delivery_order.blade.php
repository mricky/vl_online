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
          <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#approval_notes" id="approve" onclick="set_approve()">Approve</button>  
          <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#approval_notes" id="reject"  onclick="set_reject()">Reject</button> 

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
            <td style="padding:5px;width:10%;">Reference/Order Number</td>
            <td style="padding:5px;width:1%;">:</td>
            <td style="padding:5px;width:74%;"></td>
            </tr>
            <tr>
            <td style="padding:5px;width:10%;">BIll Originator</td>
            <td>:</td>
            <td></td>
            </tr>
            <tr>
            <td style="padding:5px;width:10%;">Biller Department</td>
            <td>:</td>
            <td></td>
            </tr>
            <tr>
            <td style="padding:5px;width:10%;">Dated</td>
            <td>:</td>
            <td></td>
            </tr>
            <tr>
            <td style="padding:5px;width:10%;">CSR Code</td>
            <td>:</td>
            <td></td>
            </tr>
            <tr>
            <td style="padding:5px;width:10%;">Cutomer/Other Ref</td>
            <td>:</td>
            <td></td>
            </tr>
            </tbody>
            </table>
            </strong>
            <h2>Detail Penjualan</h2>

            <table style="width:100%;border:1px solid black" id="det_billing">
            <thead>
            <tr>
            <th>Line No</th>
            <th>Description</th>
            <th>Remarks</th>
            <th>Charge type</th>
            <th>Charge Code</th>
            <th>Total Cost</th>
            <th>Rate</th>
            <th>Qty</th>
            <th>Ammout</th>
            <th>Income Tax Stat</th>
            <th>Income Tax</th>
          
            </tr>
            </thead>
            <tbody> 

            <tfoot>
    <tr>
            <td colspan="7"></td>
            <td >Total Amount</td>
            <td align="right">0</td>
            <td ></td>
            <td></td>
        </tr>
        
        <tr>
            <td colspan="7"></td>
            <td >Vat/PPN 10% </td>
            <td align="right"></td> <td ></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="7"></td>
            <td >Amount After Tax</td>
            <td align="right"></td>
            <td ></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="7"></td>
            <td >Income Tax Amount (-) </td> <!-- sum pph-->
            <td align="right"></td>
            <td ></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="7"></td>
            <td ><b>Grand Total</b></td>
            <td align="right"></td>
            <td ></td>
            <td></td>
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

<!-- end script buat prosess approval --> 

@endsection