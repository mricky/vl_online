<?php namespace App\Http\Controllers;

use App\Events\OrderEntryEvent;
use App\Repositories\GoodReceiptRepository;
use Session;
use Request;
use DB;
use CRUDBooster;
use App\Repositories\{
	PurchaseOrderRepository,
	JournalTransactionRepository
};
use Maatwebsite\Excel\Facades\Excel;
	class AdminPurchaseOrdersController extends \crocodicstudio\crudbooster\controllers\CBController {

		private $purchaseOrder;
		private $journalTransaction;
		private $goodReceipt;

		public function __construct(PurchaseOrderRepository $purchaseOrder,JournalTransactionRepository $journalTransaction, GoodReceiptRepository $goodReceipt)
        {
       		 $this->purchaseOrder = $purchaseOrder;
			 $this->journalTransaction = $journalTransaction;
			 $this->goodReceipt = $goodReceipt;
        }
	    public function cbInit() {

			# START CONFIGURATION DO NOT REMOVE THIS LINE
			$this->title_field = "id";
			$this->limit = "20";
			$this->orderby = "id,desc";
			$this->global_privilege = false;
			$this->button_table_action = true;
			$this->button_bulk_action = true;
			$this->button_action_style = "button_icon";
			$this->button_add = true;
			$this->button_edit = true;
			$this->button_delete = false;
			$this->button_detail = true;
			$this->button_show = true;
			$this->button_filter = true;
			$this->button_import = false;
			$this->button_export = false;
			$this->table = "purchase_orders";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Supplier","name"=>"vendor_id","join"=>"vendors,name"];
			$this->col[] = ["label"=>"No Order","name"=>"order_number"];
			$this->col[] = ["label"=>"Tgl Order","name"=>"order_date"];
			//$this->col[] = ["label"=>"Tg Pengiriman","name"=>"delivery_date"];
			#$this->col[] = ["label"=>"Barang Pesan","name"=>"(SELECT COALESCE(SUM(purchase_order_details.qty),0) FROM purchase_order_details where purchase_order_details.purchase_order_id = purchase_orders.id) as total_pesan"];
			// $this->col[] = ["label"=>"Barang Terima","name"=>"(SELECT COALESCE(SUM(goods_receipt_details.qty_in),0)
			// 														FROM purchase_order_details
			// 														INNER JOIN goods_receipt on goods_receipt.purchase_order_id = purchase_order_details.purchase_order_id
			// 														INNER JOIN goods_receipt_details on goods_receipt_details.good_receipt_id = goods_receipt.id
			// 														WHERE purchase_order_details.purchase_order_id = purchase_orders.id) as total_terima"];
			$this->col[] = ["label"=>"Total Qty","name"=>"total_qty_request"];
			$this->col[] = ["label"=>"Qty In","name"=>"total_qty_in"];
			$this->col[] = ["label"=>"Leave Over","name"=>"total_qty_difference"];
			# TODO
			// total pesan
			// total terima
			// total selisih
			// pending penerimaan
			$this->col[] = ["label"=>"Subtotal","name"=>"subtotal","callback_php"=>'number_format($row->subtotal)'];
			$this->col[] = ["label"=>"Discount","name"=>"discount","callback_php"=>'number_format($row->discount)'];
			//$this->col[] = ["label"=>"Total","name"=>"total","callback_php"=>'number_format($row->total)'];
			$this->col[] = ["label"=>"Total Bayar","name"=>"total_amount","callback_php"=>'number_format($row->total_amount)'];
			$this->col[] = ["label"=>"Total Hutang","name"=>"amount_due","callback_php"=>'number_format($row->subtotal - $row->total_amount)'];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Supplier','name'=>'vendor_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-5','datatable'=>'vendors,name'];
			$this->form[] = ['label'=>'No Order','name'=>'order_number','type'=>'text','validation'=>'nullable|min:1|max:255','width'=>'col-sm-5','readonly'=>true];
			$this->form[] = ['label'=>'Tgl Order','name'=>'order_date','type'=>'date','validation'=>'required|date','width'=>'col-sm-5'];
			$this->form[] = ['label'=>'Tgl Estimasi','name'=>'estimated_date','type'=>'date','validation'=>'nullable|date','width'=>'col-sm-5'];
			//$this->form[] = ['label'=>'Tgl Kirim','name'=>'delivery_date','type'=>'date','validation'=>'required|date','width'=>'col-sm-10'];
			#$this->form[] = ['label'=>'Mata Uang','name'=>'currency_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-5','datatable'=>'currencies,currency'];
			$this->form[] = ['label'=>'Keterangan','name'=>'description','type'=>'text','validation'=>'nullable|min:1|max:255','width'=>'col-sm-5'];

			$columns = [];
			$columns[] = ['label'=>'Produk','name'=>'product_id','type'=>'select','validation'=>'required|integer|min:0','width'=>'col-sm-5','datatable'=>'products,name','datatable_format'=>"id,' - ',name"];

			$columns[] = ["label"=>"Qty","name"=>"qty",'type'=>'number'];
			$columns[] = ["label"=>"Harga","name"=>"price",'type'=>'number'];
			$columns[] = ["label"=>"Subtotal","name"=>"subtotal",'type'=>'number',"readonly"=>true,'formula'=>"[qty] * [price]"];
			$columns[] = ["label"=>"DP","name"=>"downpayment",'type'=>'number'];
			$columns[] = ["label"=>"Pelunasan","name"=>"paid_off",'type'=>'number'];
			$columns[] = ["label"=>"Sisa","name"=>"total",'type'=>'number',"readonly"=>true,'formula'=>"[qty] * [price] - [downpayment] - [paid_off]"];
			//$this->form[] = ['label'=>'Orders Detail','name'=>'tr_order_detail','type'=>'child','columns'=>$columns,'width'=>'col-sm-1','table'=>'tr_order_detail','foreign_key'=>'order_id'];
			//$this->form[] = ['label'=>'Orders Detail','name'=>'purchase_order_details','type'=>'child','columns'=>$columns,'width'=>'col-sm-1','table'=>'or','foreign_key'=>'purchase_order_id'];
			$this->form[] = ['label'=>'Orders Detail','name'=>'purchase_order_details','type'=>'child','columns'=>$columns,'width'=>'col-sm-1','table'=>'purchase_order_details','foreign_key'=>'purchase_order_id'];
			$this->form[] = ['label'=>'Subtotal','name'=>'subtotal','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-5',"readonly"=>true];
			$this->form[] = ['label'=>'Discount','name'=>'discount','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-5',"readonly"=>true];
			$this->form[] = ['label'=>'Total Order','name'=>'total','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-5',"readonly"=>true];
			$this->form[] = ['label'=>'Total Bayar','name'=>'total_amount','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-5',"readonly"=>true];
			$this->form[] = ['label'=>'Total Hutang','name'=>'amount_due','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-5',"readonly"=>true];
			# END FORM DO NOT REMOVE THIS LINE

			# OLD START FORM
			//$this->form = [];
			//$this->form[] = ["label"=>"Vendor Id","name"=>"vendor_id","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"vendor,id"];
			//$this->form[] = ["label"=>"Order Number","name"=>"order_number","type"=>"text","required"=>TRUE,"validation"=>"required|min:1|max:255"];
			//$this->form[] = ["label"=>"Order Date","name"=>"order_date","type"=>"date","required"=>TRUE,"validation"=>"required|date"];
			//$this->form[] = ["label"=>"Delivery Date","name"=>"delivery_date","type"=>"date","required"=>TRUE,"validation"=>"required|date"];
			//$this->form[] = ["label"=>"Order Status Id","name"=>"order_status_id","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"order_status,id"];
			//$this->form[] = ["label"=>"Subtotal","name"=>"subtotal","type"=>"money","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"Discount","name"=>"discount","type"=>"money","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"Total","name"=>"total","type"=>"money","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"Description","name"=>"description","type"=>"text","required"=>TRUE,"validation"=>"required|min:1|max:255"];
			//$this->form[] = ["label"=>"Created By","name"=>"created_by","type"=>"text","required"=>TRUE,"validation"=>"required|min:1|max:255"];
			# OLD END FORM

			/*
	        | ----------------------------------------------------------------------
	        | Sub Module
	        | ----------------------------------------------------------------------
			| @label          = Label of action
			| @path           = Path of sub module
			| @foreign_key 	  = foreign key of sub table/module
			| @button_color   = Bootstrap Class (primary,success,warning,danger)
			| @button_icon    = Font Awesome Class
			| @parent_columns = Sparate with comma, e.g : name,created_at
	        |
	        */
	        $this->sub_module = array();
                $this->sub_module[] = ['label'=>'Pembayaran','path'=>'account_payable','parent_columns'=>'id,order_date,order_number,total,total_amount,description','parent_columns_alias'=>'ID,Tanggal,Order Number,Total Order,Total Bayar,Keterangan','foreign_key'=>'purchase_id','button_color'=>'warning','button_icon'=>'fa fa-money'];
                #$this->sub_module[] = ['label'=>'Jurnal','path'=>'journal_transactions','parent_columns'=>'id,transaction_date,transaction_number,total_debit,total_credit','foreign_key'=>'ref_id','button_color'=>'warning','button_icon'=>'fa fa-money'];

	        /*
	        | ----------------------------------------------------------------------
	        | Add More Action Button / Menu
	        | ----------------------------------------------------------------------
	        | @label       = Label of action
	        | @url         = Target URL, you can use field alias. e.g : [id], [name], [title], etc
	        | @icon        = Font awesome class icon. e.g : fa fa-bars
	        | @color 	   = Default is primary. (primary, warning, succecss, info)
	        | @showIf 	   = If condition when action show. Use field alias. e.g : [id] == 1
	        |
	        */
            $this->addaction[] = ['label'=>'Jurnal','icon'=>'fa fa-history','color'=>'primary','url'=>CRUDBooster::mainpath('jurnal').'/[id]','title'=>'Jurnal','target'=>'_blank'];
			$this->addaction[] = ['label'=>'Riwayat','icon'=>'fa fa-history','color'=>'primary','url'=>CRUDBooster::mainpath('history').'/[id]','title'=>'Cetak','target'=>'_blank'];
	        $this->addaction[] = ['label'=>'Faktur','icon'=>'fa fa-print','color'=>'primary','url'=>CRUDBooster::mainpath('print').'/[id]','title'=>'Cetak','target'=>'_blank'];



	        /*
	        | ----------------------------------------------------------------------
	        | Add More Button Selected
	        | ----------------------------------------------------------------------
	        | @label       = Label of action
	        | @icon 	   = Icon from fontawesome
	        | @name 	   = Name of button
	        | Then about the action, you should code at actionButtonSelected method
	        |
	        */
	        $this->button_selected = array();


	        /*
	        | ----------------------------------------------------------------------
	        | Add alert message to this module at overheader
	        | ----------------------------------------------------------------------
	        | @message = Text of message
	        | @type    = warning,success,danger,info
	        |
	        */
	        $this->alert        = array();



	        /*
	        | ----------------------------------------------------------------------
	        | Add more button to header button
	        | ----------------------------------------------------------------------
	        | @label = Name of button
	        | @url   = URL Target
	        | @icon  = Icon from Awesome.
	        |
	        */
	        $this->index_button = array();



	        /*
	        | ----------------------------------------------------------------------
	        | Customize Table Row Color
	        | ----------------------------------------------------------------------
	        | @condition = If condition. You may use field alias. E.g : [id] == 1
	        | @color = Default is none. You can use bootstrap success,info,warning,danger,primary.
	        |
	        */
	        $this->table_row_color = array();


	        /*
	        | ----------------------------------------------------------------------
	        | You may use this bellow array to add statistic at dashboard
	        | ----------------------------------------------------------------------
	        | @label, @count, @icon, @color
	        |
	        */

	        //$this->index_statistic = array();
			$this->index_statistic[] = ['label'=>'Total Order','count'=>$this->purchaseOrder->getTotalOrder(),'icon'=>'fa fa-file-text','color'=>'warning'];
			$this->index_statistic[] = ['label'=>'Total Order (Rp)','count'=>number_format($this->purchaseOrder->getTotalOrderRp()),'icon'=>'fa fa-file-text','color'=>'danger'];
			$this->index_statistic[] = ['label'=>'Total Hutang (Rp)','count'=>number_format($this->purchaseOrder->getTotalHutangRp()),'icon'=>'fa fa-file-text','color'=>'success'];
			//$this->index_statistic[] = ['label'=>'POD','count'=>0,'icon'=>'fa fa-check','color'=>'success'];




	        /*
	        | ----------------------------------------------------------------------
	        | Add javascript at body
	        | ----------------------------------------------------------------------
	        | javascript code in the variable
	        | $this->script_js = "function() { ... }";
	        |
	        */

			//$this->script_js;
	        // $this->script_js = "
			// 	let qty = $('#ordersdetailqty');
			// 	let price = $('#ordersdetailprice');
			// 	let subtotal = $('#ordersdetailsubtotal');
			// 	let downpayment = $('#ordersdetaildownpayment');
			// 	let paidOff = $('#ordersdetailpaid_off');
			// 	let total = $('#ordersdetailtotal');


			// 	qty.val(0);
			// 	price.val(0);
			// 	subtotal.val(0);
			// 	downpayment.val(0);
			// 	paidOff.val(0);
			// 	total.val(0);

			// 	let sub = 0;
			// 	price.change(function() {

			// 		sub = parseInt(qty.val()) * parseInt($(this).val());
			// 		subtotal.val(sub);
			// 		total.val(sub);
			// 	});


			// ";
			$this->script_js = "
				$(function(){
                    let date = new Date();
                    let currentMonth = (date.getMonth() + 1);
                    currentMonth = ('0' + currentMonth).slice(-2);

                    var lastDayWithDash =  date.getFullYear() + '-' + currentMonth + '-' +date.getDate();
                    $('#estimated_date').val(lastDayWithDash);
                    $('#order_date').val(lastDayWithDash);

					setInterval(function(){
							var subTotal = 0;
							var total = 0;
							var dp = 0;
							var paid_off = 0;
							var discount = 0;
							var totalAmount = 0;

							$('#table-ordersdetail tbody .subtotal').each(function(){
								var sub = parseInt($(this).text());
								subTotal += sub;

							});

							$('#table-ordersdetail tbody .downpayment').each(function(){
								var sub = parseInt($(this).text());
								dp += sub;

							});

							$('#table-ordersdetail tbody .paid_off').each(function(){
								var sub = parseInt($(this).text());
								paid_off += sub;
								console.log(paid_off)
							});

							$('#table-ordersdetail tbody .total').each(function(){
								var sub = parseInt($(this).text());
								total += sub;

							});

							totalAmount = parseInt(dp) + parseInt(paid_off);
							//alert(totalAmount);
							//console.log('test test');

							$('#total_amount').val(totalAmount);
							$('#subtotal').val(subTotal);
							$('#total').val(subTotal);
							$('#amount_due').val(total);

					},500);
			    });

				// $('#discount').change(function(){
				// 	//$('#total').val( parseInt($('#subtotal').val()) - parseInt($(this).val()));
				// 	console.log('test');
				// });
			";

            /*
	        | ----------------------------------------------------------------------
	        | Include HTML Code before index table
	        | ----------------------------------------------------------------------
	        | html code to display it before index table
	        | $this->pre_index_html = "<p>test</p>";
	        |
	        */
	        $this->pre_index_html = null;



	        /*
	        | ----------------------------------------------------------------------
	        | Include HTML Code after index table
	        | ----------------------------------------------------------------------
	        | html code to display it after index table
	        | $this->post_index_html = "<p>test</p>";
	        |
	        */
	        $this->post_index_html = null;



	        /*
	        | ----------------------------------------------------------------------
	        | Include Javascript File
	        | ----------------------------------------------------------------------
	        | URL of your javascript each array
	        | $this->load_js[] = asset("myfile.js");
	        |
	        */
			$this->load_js[] = asset("js/purchase.js");



	        /*
	        | ----------------------------------------------------------------------
	        | Add css style at body
	        | ----------------------------------------------------------------------
	        | css code in the variable
	        | $this->style_css = ".style{....}";
	        |
	        */
	        $this->style_css = NULL;



	        /*
	        | ----------------------------------------------------------------------
	        | Include css File
	        | ----------------------------------------------------------------------
	        | URL of your css each array
	        | $this->load_css[] = asset("myfile.css");
	        |
	        */
	        $this->load_css = array();


	    }


	    /*
	    | ----------------------------------------------------------------------
	    | Hook for button selected
	    | ----------------------------------------------------------------------
	    | @id_selected = the id selected
	    | @button_name = the name of button
	    |
	    */
	    public function actionButtonSelected($id_selected,$button_name) {
	        //Your code here

	    }


	    /*
	    | ----------------------------------------------------------------------
	    | Hook for manipulate query of index result
	    | ----------------------------------------------------------------------
	    | @query = current sql query
	    |
	    */
	    public function hook_query_index(&$query) {
	        //Your code here

	    }

	    /*
	    | ----------------------------------------------------------------------
	    | Hook for manipulate row of index table html
	    | ----------------------------------------------------------------------
	    |
	    */
	    public function hook_row_index($column_index,&$column_value) {
	    	//Your code here
	    }

	    /*
	    | ----------------------------------------------------------------------
	    | Hook for manipulate data input before add data is execute
	    | ----------------------------------------------------------------------
	    | @arr
	    |
	    */
	    public function hook_before_add(&$postdata) {
			if (!Request::get('order_date')){
				CRUDBooster::redirect(CRUDBooster::mainpath("add"),"Silahkan Isi Tanggal Order","info");
			}

	        //Your code here
			$code = 'PO-';
			$supplier = DB::table('vendors')->where('id',$postdata['vendor_id'])->first()->code;
		    $sq = DB::table('purchase_orders')->max('id');
			$year = substr(date("y"),-2);
			$month = date("m");
			$no = str_pad($sq+1,4,"0",STR_PAD_LEFT);
			$postdata['order_number'] = $code.$supplier.$year.$month.$no;
			$postdata['order_status_id'] = 1;
			$postdata['created_by'] = CRUDBooster::myId();

		}
	    /*
	    | ----------------------------------------------------------------------
	    | Hook for execute command after add public static function called
	    | ----------------------------------------------------------------------
	    | @id = last insert id
	    |
	    */
	    public function hook_after_add($id) {
	        //Your code here
			$purchase = DB::table('purchase_orders')->where('id',$id)->first();

            #TODO Insert to table Payable
            $this->purchaseOrder->entryPayable($id);

			event(new OrderEntryEvent($purchase));
	    }

	    /*
	    | ----------------------------------------------------------------------
	    | Hook for manipulate data input before update data is execute
	    | ----------------------------------------------------------------------
	    | @postdata = input post data
	    | @id       = current id
	    |
	    */
	    public function hook_before_edit(&$postdata,$id) {
	        //Your code here
			$purchase = DB::table('purchase_orders')->where('id',$id)->first();

			$data = [
				'id' => $purchase->id,
				'order_number' => $purchase->order_number,
				'total_amount' => $postdata['total_amount'],
				'module' => 'purchase',
			];

			//$this->journalTransaction->updatePurchaseJournalEntry((object)$data);

		}

	    /*
	    | ----------------------------------------------------------------------
	    | Hook for execute command after edit public static function called
	    | ----------------------------------------------------------------------
	    | @id       = current id
	    |
	    */
	    public function hook_after_edit($id) {
	        //Your code here
			$this->goodReceipt->syncPurchaseItemQty($id);
	    }

	    /*
	    | ----------------------------------------------------------------------
	    | Hook for execute command before delete public static function called
	    | ----------------------------------------------------------------------
	    | @id       = current id
	    |
	    */
	    public function hook_before_delete($id) {
	        //Your code here
			$purchase = DB::table('purchase_orders')->where('id',$id)->first();

			$data = [
				'id' => $purchase->id,
				'order_number' => $purchase->order_number,
				'total_amount' => $purchase->total_amount,
				'module' => 'purchase',
			];
			//$this->journalTransaction->deletePurchaseJournalEntry((object)$data);
	    }

	    /*
	    | ----------------------------------------------------------------------
	    | Hook for execute command after delete public static function called
	    | ----------------------------------------------------------------------
	    | @id       = current id
	    |
	    */
	    public function hook_after_delete($id) {
	        //Your code here

	    }


		public function getPrint($id){
			if(!CRUDBooster::isRead() && $this->global_privilege==FALSE || $this->button_add==FALSE) {
				CRUDBooster::redirect(CRUDBooster::adminPath(),trans("crudbooster.denied_access"));
			  }

			$data = [];
			$data['page_title'] = 'Sales Order';

			$data['purchase_order'] = $this->purchaseOrder->getPurchaseOrder($id);

			$data['po_detail'] =  $this->purchaseOrder->getDetailPurchaseOrder($id);

			//
			$data['print'] = (object)[
				'print_at' => date('Y-m-d H:i:s'),
				'print_by' => CRUDBooster::me()
			];
			//dd($data);
			$this->cbView('prints.purchase_order',$data);

		}

		public function getFormPurchase(){
			if(!CRUDBooster::isView()) CRUDBooster::redirect(CRUDBooster::adminPath(),trans('crudbooster.denied_access'));
			//Create your own query
			$data = [];
			$data['title'] ='Laporan Pembelian';

			#$this->cbView('forms.purchase',$data); list pembelian
			$this->cbView('forms.purchase_new',$data);

		}

		#OLD METHOD
		// public function postCetakpembelian()
		// {
		// 	$data['tgl_data']=date('d-M-Y',strtotime($_POST['tgl_awal']) )." s/d ". date('d-M-Y',strtotime($_POST['tgl_akhir']));

		// 	$data['purchase_orders'] = DB::table('purchase_orders as t1')
		// 											->select('t1.*','t2.name')
		// 											->leftJoin('vendors as t2','t1.vendor_id','=','t2.id')
		// 											->get();

		// 	$this->cbView('prints.purchase',$data);
		// }

		public function postCetakpembelian(){

			$vendor = Request::get('supplier_list');
			$category = Request::get('category_list');
			$brand = Request::get('brand_list');
			$item = Request::get('item_list');
			$start_date = Request::get('start_date');
			$end_date = Request::get('end_date');

			$purchase = DB::table('purchase_orders as t1')
						->select('t1.*','t2.name','t5.id as product_id','t5.name as product_name','t6.name as category_name','t7.name as brand_name')
						->leftJoin('vendors as t2','t1.vendor_id','=','t2.id')
						->join('purchase_order_details as t4','t1.id','=','t4.purchase_order_id')
						->join('products as t5','t4.product_id','t5.id')
						->join('product_categories as t6','t6.id','t5.category_id')
						->join('product_brands as t7','t5.brand_id','t7.id')
						->leftjoin('goods_receipt as t8','t8.purchase_order_id','t4.id');
			$purchase = $purchase->when($vendor, function($purchase) use ($vendor){
				return $purchase->whereIn('t2.id',$vendor);
			});
			$purchase = $purchase->when($category, function($purchase) use ($category){
				return $purchase->whereIn('t6.id',$category);
			});
			$purchase = $purchase->when($brand, function($purchase) use ($brand){
				return $purchase->whereIn('t7.id',$brand);
			});
			$purchase = $purchase->when($item, function($purchase) use ($item){
				return $purchase->whereIn('t5.id',$item);
			});

			if(isset($start_date) && isset($end_date)){
				$purchase = $purchase->whereRaw("DATE_FORMAT(t1.order_date, '%Y-%m-%d') >= '" . $start_date . "' AND DATE_FORMAT(t1.order_date, '%Y-%m-%d') <= '" . $end_date . "'");
			}

			$purchase = $purchase->get();

			$data['page_title'] = 'Laporan Pembelian Barang';

			$datas = Array();
			$no=1;
			if($purchase) {
				foreach($purchase as $item){
					$item_request = DB::table('purchase_order_details')->where('product_id',$item->product_id)
																	  ->where('purchase_order_id',$item->id)->sum('qty');
					$incoming_qty = DB::table('goods_receipt_details')->where('product_id',$item->product_id)
																->where('goods_receipt.purchase_order_id',$item->id)
																->join('goods_receipt','goods_receipt.id','goods_receipt_details.good_receipt_id')
																->select(DB::raw('COALESCE(sum(qty_in),0) as incoming_qty'),DB::raw('COALESCE(sum(qty_diferrence),0) as qty_diferrence'))
																->first();
					$left_over = (int)$item_request - (int)$incoming_qty->incoming_qty;
					#dd($incoming_qty);
					$data_raw = array(
						$no,
						$item->order_number,
						$item->name,
						$item->order_date,
						$item->category_name,
						$item->brand_name,
						$item->product_name,
						$item_request,
						$incoming_qty->incoming_qty,
						$left_over,
						$item->subtotal,
						$item->discount,
						$item->total,
						$item->total_amount,
						$item->amount_due
					);
					array_push($datas,$data_raw);
					$no++;
				}
			}
			Excel::create("Laporan Pembelian Barang", function($excel) use($datas) {
				$excel->sheet('Pembelian Barang', function($sheet) use($datas) {
					$judul=['Laporan Pembelian Barang'];
					$sheet->appendRow($judul);
					$sheet->row($sheet->getHighestRow(), function ($row) {
						$row->setFontSize(14);
						$row->setFontWeight('bold');
					});
					$sheet->mergeCells('A1:N1');

					// Columns
					$labels = ['No','No. Order','Supplier','Tgl Order','Kategori','Brand','Item','Total Pesan','Incoming Qty','Left Over','Sub Total', 'Discount','Total','Pelunasan','Sisa'];

					$sheet->appendRow($labels);
					$sheet->row($sheet->getHighestRow(), function ($row) {
						$row->setFontWeight('bold');
					});

					foreach ($datas as $data) {
						$sheet->appendRow($data);
					}
				});
			})->export('xlsx');

		}

        public function getJurnal($id){

            $journal = $this->journalTransaction->printJurnal($id,1);

            $data = [];

            $data['journal'] = $journal;

            $this->cbView('prints/print-journal',$data);

        }
		public function getHistory($id){
			$data = [];
			$data['purchase_order'] = $this->purchaseOrder->getPurchaseOrder($id);
			$data['detail_purchase'] = $this->purchaseOrder->getDetailPurchaseOrder($id);
			$data['detail_receipt'] = $this->goodReceipt->getDetailItemReceiptByPO($id);

			$this->cbView('forms/purchase_detail',$data);
		}

	}
