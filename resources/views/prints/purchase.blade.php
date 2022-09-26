<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laporan Pembelian</title>
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
        <div class="row no-gutters">
            <div class="col-12 text-center">
                <p style="font-size: 18px; margin: 0; padding: 0;">VL Online</p>
                <h4>Laporan Pembelian</h4>
                <p style="font-size: 18px;">
                    {{$tgl_data}} <br>
                    Main
                </p>
            </div>
        </div>
        
        <div class="row no-gutters">
            <!-- <div class="col-12"><hr></div> -->
            <div class="col-12">
                <table class="table table-borderless table-sm mytable">
                    <tbody>
                        <tr>
                            <td class="font-weight-bold" style="border-bottom: 1px solid black">No. Order</td>
                            <td class="font-weight-bold" style="border-bottom: 1px solid black">Supplier</td>
                            <td class="font-weight-bold" style="border-bottom: 1px solid black">Tgl Order</td>
                            <td class="font-weight-bold text-center" style="border-bottom: 1px solid black">Sub Total</td>
                            <td class="font-weight-bold text-center" style="border-bottom: 1px solid black">Discount</td>
                            <td class="font-weight-bold text-center" style="border-bottom: 1px solid black">Total Bayar</td>
                            <td class="font-weight-bold text-center" style="border-bottom: 1px solid black">Total Hutang</td>
                        </tr>
                        @php
                            $total_sub = 0;
                            $total_discount = 0;
                            $total = 0;
                            $total_amount_due = 0;
                        @endphp
                        @foreach ($purchase_orders as $item)
                        @php
                            $total_sub += $item->subtotal; 
                            $total_discount += $item->discount; 
                            $total += $item->total; 
                            $total_amount_due += $item->amount_due; 
                        @endphp
                        <tr>
                            <td>{{ $item->order_number }}</td>
                            <td>{{ $item->name }}</td>
                            <td>{{ $item->order_date }}</td>
                            <td class="text-right">{{ number_format($item->subtotal,2, ',', '.') }}</td>
                            <td class="text-right">{{ number_format(($item->discount),2, ',', '.') }}</td>
                            <td class="text-right">{{ number_format(($item->total),2, ',', '.') }}</td>
                            <td class="text-right">{{ number_format(($item->amount_due),2, ',', '.') }}</td>
                        </tr>
                        @endforeach
                        <tr>
                            <td class="font-weight-bold" colspan="3">Total:</td>
                            <td class="font-weight-bold text-right" style="text-decoration: underline; border-bottom: 1px solid black">{{ number_format(($total_sub),2, ',', '.') }}</td>
                            <td class="font-weight-bold text-right" style="text-decoration: underline; border-bottom: 1px solid black">{{ number_format(($total_discount),2, ',', '.') }}</td>
                            <td class="font-weight-bold text-right" style="text-decoration: underline; border-bottom: 1px solid black">{{ number_format(($total),2, ',', '.') }}</td>
                            <td class="font-weight-bold text-right" style="text-decoration: underline; border-bottom: 1px solid black">{{ number_format(($total_amount_due),2, ',', '.') }}</td>
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