@extends('crudbooster::admin_template')
@section('content')
 <script src="{{ asset ('vendor/crudbooster/assets/adminlte/plugins/jQuery/jquery-2.2.3.min.js') }}"></script>

 <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css"> 
 <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>

<!-- Bootstrap 3.4.1 JS -->
<script src="{{-- asset ('vendor/crudbooster/assets/adminlte/bootstrap/js/bootstrap.min.js') --}}" type="text/javascript"></script>   
<!-- Main content -->
<section id="content_section" class="content">
    <!-- Your Page Content Here -->
    <div id="modal-statistic" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">�</span></button>
                    <h4 class="modal-title">Modal title</h4>
                </div>
                <div class="modal-body">
                    <p>One fine body�</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn-submit btn btn-primary" data-loading-text="Saving..." autocomplete="off">Save changes</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
   
        <br/>
    <div id="statistic-area">
        <div class="statistic-row row">
            <div id="area1" class="col-sm-3 connectedSortable">
                <div id="a47ac995636050d5a0f97ef5d924dfe7" class="border-box">
                    <div class="small-box bg-red">
                        <div class="inner inner-box">
                            <h3>20</h3>
                            <p>Proses PO</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-stats-bars	"></i>
                        </div>
                        <a href="/tm_project25" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div>                   
                </div>
               
               
            </div>
            <div id="area2" class="col-sm-3 connectedSortable">
                <div id="c7e2bd4aaec72d3f8b27c2d90ec00bf1" class="border-box">
                    <div class="small-box bg-green	">
                        <div class="inner inner-box">
                            <h3>0</h3>
                            <p>Proses Penerimaan</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-clipboard	"></i>
                        </div>
                        <a href="/tr_equipment_request" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>    
            </div>
            <div id="area3" class="col-sm-3 connectedSortable">
                <div id="24ce8e3c8bbb88e78fd076a1b5378b68" class="border-box">
                    <div class="small-box bg-aqua">
                        <div class="inner inner-box">
                            <h3>0</h3>
                            <p>Proses Penjualan</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-ios-gear"></i>
                        </div>
                        <a href="/tm_equipment_maintenance" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <div id="area4" class="col-sm-3 connectedSortable">
                <div id="24ce8e3c8bbb88e78fd076a1b5378b68" class="border-box">
                    <div class="small-box bg-yellow	">
                        <div class="inner inner-box">
                            <h3>0</h3>
                            <p>Proses Delivery</p> 
                        </div>
                        <div class="icon">
                            <i class="ion ion-ios-gear"></i>
                        </div>
                         <a href="/tm_equipment?stnk=1" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div
                </div>   
            </div>
        </div>
         <!-- Grafik -->
         <div class='statistic-row row'>
            <div id='area5' class="col-sm-6 connectedSortable">
             
                {{--print($data_result)--}}
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Penjualan

                    </div>
                    <div class="panel-body">
                        <div id="chartContainer-a036a135b772c032058b230e027fd55a" style="height: 250px;"></div>


                        <script type="text/javascript">
                $(function() {
                new Morris.Bar({
                element: 'chartContainer-a036a135b772c032058b230e027fd55a',
                        data: [
                            { y: 'ACCESSORIES', a: 20, b: 75},
                            { y: 'JACKET', a: 30,  b: 75},
                            { y: 'GLASSES', a: 40,  b: 75},
                            { y: 'FOOTWEAR', a:50,  b: 75}
                          ],
                        xkey: 'y',
                        ykeys: ['a'],
                        gridIntegers: true,
                        labels: ['Jumlah'],
                        resize: true,
                        parseTime: false,
                        behaveLikeLine:true,
                        //barColors:['#e51111', '#5e2590'],
                        hideHover: 'auto'
                });
                }
                )


                        </script>

                    </div>
                </div>
            </div>
            <div id='area6' class="col-sm-6 connectedSortable">
                
                {{--print($data_result)--}}
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Stok Location

                    </div>
                    <div class="panel-body">
                        <div id="donut-example" style="height: 250px;"></div>


                        <script type="text/javascript">
                $(function() {
                    Morris.Donut({
                         element: 'donut-example',
                    data: [
                        {label: "WALLET", value: 12},
                        {label: "TSHIRT", value: 30},
                        {label: "TOTEBAG", value: 20},
                        {label: "SWEATSHIRT", value: 40},
                        {label: "SHIRT", value: 40},
                        {label: "POUCH", value: 40},
                        {label: "PANTS", value: 0},
                        {label: "OUTER", value: 0},
                        {label: "JACKET", value: 0},
                        {label: "GLASSES", value: 40},
                        {label: "FOOTWEAR", value: 3},
                        {label: "CLUTCH", value: 40},
                        {label: "CAP/HAT", value: 2},
                        {label: "ACCESSORIES", value: 10},
  
                    ]
                    });

                 }
                )


                        </script>

                    </div>
                </div>
            </div>
        </div>  
          
         <div class="col-sm-10">
            <body style="margin: 0">
            <div id="map" style="width: 83vw; height:70vh"></div>

             <script type="text/javascript" src='https://maps.googleapis.com/maps/api/js?key={{$google_api_key}}'></script>


            </body>
        </div>

    </div><!--END STATISTIC AREA-->

</section><!-- /.content -->
@endsection
