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
                            <h3 id='item-incoming-process'></h3>
                            <p>Pending Penerimaan</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-stats-bars	"></i>
                        </div>
                        <a href="/admin/goods_receipt" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div>                   
                </div>
            </div>
            <div id="area2" class="col-sm-3 connectedSortable">
                <div id="c7e2bd4aaec72d3f8b27c2d90ec00bf1" class="border-box">
                    <div class="small-box bg-green	">
                        <div class="inner inner-box">
                            <h3 id='item-incoming'></h3>
                            <p>Pernerimaan</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-clipboard	"></i>
                        </div>
                        <a href="/admin/goods_receipt_details43?filter=incoming-month" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>    
            </div>
            <div id="area3" class="col-sm-3 connectedSortable">
                <div id="24ce8e3c8bbb88e78fd076a1b5378b68" class="border-box">
                    <div class="small-box bg-aqua">
                        <div class="inner inner-box">
                            <h3>0</h3>
                            <p>Penjualan</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-ios-gear"></i>
                        </div>
                        <a href="/admin/sales_orders" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <div id="area4" class="col-sm-3 connectedSortable">
                <div id="24ce8e3c8bbb88e78fd076a1b5378b68" class="border-box">
                    <div class="small-box bg-yellow	">
                        <div class="inner inner-box">
                            <h3>0</h3>
                            <p>Pengiriman</p> 
                        </div>
                        <div class="icon">
                            <i class="ion ion-ios-gear"></i>
                        </div>
                         <a href="/admin/sales_orders" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div
                </div>   
            </div>
        </div>
         <!-- Grafik -->
         <div class='statistic-row row'>
            <div id='area5' class="col-sm-12 connectedSortable">
             
                {{--print($data_result)--}}
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Penjualan
                    </div>
                    <div class="panel-body">
                    <ul class="nav nav-pills ranges">
                        <li><a href="#" data-range='1'>1 Hari</a></li>
                        <li><a href="#" data-range='7'>7 Hari</a></li>
                        <li><a href="#" data-range='30'>30 Hari</a></li>
                        <li><a href="#" data-range='60'>60 Hari</a></li>
                        <li><a href="#" data-range='90'>90 Hari</a></li>
                    </ul>
                        <div id="chartContainer-a036a135b772c032058b230e027fd55a" style="height: 250px;"></div>


                        <script type="text/javascript">
                        $(function() {
                                 function requestTotalItems(){
                                      $.ajax({
                                            type: "GET",
                                            url: "{{url('widget/total-items')}}", // This is the URL to the API
                                           
                                        })
                                        .done(function( data ) {
                                       
                                             console.log(data.total_incoming);
                                             $('#item-incoming').html(data.total_incoming);
                                             $('#item-incoming-process').html(data.total_incoming_process);
                                        })
                                        .fail(function() {
                                        // If there is no communication between the server, show an error
                                        alert( "error occured" );
                                        });
                                 }
                                 function requestData(days, chart){
                                        $.ajax({
                                            type: "GET",
                                            url: "{{url('charts/penjualan')}}", // This is the URL to the API
                                            data: { days: days }
                                        })
                                        .done(function( data ) {
                                        // When the response to the AJAX request comes back render the chart with new data
                                        chart.setData(JSON.parse(data));
                                        })
                                        .fail(function() {
                                        // If there is no communication between the server, show an error
                                        alert( "error occured" );
                                        });
                               }
                                var chart = Morris.Bar({
                                    // ID of the element in which to draw the chart.
                                    element: 'chartContainer-a036a135b772c032058b230e027fd55a',
                                    // Set initial data (ideally you would provide an array of default data)
                                    data: [0,0],
                                    xkey: 'date',
                                    ykeys: ['value'],
                                    labels: ['Penjualan']
                                    
                                });

                                requestTotalItems();
                                requestData(7, chart);
                                $('ul.ranges a').click(function(e){
                                    e.preventDefault();
                                    // Get the number of days from the data attribute
                                    var el = $(this);
                                    days = el.attr('data-range');
                                    // Request the data and render the chart using our handy function
                                    requestData(days, chart);
                                    // Make things pretty to show which button/tab the user clicked
                                    el.parent().addClass('active');
                                    el.parent().siblings().removeClass('active');
                                })
                             });
                        </script>

                    </div>
                </div>
            </div>
            <div id='area6' class="col-sm-12 connectedSortable">
                
                {{--print($data_result)--}}
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Barang Terlaris

                    </div>
                    <div class="panel-body">
                        <div id="chart-fast-moving" style="height: 250px;"></div>
                        <script type="text/javascript">
                            $(function() {
                               
                                var chartItemFastMoving = Morris.Donut({
                                    // ID of the element in which to draw the chart.
                                    element: 'chart-fast-moving',
                                 
                                    data: [0,0],
                                    xkey: 'label',
                                    ykeys: ['value'],
                                    labels: ['Item']
                                    
                                });

                                function requestItemFastMoving(){
                                        $.ajax({
                                            type: "GET",
                                            url: "{{url('chart/fast-moving-items')}}"
                                        })
                                        .done(function( data ) {
                                        // When the response to the AJAX request comes back render the chart with new data
                                          chartItemFastMoving.setData(JSON.parse(data));
                                        })
                                        .fail(function() {
                                        // If there is no communication between the server, show an error
                                        alert( "error occured" );
                                        });
                               }
                               requestItemFastMoving();
                            })


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
