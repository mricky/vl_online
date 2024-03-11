@extends('crudbooster::admin_template')
@section('content')

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
</head>
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
                    <div class="col-sm-8">
                    <div class="input-group ">
                            <span class="input-group-addon open-datetimepicker"><a><i class='fa fa-calendar '></i></a></span>
                            <input type='text' title="Tgl Perolehan" readonly
                                   class='form-control notfocus input_date' name="start_date" id="start_date"
                                   />
                        </div>
                    </div>
            </div>
            <div class='form-group header-group-0 ' id='form-group-equipment_no' style="">
                    <label class='control-label col-sm-2'>
                       Tanggal Akhir
                    </label>
                    <div class="col-sm-8">
                    <div class="input-group ">
                            <span class="input-group-addon open-datetimepicker"><a><i class='fa fa-calendar '></i></a></span>
                            <input type='text' title="Tgl Akhir" readonly
                                   class='form-control notfocus input_date' name="end_date" id="end_date"
                                   />
                        </div>
                    </div>
            </div>
             <div class='form-group header-group-0 ' id='form-group-equipment_no' style="">
                   <label class='control-label col-sm-2'>
                     Customer
                    </label>
                    <div class="col-sm-8">
                        <select id="customer_list" name="customer_list[]" class="form-control" multiple></select>
                    </div>
             </div>
             <div class='form-group header-group-0 ' id='form-group-equipment_no' style="">
                   <label class='control-label col-sm-2'>
                     Kategori
                    </label>
                    <div class="col-sm-8">
                        <select id="category_list" name="category_list[]" class="form-control" multiple></select>
                    </div>
             </div>
            <div class='form-group header-group-0 ' id='form-group-equipment_no' style="">
                    <label class='control-label col-sm-2'>
                       Brand
                    </label>
                    <div class="col-sm-8">
                        <select id="brand_list" name="brand_list[]" class="form-control" multiple></select>
                    </div>
            </div>
            <div class='form-group header-group-0 ' id='form-group-equipment_no' style="">
                    <label class='control-label col-sm-2'>
                       Item
                    </label>
                    <div class="col-sm-8">
                        <select id="item_list" name="item_list[]" class="form-control" multiple></select>
                    </div>
            </div>
             <div class="box-footer" style="background: #F5F5F5">
                <div class="form-group">
                    <label class="control-label col-sm-2"></label>
                    <div class="col-sm-10">
                        <a href='{{CRUDBooster::mainpath()}}' class='btn btn-default'><i
                                class='fa fa-chevron-circle-left'></i> Back</a>
                        <input type="submit" name="action" value='Cetak XLS' class='btn btn-success'>

                    </div>
                </div>
            </div>
      </form>
    </div>
</div>
</div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
    <script>
         var lang = 'en';
         let date = new Date();
            let firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
            let lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);

            let currentMonth = (lastDay.getMonth() + 1);
            currentMonth = ('0' + currentMonth).slice(-2);

            var lastDayWithDash =  lastDay.getFullYear() + '-' + currentMonth + '-' +lastDay.getDate();
         $(function () {
            $('.input_date').datepicker({
                format: 'yyyy-mm-dd',
                                language: lang
            }).datepicker("setDate", firstDay);

            $('.open-datetimepicker').click(function () {
                $(this).next('.input_date').datepicker('show');
            });
            $('#end_date').val(lastDayWithDash);
        });

        $('#customer_list').select2({
            placeholder: "Pilih Customer...",
            minimumInputLength: 2,
            ajax: {
                url: '/find-customer',
                dataType: 'json',
                data: function (params) {
                    return {
                        q: $.trim(params.term)
                    };
                },
                processResults: function (data) {
                    return {
                        results: data
                    };
                },
                cache: true
            }
        });
        $('#item_list').select2({
            placeholder: "Pilih Item...",
            minimumInputLength: 2,
            ajax: {
                url: '/find-product-item',
                dataType: 'json',
                data: function (params) {
                    return {
                        q: $.trim(params.term)
                    };
                },
                processResults: function (data) {
                    return {
                        results: data
                    };
                },
                cache: true
            }
        });

        $('#category_list').select2({
            placeholder: "Pilih Kategori...",
            minimumInputLength: 2,
            ajax: {
                url: '/find-product-category',
                dataType: 'json',
                data: function (params) {
                    return {
                        q: $.trim(params.term)
                    };
                },
                processResults: function (data) {
                    return {
                        results: data
                    };
                },
                cache: true
            }
        });

        $('#brand_list').select2({
            placeholder: "Pilih Brand...",
            minimumInputLength: 2,
            ajax: {
                url: '/find-product-brand',
                dataType: 'json',
                data: function (params) {
                    return {
                        q: $.trim(params.term)
                    };
                },
                processResults: function (data) {
                    return {
                        results: data
                    };
                },
                cache: true
            }
        });
    </script>

@endsection
