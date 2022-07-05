@extends('crudbooster::admin_template')
@section('content')
<script src="{{ asset ('vendor/crudbooster/assets/adminlte/plugins/jQuery/jquery-2.2.3.min.js') }}"></script> 
    <!-- Bootstrap 3.3.2 JS -->
    <script src="{{ asset ('vendor/crudbooster/assets/adminlte/bootstrap/js/bootstrap.min.js') }}" type="text/javascript"></script>
<!-- Your html goes here -->
<!-- <p><a title='Return' href='{{CRUDBooster::mainpath()}}'><i class='fa fa-chevron-circle-left '></i> &nbsp; {{trans("crudbooster.form_back_to_list",['module'=>CRUDBooster::getCurrentModule()->name])}}</a></p>  -->

<div class="panel panel-default">
    <div class="panel-heading">
        <strong><i class="fa fa-gears"></i> Laporan Stok</strong>
    </div> 
    <div class="panel-body"> 
        <table>
            <tr>
                <td>
                    <form class="form-horizontal" method="post" id="form" enctype="multipart/form-data" action="{{CRUDBooster::mainpath('cetakstok')}}" target="_blank">
                        <input name="_token" value=" {{ csrf_token() }}" type="hidden"> 
                        <button type='submit' class='btn btn-success'>
                            <i class='fa fa-print'></i> Laporan Inventory
                        </button>
                    </form>
                </td>
                <td>
                    <form class="form-horizontal" method="post" id="form" enctype="multipart/form-data" action="{{CRUDBooster::mainpath('cetakiot')}}" target="_blank">
                        <input name="_token" value="{{ csrf_token() }}" type="hidden"> 
                        <button type='submit' class='btn btn-primary' style="margin-left: 5px;">
                            <i class='fa fa-print'></i> Laporan Product Lot
                        </button>
                    </form>
                </td>
            </tr>
        </table>
    </div>
</div>
@endsection