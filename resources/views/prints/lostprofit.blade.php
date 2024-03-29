<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laporan Laba Rugi</title>
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
                width: 93%;
                margin-left: 40px;
            }
            hr {
                border-style: solid !important;
                border-color: black !important;
                height: 1px;
                border: 1;
            }
        }
    </style>
</head>
<body>
    <section>
        <div class="container">
            <div class="row mt-3">
                <div class="col-12 text-center">
                    <p style="font-size: 18px; margin: 0; padding: 0;">VL Online</p>
                    <h3>Profit & Loss Standard</h3>
                    <p style="font-size: 18px;">
                        {{$tgl_data}} <br>
                        Main
                    </p>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                    <table class="table table-borderless table-sm">
                        <thead>
                            <th class="text-center"> <hr> </th>
                            <th class="text-center">Description <hr> </th>
                            <th class="text-center">Balance <hr></th>
                        </thead>
                        <tbody>
                            @foreach ($neraca as $item)

                                <tr>
                                    <td>&nbsp;</td>
                                    <td style="padding-left: {{ $item->padding_left }};" class="{{ ($item->is_bold  == 1)? 'font-weight-bold':'' }}">{{ $item->account_label }}</td>
                                    <td class="{{ ($item->is_bold  == 1)? 'font-weight-bold text-right':'text-right' }}" style="{{ ($item->padding_left  == '25px' || $item->padding_left  == NULL)? 'text-decoration: underline':'' }}">{{ number_format($item->ending_balance,2, ',', '.') }}</td>
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
            <div class="col-md-6 text-left">
                {{ date('d F Y H:i:s') }} <br>
                Printed by: Administrator
            </div>
            <div class="col-md-6 text-right">
               Page 1 of 1
            </div>
        </div>
    </footer>
    <!-- <script>
        window.print();
        window.onafterprint = window.close;
    </script> -->
</body>
</html>
