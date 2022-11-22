<html xmlns="http://www.w3.org/1999/xhtml" moznomarginboxes='' mozdisallowselectionprint=''>
    <head>
    </head>
        <link rel="stylesheet" type="text/css" href="{{URL::asset('/css/print.css')}}">
    <body>      
        <table>
        <tr>
                <td colspan="3">                             
                    <p class="text-center">{{$labels->header_row1}}</p>
                    <p class="text-center">{{$labels->header_row2}}</p>
                    <p class="text-center">{{$labels->header_row3}}</p>
                </td>
            </tr>
            <tr>
                <td>Tanggal</td><!--FF:10/35,CHR:19-->
                <td>:</td><!--FF:3-->
                <td class="bolder">{{$transactions->order_date}}</td><!--FF:38-->
            </tr>
            <tr>
                <td>No Order</td><!--FF:10/35,CHR:19-->
                <td>:</td><!--FF:3-->
                <td class="bolder">{{$transactions->order_number}}</td><!--FF:38-->
            </tr>
            <tr>
                <td colspan="3"><hr/></td>
            </tr>
            <tr>
                 <table>
                            <tr>
                                <td colspan="2">ITEMS</td>
                                <td>QTY</td>
                                <td>HARGA</td>
                                <td>TOTAL</td>
                            </tr>
                            <tr>
                                <td colspan="2"><hr/></td><td><hr/></td><td><hr/></td><td><hr/></td>
                            </tr>
                           
                            @foreach($detail_transaction as $item)
                            <tr>
                                    <td colspan="2">{{$item->name}}</td>
                                    <td>{{$item->qty}}</td>
                                    <td>{{number_format($item->price)}}</td>
                                    <td>{{number_format($item->total)}}</td>
                            </tr>
                            @endforeach                   
                 </table>           
                    
            </tr>
            <tr>
                <td colspan="3"><hr/></td>
            </tr>
            <!-- <tr>
                <td colspan="4">
                        <p class="text-right">Jumlah Item : {{$jml}}  </p>  
                <td>
            </tr> -->
            <tr>
                <td colspan="4">
                        <p class="text-right">Total : {{number_format($transactions->subtotal)}}  </p>  
                <td>
            </tr>
            <!-- <tr>
                <td>Kasir</td><td>:</td><td>{{$transactions->name}}</td>
            </tr> -->
            <tr>
                <td colspan="3">                             
                    <p class="text-center">{{$labels->footer_row1}}</p>
                    <p class="text-center">{{$labels->footer_row2}}</p>
                    <p class="text-center">{{$labels->footer_row3}}</p>
                                <!-- <p class="text-center bolder">{{$shipment->departure->outlet_name}}</p>
                                <p class="text-center bolder">{{$shipment->departure->outlet_phone}}</p>
                                <p class="text-center">{{config("core.app_web")}}</p> -->
                </td>
            </tr>
        </table>    
               
        <script>
            setTimeout(function() { window.print();window.close(); }, 1000);
        </script>
    </body>    
</html>