@extends('crudbooster::admin_template')
@section('content')

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
</head>
<div class="panel panel-default">
    <div class="panel-heading">
        <strong><i class="fa fa-gears"></i> Laporan Pembelian</strong>
    </div> 
    <div class="panel-body" style="padding:10px 0px 0px 0px">
        <form class="form-horizontal" method="post" id="form" enctype="multipart/form-data" action="{{CRUDBooster::mainpath('cetakpembelian')}}" target="_blank">
             <input name="_token" value=" {{ csrf_token() }}" type="hidden">  
             <div class='form-group header-group-0 ' id='form-group-equipment_no' style="">   
                   <label class='control-label col-sm-2'>
                     Supplier
                    </label>
                    <div class="col-sm-8">
                        <select id="supplier_list" name="supplier_list[]" class="form-control" multiple></select>
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
        $('#supplier_list').select2({
            placeholder: "Pilih Supplier...",
            minimumInputLength: 2,
            ajax: {
                url: '/find-vendor',
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