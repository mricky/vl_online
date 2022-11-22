@extends('crudbooster::admin_template')
@section('content')
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="{{URL::asset('/css/order-schedule-tansport.css')}}"> -->
<style>
  .about_box {
  z-index: 5;
  width: 100%;
  height: 150px;
  position: relative;
  background: #0099ae;
  overflow: hidden;
}

#about_small {
  z-index: 7;
  position: relative;
  top: 0;
  left: 0;
  color: #f7f7f7;
  padding: 20px;
}

#about_big {
  z-index: 6;
  font-family: Arial;
  font-size: 120px;
  color: rgba(255, 255, 255, 0.5);
  overflow: hidden;
  padding: 0;
  margin: 0;
  bottom: 0;
  right: 0;
  position: absolute;
}
</style>
<body>

 <!-- Container Item & Resume Penjualan -->
 <div class="row">
 <div class="col-sm-12">
 <div class="about_box">

<div id="about_small">
 Total
</div>
<div id="about_big">
  Rp. 0
</div>

</div>
<br>
 </div>
    <div class="col-sm-7">
    <div class="panel panel-default">
         <div class="panel-heading">
                <strong><i class="fa fa-calendar"></i> Item</strong>
                <div class="panel-title pull-right"></div>
        </div> 
        <div class="panel-body" style="padding:10px 0px 0px 10px">
            <div class=row>
                    <div class="col-sm-2">
                         <button type="button" class="btn btn-primary btn-sm all-btn" id="all-btn">SEMUA</button>          
                    </div>
                
                    <div class="col-sm-2">
                         <button type="button" class="btn btn-danger btn-sm craft-btn" id="craft-btn">CRAFT</button>           
                    </div>
                    <div class="col-sm-2">
                    <button type="button" class="btn btn-warning btn-sm fashion-btn" id="fashion-btn">FASHION</button>              
                    </div>
                    <div class="col-sm-2">
                    <button type="button" class="btn btn-warning btn-sm fnb-btn" id="fnb-btn">F&B</button>              
                    </div>
                
             </div>
             <br>
             <div class="row">
                    <div style="max-width:800ppx; margin-left:10px">
                    <i class="fa fa-qrcode" aria-hidden="true"></i>
                     <input type="text" name="serach" id="serach" placeholder="Cari Item "style="width: 500px;" />
                    </div>
             </div>
             <br>
             <table class="table table-condensed" id="table-items">
                 <thead>
                     <tr>  
                        <td>Item</td><td style="visibility:hidden">Harga</td></td><td>Harga</td><td>Lokasi</td><td>Pilih</td>    
                     </tr>
                  </thead>
                        <tbody>
                        @if(empty($items))
                            <p class="bg-danger text-white p-1">product</p>
                        @else
                        @foreach($items as $item)
                            <tr>
                                 <td style="display: none;">{{$item['id']}}</td>
                                 <td>{{$item['name']}}</td>
                                 <td style="visibility:hidden">{{$item['product_price']}}</td>
                                 <td>{{$item['product_price_format']}}</td>
                                 <td>{{$item['wh_location_name']}}</td>
                                 <td style="text-align: center"><a id="" href="javascript:void(0)"><i data-id="{{$item->name}}" class="fa fa-check check"></i></a></td>
                            </tr>
                         @endforeach
                    
                        @endif
                        </tbody>      
                 </table>
                 <input type="hidden" name="hidden_page" id="hidden_page" value="1" />
                      <input type="hidden" name="hidden_column_name" id="hidden_column_name" value="guid" />
                      <input type="hidden" name="hidden_sort_type" id="hidden_sort_type" value="asc" />
        </div>
        <!-- <div class="panel-footer">
                <button type="button" class="btn btn-primary btn-sm schedule-btn">Schedule</button>
                 <button type="button" class="btn btn-warning btn-sm spj-btn">SPJ</button>
        </div>          -->
        </div>            
    </div>
    <div class="col-sm-5">
            <div class="panel panel-default">
                    <div class="panel-heading">
                        <strong><i class="fa fa-tag"></i> Daftar Order</strong>
                    </div> 
                    <div class="panel-body" style="padding:10px 0px 0px 10px">
                            <div class=row>
                                    <div class="col-sm-5">
                                        <label>Tanggal</label>            
                                    </div>
                                    <div class="col-sm-5">
                                        <label>{{$current}}</label>            
                                    </div>  
                            </div>
                            <div class=row>
                                    <div class="col-sm-5">
                                        <label>Nama</label>            
                                    </div>
                                    <div class="col-sm-5">
                                        <label id="order-customer"></label>            
                                    </div>  
                            </div>
                            <br>
                            <table class="table table-condensed" id="table-cart-order">
                            <thead>
                                <tr>
                                    <!-- <td>Item</td><td>Qty</td><td>Harga</td> -->
                                </tr>
                            </thead>
                            <tbody>
                    
                            </tbody>
                            
                        </table>
                        <div class=row>
                                    <div class="col-sm-5">
                                        <label>Sub Total</label>            
                                    </div>
                                    <div class="col-sm-5">
                                        <label id="subtotal"></label>            
                                    </div>  
                            </div>
                            <div class=row>
                                    <div class="col-sm-5">
                                        <label id="discount">Diskon</label>            
                                    </div>
                                    <div class="col-sm-5">
                                        <label>0</label>            
                                    </div>  
                            </div>
                            <div class=row>
                                    <div class="col-sm-5">
                                        <label>Total</label>            
                                    </div>
                                    <div class="col-sm-5">
                                     <label id="total"></label>            
                                    </div>  
                            </div>
                    </div>
                       
                    <div class="panel-footer">
                            <button type="button" class="btn btn-primary btn-sm" id="cash-btn">Cash</button>
                            <button type="button" class="btn btn-warning btn-sm" id="edc-btn">EDC</button>
                            <!-- <button type="button" class="btn btn-danger btn-sm" id="cancel-btn">Batal</button> -->
                            <!-- <button type="button" class="btn btn-warning btn-sm spj-btn">SPJ</button> -->
                     </div>   
            </div>  
             
        </div>

    </div>
 </div>
</body>
<script src="{{URL::asset('/js/transaction.js')}}"> 
@endsection