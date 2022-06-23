@extends('crudbooster::admin_template')
@section('content')
<script src="{{ asset ('vendor/crudbooster/assets/adminlte/plugins/jQuery/jquery-2.2.3.min.js') }}"></script> 
    <!-- Bootstrap 3.3.2 JS -->
    <script src="{{ asset ('vendor/crudbooster/assets/adminlte/bootstrap/js/bootstrap.min.js') }}" type="text/javascript"></script>
<!-- Your html goes here -->
<!-- <p><a title='Return' href='{{CRUDBooster::mainpath()}}'><i class='fa fa-chevron-circle-left '></i> &nbsp; {{trans("crudbooster.form_back_to_list",['module'=>CRUDBooster::getCurrentModule()->name])}}</a></p>  -->

<div class="panel panel-default">
    <div class="panel-heading">
        <strong><i class="fa fa-gears"></i> Laporan Penjualan</strong>
    </div> 
    <div class="panel-body" style="padding:10px 0px 0px 0px">
        <form class="form-horizontal" method="post" id="form" enctype="multipart/form-data" action="{{CRUDBooster::mainpath('cetakpenjualan')}}" target="_blank">
            <input name="_token" value=" {{ csrf_token() }}" type="hidden">    
                <div class='form-group header-group-0 ' id='form-group-equipment_no' style="">
                    <label class='control-label col-sm-2'>
                       Tanggal Awal
                    </label>
                    <div class="col-sm-3">
                    <div class="input-group ">
                            <span class="input-group-addon open-datetimepicker"><a><i class='fa fa-calendar '></i></a></span>
                            <input type='text' title="Tgl Perolehan" readonly
                                   class='form-control notfocus input_date' name="tgl_awal" id="tgl_awal"
                                   />
                        </div>
                    </div>
                </div>

                <div class='form-group header-group-0 ' id='form-group-equipment_no' style="">
                    <label class='control-label col-sm-2'>
                     s/d  Tanggal Akhir
                    </label>
                    <div class="col-sm-3">
                    <div class="input-group ">
                            <span class="input-group-addon open-datetimepicker"><a><i class='fa fa-calendar '></i></a></span>
                            <input type='text' title="Tgl Perolehan" readonly
                                   class='form-control notfocus input_date' name="tgl_akhir" id="tgl_akhir"
                                   />
                        </div>
                    </div>
                </div>
            </div> <!-- end box -->
            <div class="box-footer" style="background: #F5F5F5">
                <div class="form-group">
                    <label class="control-label col-sm-2"></label>
                    <div class="col-sm-10">
                        <a href='{{CRUDBooster::mainpath()}}' class='btn btn-default'><i
                                class='fa fa-chevron-circle-left'></i> Back</a>
                        <input type="submit" name="action" value='Cetak' class='btn btn-success'>
                       
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
        var lang = 'en';
        $(function () {
            $('.input_date').datepicker({
                format: 'yyyy-mm-dd',
                                language: lang
            });

            $('.open-datetimepicker').click(function () {
                $(this).next('.input_date').datepicker('show');
            });

        });
        
        $(function () {
            $('.year_date').datepicker({
                format: 'yyyy',
                               viewMode    :   "years", 
                               minViewMode: "years"
            });

            
        });

    </script>

@endsection