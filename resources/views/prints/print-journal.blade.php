@extends('crudbooster::admin_template')
@section('content')
<script src="{{ asset ('vendor/crudbooster/assets/adminlte/plugins/jQuery/jquery-2.2.3.min.js') }}"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="{{ asset ('vendor/crudbooster/assets/adminlte/bootstrap/js/bootstrap.min.js') }}" type="text/javascript"></script>
<!-- Your html goes here -->
<!-- <p><a title='Return' href='{{CRUDBooster::mainpath()}}'><i class='fa fa-chevron-circle-left '></i> &nbsp; {{trans("crudbooster.form_back_to_list",['module'=>CRUDBooster::getCurrentModule()->name])}}</a></p>  -->
<style>
#det_billing {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: separate;
  width: 100%;
}

#det_billing td, th {
  border: 1px solid #ddd;
  padding: 8px;
}

#det_billing tr:nth-child(even){background-color: #f2f2f2;}

#det_billing tr:hover {background-color: #ddd;}

#det_billing th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #3a86de;
  color: white;
}
</style>
<div class="panel panel-default">
    <div class="panel-heading">
        <strong><i class="fa fa-edit"></i> Jurnal</strong>

    </div>

    <div class='panel-body'>
        <div class='form-group'>

            <h3>Detail Jurnal</h3>
            <table style="width:100%;border:1px solid black" id="det_billing">
                    <tr>
                        <th>Tanggal</th>
                        <th>Deskripsi</th>
                        <th>Debit</th>
                        <th>Kredit</th>
                        <th>Reference</th>
                    </tr>
                    <tbody>
                            @foreach ($journal as $item)
                             <tr>
                                 <td>{{$item->Date}}</td>
                                 <td>{{$item->DescriptionOrAccountTitle}}</td>
                                 <td>{{$item->AmountDebit}}</td>
                                 <td>{{$item->AmountKredit}}</td>
                                 <td>{{$item->Reference}}</td>
                             </tr>

                            @endforeach
                    </tbody>
            </table>
            </br>

        </div>
    </div>
</div>
@endsection
