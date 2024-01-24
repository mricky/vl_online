<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Purchase Order</title>
    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
      integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
      crossorigin="anonymous"
    />
    <style>
        table.table-bordered{
            border:1px solid black;
        }
        table.table-bordered > thead > tr > th{
            border:1px solid black;
        }
        table.table-bordered > tbody > tr > td{
            border:1px solid black;
        }
        .no-border-left-right{
            border-left-style: hidden;
            border-right-style: hidden;
        }
        .no-border-bottom{
            border-bottom-style: hidden;
        }
    </style>
</head>
<body onload="print()">
    <section>
        <div class="container">
            <div class="row mt-3">
                <div class="col-6"></div>
                <div class="col-6 text-center">
                    <h4>Faktur Retur Pembelian</h4>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-6">
                    <table class="table table-bordered">
                        <tr class="no-border-left-right">
                            <td class="border-0">Kepada:</td>
                        </tr>
                        <tr class="no-border-left-right no-border-bottom">
                            <td style="font-weight: bold;">{{$purchase_order->vendor_name}}</td>
                        </tr>
                        <tr class="no-border-left-right no-border-bottom">
                            <td style="font-weight: bold;">{{$purchase_order->vendor_address}}</td>
                        </tr>
                    </table>
                </div>
                <div class="col-6">
                    <table class="table table-bordered table-sm">
                        <tr>
                            <td style="border-bottom: dotted 3px #000000; border-right: dotted 3px #000000;">
                                Tanggal <br>
                                <strong>{{$purchase_order->order_date}}</strong>    
                            </td>
                            <td style="border-bottom: dotted 3px #000000;">
                                Nomor <br>
                                <strong>{{$purchase_order->order_number}}</strong>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-bottom: dotted 3px #000000; border-right: dotted 3px #000000;">
                                Syarat Pembayaran <br>
                                <strong></strong>
                            </td>
                            <td style="border-bottom: dotted 3px #000000;">
                                FOB <br>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                <thead>
                    <table class="table table-bordered table-sm">
                        <tr>
                            <td style="text-align: center;">Kode Barang</td>
                            <td style="text-align: center;">Nama Barang</td>
                            <td style="text-align: center;">Qty</td>
                            <td style="text-align: center;">@Harga</td>
                            <td style="text-align: center;">Total</td>
                           
                        </tr>
                        <thead>
                        <tbody>
                        <?php $i = 0 ?>
                        @foreach($po_detail as $detail)
                        <?php $i++;?>
                        <tr>
                            <td>{{$detail->product_code}}</td>
                            <td>{{$detail->product_name}}</td>
                            <td>{{$detail->return_qty}}</td>
                            <td  style="text-align:right">{{number_format($detail->price)}}</td>
                            <td  style="text-align:right">{{number_format($detail->subtotal)}}</td>
                        </tr>
                        @endforeach
                        </tbody>
                    </table>
                    <hr>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <table class="table table-bordered">
                        <tr>
                            <td width="20" style="border-left: hidden!important;border-top: hidden!important;border-bottom: hidden!important;">Terbilang:</td>
                            <td>{{penyebut($purchase_order->total). "Rupiah"}}</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-8">
                    <fieldset class="border p-5">
                        <legend class="float-none w-auto" style="font-size: medium;">Keterangan</legend>
                    </fieldset>
                    <table class="table table-borderless mt-3">
                        <tr>
                            <td style="text-align: center;">Disiapkan Oleh</td>
                            <td style="text-align: center;">Disiapkan Oleh</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align: center;">
                                ____________________ <br>
                            </td>
                            <td style="text-align: center;">
                                ____________________ <br>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 100px;">Tgl</td>
                            <td style="padding-left: 100px;">Tgl</td>
                        </tr>
                    </table>
                </div>
                <div class="col-4">
                    <table class="table table-bordered table-sm">
                        <tr>
                            <td>Sub Total</td>
                            <td style="text-align: right;">{{rupiah($purchase_order->subtotal)}}</td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold;">Total</td>
                            <td style="text-align: right; font-weight: bold;">{{rupiah($purchase_order->total)}}</td>
                        </tr>
                        
                    </table>
                </div>
            </div>
        </div>
    </section>
</body>
</html>