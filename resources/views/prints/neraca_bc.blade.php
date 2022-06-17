
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
table {
  font-family: arial, sans-serif;
 border-collapse: collapse; 
 width:100%; 
 page-break-inside:auto 
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 2px;
}
tr    { page-break-inside:avoid; page-break-after:auto }
    thead { display:table-header-group }
    tfoot { display:table-footer-group }



</style>
<div class="panel panel-default"  >

<div style="padding-top: 5px;
  padding-right: 20px;
  padding-bottom: 30px;
  padding-left: 20px;" >                                                                                                                                
  <div class="page-break">
  <table style="border:none;width:100%;!!important">
    <!-- <tr>
    <td  style="border:none;padding:0px"><img width="15%" 
    src="{{URL::asset('/img/hacaca-logo.png')}}"  alt="Logo" /></td>
    </tr> -->
  <tr>
    <td  style="border:none; background-color:transparent ;padding:1px"> <h6>{{$office->alamat_kantor}}<br/>{{$office->kota}},{{$office->provinsi}},{{$office->kode_pos}}  <br>{{$office->no_telp}} - {{$office->email}} </h6> </td>
  </tr>
  </table>

  <br/>
<table table-border="1" style="align:center;">
<tr>
<td style="border:none;"> <h4 style="text-align: center;"><strong>Neraca</h4>
<h6 style="text-align: center;"><strong>Periode Tanggal : {{$tgl_data}}&nbsp;</strong></h6></td>
</tr>
</table>
</br>

<p style="font-size:8px">Laporan ini dicetak menggunakan Aplikasi/Komputer dan tidak membutuhkan tandatangan basah</p>

