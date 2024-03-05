<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laporan Neraca</title>
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
            hr {
                border-style: solid !important;
                border-color: black !important;
                height: 1px;
                border: 1;
            }
            @page {
                size: landscape;
            }
        }
        .vl {
            border-left: 1px solid black;
            height: 500px;
        }
        .mytable{
            font-size: 13px;
        }
    </style>
</head>
<body onload="print()">
    <section>
        <div class="container">
            <div class="row no-gutters">
                <div class="col-12 text-center">
                    <p style="font-size: 18px; margin: 0; padding: 0;">VL Online</p>
                    <h3>Balance Sheet Standard (T)</h3>
                    <p style="font-size: 18px;">
                        As of {{$tgl_data}}
                    </p>
                    <hr>
                </div>
            </div>
            
            <div class="row no-gutters">
                <!-- <div class="col-12"><hr></div> -->
                <div class="col-5">
                    <table class="mytable">
                        <tbody>
                          @foreach ($neraca as $item)
                            <tr>
                                <!-- <td>{{$item->code}}</td> -->
                                <td width="400" class="{{ ($item->padding_left  == '25px' || $item->padding_left  == NULL)? 'font-weight-bold':'' }}" style="padding-left: {{ $item->padding_left }};">{{ $item->account_label }}</td>
                                <td class="{{ ($item->padding_left  == '25px' || $item->padding_left  == NULL)? 'font-weight-bold text-right':'text-right' }}" style="{{ ($item->padding_left  == '25px' || $item->padding_left  == NULL)? 'text-decoration: underline':'' }}">{{ number_format($item->ending_balance,2, ',', '.') }}</td>
                            </tr>
                          @endforeach  
                        </tbody>
                    </table>
                </div>
                <div class="col-1"></div>
                <div class="col-1">
                    <div class="vl"></div>
                </div>
                <div class="col-5">
                    <table class="mytable">
                        <tbody>
                            @foreach ($neraca_right as $item)
                                <tr>
                                    <!-- <td>{{$item->code}}</td> -->
                                    <td width="400" class="{{ ($item->padding_left  == '25px' || $item->padding_left  == NULL)? 'font-weight-bold':'' }}" class="font-weight-bold" style="padding-left: {{ $item->padding_left }};">{{ $item->account_label }}</td>
                                    <td class="{{ ($item->padding_left  == '25px' || $item->padding_left  == NULL)? 'font-weight-bold text-right':'text-right' }}" style="{{ ($item->padding_left  == '25px' || $item->padding_left  == NULL)? 'text-decoration: underline':'' }}">{{ number_format($item->ending_balance,2, ',', '.') }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <hr>
        <div class="row">
            <div class="col-12">
                <table class="table table-borderless">
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
</body>
</html>