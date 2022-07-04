<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laporan Stok Lot</title>
    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
      integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
      crossorigin="anonymous"
    />
    <style>
        @media print {
            footer {
                position: fixed;
                bottom: 0;
                display: inline-block;
                width: 100%;
            }

            @page {
                size: landscape;
            }
        }
        hr {
            border-style: solid !important;
            border-color: black !important;
            height: 1px;
            border: 1;
        }
        .mytable{
            font-size: 13px;
        }
    </style>
</head>
<body>
    <section>
        <div class="row no-gutters mb-3">
            <div class="col-12 text-center">
                <p style="font-size: 18px; margin: 0; padding: 0;">PROJECT PAUL</p>
                <h4>Laporan Inventory</h4>
            </div>
        </div>
        
        <div class="row no-gutters">
            <!-- <div class="col-12"><hr></div> -->
            <div class="col-12">
                <table class="table table-borderless table-sm mytable">
                    <tbody>
                        <tr>
                            <td class="font-weight-bold" style="border-bottom: 1px solid black">Item Code</td>
                            <td class="font-weight-bold" style="border-bottom: 1px solid black">Item Name</td>
                            <td class="font-weight-bold text-center" style="border-bottom: 1px solid black">Lot Number</td>
                            <td class="font-weight-bold text-center" style="border-bottom: 1px solid black">Qty</td>
                            <td class="font-weight-bold text-center" style="border-bottom: 1px solid black">Price</td>
                            <td class="font-weight-bold text-center" style="border-bottom: 1px solid black">Status</td>
                        </tr>
                        @php
                            $total_qty = 0;
                            $total_price = 0;
                        @endphp
                        @foreach ($products as $item)
                        @php
                           $total_qty += $item->qty_in; 
                           $total_price += $item->price;  
                        @endphp
                            <tr>
                                <td>{{ $item->code }}</td>
                                <td>{{ $item->name }}</td>
                                <td class="text-center">{{ $item->lot_number }}</td>
                                <td class="text-center">{{ $item->qty_in }}</td>
                                <td class="text-center">{{number_format($item->price,0,',','.')}}</td>
                                <td class="text-center">
                                    @if ($item->is_store_vendor_location == 0)
                                        {{ 'Barang di Gudang' }}
                                    @else
                                        {{ 'Barang di Vendor' }}
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                        <tr>
                            <td class="font-weight-bold" colspan="3">Total:</td>
                            <td class="font-weight-bold text-center" style="border-top: 1px solid black">{{ $total_qty}}</td>
                            <td class="font-weight-bold text-center" style="border-top: 1px solid black">{{number_format($total_price,0,',','.')}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <footer>
        <hr>
        <div class="row">
            <div class="col-12">
                <table class="table table-borderless mytable">
                    <tr>
                        <td>
                            {{ date('d F Y H:i:s') }} <br>
                            Printed by: Administrator
                        </td>
                        <td class="text-right">Page 1 of 1</td>
                    </tr>
                </table>
            </div>
        </div>
    </footer>
    <script>
        window.print();
        window.onafterprint = window.close;
    </script>
</body>
</html>