<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laporan Stok</title>
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
                <p style="font-size: 18px; margin: 0; padding: 0;">VL Online</p>
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
                            <td class="font-weight-bold text-center" style="border-bottom: 1px solid black">Stok</td>
                            <td class="font-weight-bold text-center" style="border-bottom: 1px solid black">Alokasi Pesanan</td>
                            <td class="font-weight-bold text-center" style="border-bottom: 1px solid black">Jumlah Barang Terima</td>
                            <td class="font-weight-bold text-center" style="border-bottom: 1px solid black">Jumlah Barang Kirim</td>
                            <td class="font-weight-bold text-center" style="border-bottom: 1px solid black">Gudang Internal</td>
                            <td class="font-weight-bold text-center" style="border-bottom: 1px solid black">Gudang Vendor</td>
                        </tr>
                        @php
                            $total_stok = 0;
                            $total_allocated = 0;
                            $total_received = 0;
                            $total_shipped = 0;
                        @endphp
                        @foreach ($products as $item)
                        @php
                           $total_stok += $item->qty_onhand; 
                           $total_allocated += $item->qty_allocated; 
                           $total_received += $item->qty_received; 
                           $total_shipped += $item->qty_shipped; 
                        @endphp
                            <tr>
                                <td>{{ $item->code }}</td>
                                <td>{{ $item->name }}</td>
                                <td class="text-center">{{ $item->qty_onhand }}</td>
                                <td class="text-center">{{ $item->qty_allocated }}</td>
                                <td class="text-center">{{ $item->qty_received }}</td>
                                <td class="text-center">{{ $item->qty_shipped}}</td>
                                <td class="text-center">{{ $item->qty_internal}}</td>
                                <td class="text-center">{{ $item->qty_vendor}}</td>
                            </tr>
                        @endforeach
                        <tr>
                            <td class="font-weight-bold" colspan="2">Total:</td>
                            <td class="font-weight-bold text-center" style="border-top: 1px solid black">{{ $total_stok}}</td>
                            <td class="font-weight-bold text-center" style="border-top: 1px solid black">{{ $total_allocated}}</td>
                            <td class="font-weight-bold text-center" style="border-top: 1px solid black">{{ $total_received}}</td>
                            <td class="font-weight-bold text-center" style="border-top: 1px solid black">{{ $total_shipped}}</td>
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