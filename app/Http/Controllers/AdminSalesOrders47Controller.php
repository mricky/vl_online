<?php namespace App\Http\Controllers;


use App\Events\SalesEntryEvent;
use App\Models\ProductLocation;
use Session;
use Request;
use DB;
use CRUDBooster;
use App\Repositories\JournalTransactionRepository;
use App\Repositories\{
		SalesOrderRepository,
		ProductRepository
};
use Carbon\Carbon;
use GuzzleHttp\Psr7\Request as Psr7Request;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Str;

class AdminSalesOrders47Controller extends \crocodicstudio\crudbooster\controllers\CBController {

		private $journalTransaction;
		private $salesOrder;
		private $productRepository;
		public function __construct(SalesOrderRepository $salesOrder,JournalTransactionRepository $journalTransaction, ProductRepository $productRepository) 
        {
			 $this->salesOrder = $salesOrder;
			 $this->journalTransaction = $journalTransaction;
			 $this->productRepository = $productRepository;
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
			$this->button_add = false;
			$this->button_edit = false;
			$this->button_delete = true;
			$this->button_detail = true;
			$this->button_show = true;
			$this->button_filter = true;
			$this->button_import = false;
			$this->button_export = false;
			$this->table = "sales_orders";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			
			$this->col[] = ["label"=>"No Order","name"=>"order_number"];
			$this->col[] = ["label"=>"Tgl Order","name"=>"order_date"];
			$this->col[] = ["label"=>"Subtotal","name"=>"subtotal","callback_php"=>'number_format($row->subtotal)'];
			$this->col[] = ["label"=>"Discount","name"=>"discount","callback_php"=>'number_format($row->discount)'];
			$this->col[] = ["label"=>"Total","name"=>"total","callback_php"=>'number_format($row->total)'];
			$this->col[] = ["label"=>"Bayar","name"=>"total_amount","callback_php"=>'number_format($row->total_amount)'];
			#$this->col[] = ["label"=>"Status","name"=>"delivery_order","callback_php"=>'($row->delivery_order==0)?"<span class=\"label label-default\">PROSES</span>":"<span class=\"label label-danger\">DELIVERY</span>"'];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Pelanggan','name'=>'customer_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-5','datatable'=>'customers,name'];
			$this->form[] = ['label'=>'Tgl Order','name'=>'order_date','type'=>'date','validation'=>'required|date','width'=>'col-sm-5'];
			$this->form[] = ['label'=>'Expedisi','name'=>'expedition_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-5','datatable'=>'expeditions,name'];
			$this->form[] = ['label'=>'Keterangan','name'=>'description','type'=>'text','validation'=>'nullable|min:1|max:255','width'=>'col-sm-5'];
			$columns = [];
			$columns[] = ['label'=>'Produk','name'=>'product_id','type'=>'select','required'=>true,'width'=>'col-sm-5','datatable'=>'view_product,product_name'];
			$columns[] = ['label'=>'Lokasi Produk','name'=>'product_location_id','type'=>'select','required'=>true,'width'=>'col-sm-5','datatable'=>'view_product_location,product_location','parent_select'=>'product_id'];
			// sample more than 1
			//$columns[] = ['label'=>'Product','name'=>'product_id','type'=>'select2','datatable'=>'products,name','datatable_format'=>"id,' - ',name"];
			//$columns[] = ['label'=>'Product Lot','name'=>'product_item_id','type'=>'select','validation'=>'required|integer|min:0','width'=>'col-sm-5','datatable'=>'product_items,lot_number','parent_select'=>'product_id','datatable_where'=>'lot_number is not null'];
			$columns[] = ["label"=>"Harga","name"=>"price",'type'=>'number','required'=>true];
			$columns[] = ["label"=>"Qty","name"=>"qty",'type'=>'number','required'=>true];
			$columns[] = ["label"=>"Total","name"=>"total",'type'=>'number','readonly'=>true,"callback_php"=>'number_format($row->total)','formula'=>"parseInt([qty]) * parseInt([price])"];
			$columns[] = ["label"=>"Lot Number","name"=>"lot_number",'type'=>'text','readonly'=>true];

			$this->form[] = ['label'=>'Orders Detail','name'=>'sales_order_details','type'=>'child','columns'=>$columns,'width'=>'col-sm-1','table'=>'sales_order_details','foreign_key'=>'sales_order_id'];
			$this->form[] = ['label'=>'Subtotal','name'=>'subtotal','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-5','readonly'=>true];
			$this->form[] = ['label'=>'Discount (-)','name'=>'discount','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-5'];
			$this->form[] = ['label'=>'Expedition Cost (+)','name'=>'expedition_cost','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-5'];
			$this->form[] = ['label'=>'Total','name'=>'total','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-5','readonly'=>true];
			$this->form[] = ['label'=>'Total Bayar','name'=>'total_amount','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-5','value'=>0];
			$this->form[] = ['label'=>'Sisa','name'=>'amount_due','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-5','readonly'=>true];
	    	$this->form[] = ['label'=>'Pelanggan Terima Barang','name'=>'customer_receive_date','type'=>'date','validation'=>'nullable|date','width'=>'col-sm-5'];
			$this->form[] = ['label'=>'Bukti Terima','name'=>'customer_receive_image','type'=>'upload','validation'=>'nullable|min:1|max:255','width'=>'col-sm-5'];
			# END FORM DO NOT REMOVE THIS LINE

			# OLD START FORM
			//$this->form = [];
			//$this->form[] = ['label'=>'Pelanggan','name'=>'customer_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'customers,name'];
			//$this->form[] = ['label'=>'Tgl Order','name'=>'order_date','type'=>'date','validation'=>'required|date','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Expedisi','name'=>'expedition_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Subtotal','name'=>'subtotal','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'expeditions,name'];
			//$this->form[] = ['label'=>'Discount','name'=>'discount','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Expedition Cost','name'=>'expedition_cost','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Total','name'=>'total','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Pelanggan Terima Barang','name'=>'customer_receive_date','type'=>'date','validation'=>'nullable|date','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Bukti Terima','name'=>'customer_receive_image','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Description','name'=>'description','type'=>'text','validation'=>'nullable|min:1|max:255','width'=>'col-sm-10'];
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
			// $this->addaction[] = [
			// 	'label' => 'Pesan Antar',
			// 	'icon'=>'fa fa-success',
			// 	'color'=>'success',
			// 	'url'=>CRUDBooster::mainpath('delivery').'/[id]','title'=>'Cetak','target'=>'_blank',
			// 	'showIf'=>"[delivery_order]==0"];
		
		
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
			$this->index_statistic[] = ['label'=>'Total Order','count'=>$this->salesOrder->getTotalSalesOrder(),'icon'=>'fa fa-file-text','color'=>'warning'];
			$this->index_statistic[] = ['label'=>'Total Order (Rp)','count'=>number_format($this->salesOrder->getTotalSalesOrderRp()),'icon'=>'fa fa-file-text','color'=>'danger'];
			$this->index_statistic[] = ['label'=>'Total Piutang (Rp)','count'=>number_format($this->salesOrder->getTotalSalesPiutangRp()),'icon'=>'fa fa-file-text','color'=>'success'];



	        /*
	        | ---------------------------------------------------------------------- 
	        | Add javascript at body 
	        | ---------------------------------------------------------------------- 
	        | javascript code in the variable 
	        | $this->script_js = "function() { ... }";
	        |
	        */
	        $this->script_js = "
				$(function(){
					setInterval(function(){
							var subTotal = 0;
							$('#table-ordersdetail tbody .total').each(function(){
								var sub = parseInt($(this).text());
								subTotal += sub;
								
							});

							let discount =  $('#discount').val();
    						let expedition_cost = $('#expedition_cost').val();
							let total_amount = $('#total_amount').val();

							$('#subtotal').val(subTotal);
							
							let total = (parseInt(subTotal) - parseInt(discount)) + parseInt(expedition_cost);
							let amountDue = (parseInt(total) - parseInt(total_amount));

							$('#total').val(total);
						
							$('#amount_due').val(amountDue);
						
					},500);
				});
			
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
			$this->load_js[] = asset("js/sales.js");
	        
	        
	        
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
	        $query->where('is_point_of_sales',1);
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
	        //Your code here
			if (!Request::get('order_date')){
				CRUDBooster::redirect(CRUDBooster::mainpath("add"),"Silahkan Isi Tanggal Order","info");
			}	

			$code = 'SO-';
			$customer = DB::table('customers')->where('id',$postdata['customer_id'])->first()->code;
		    $sq = DB::table('sales_orders')->max('id'); 
			$year = substr(date("y"),-2);
			$month = date("m");
			$no = str_pad($sq+1,4,"0",STR_PAD_LEFT);
			$postdata['order_number'] = $code.$customer.$year.$month.$no;
			$postdata['order_status_id'] = 1;
			$postdata['created_by'] = CRUDBooster::myId();
	  
			if(empty($postdata['order_date'])){
				CRUDBooster::redirect(CRUDBooster::mainpath("add"),"Tgl Order harus diisi","info");
			}
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
			$sales = DB::table('sales_orders')->where('id',$id)->first();
			
			$total = ($sales->subtotal + $sales->expedition_cost);
			// hitung modal
			// $sales_detail = DB::table('sales_order_detail')
			// 				->join('productsx`')
			$data = [
				'id' => $sales->id,
				'order_number' => $sales->order_number,
				'order_date' => $sales->order_date,
				'total_amount' => $total,
				'module' => 'sales',
				'modal' => 0,
				'expedisi' => 0,
				'diskon' => 0,
				'amount_due' => 0,
			];
			
			$mode = null;
			if($sales->total == $sales->total_amount && $sales->total_amount != 0){
				$mode = 'paid'; // paid
			} else if ($sales->total >= $sales->total_amount && $sales->total_amount != 0) {
				// bayar setengah
				$mode = 'downpayment'; // paid
			} else {
				$mode = 'no-journal';
			}
			
			$this->journalTransaction->salesJournalEntry((object)$data,0,$mode);
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
			$sales = DB::table('sales_orders')->where('id',$id)->first();
		
			$data = [
				'id' => $sales->id,
				'order_number' => $sales->order_number,
				'total_amount' => $postdata['total'],
				'module' => 'sales',
			];
		
			$this->journalTransaction->updatePurchaseJournalEntry((object)$data);
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
			$sales = DB::table('sales_orders')->where('id',$id)->first();

			$data = [
				'id' => $sales->id,
				'order_number' => $sales->order_number,
				'total_amount' => $sales->total,
				'module' => 'sales',
			];
			$this->journalTransaction->deletePurchaseJournalEntry((object)$data);
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
		public function saveCashier(Request $request){
			
			// Check Barang Tidak boleh kosong
			$code = "TR";
			$sq = DB::table('sales_orders')->max('id'); 

			$year = substr(date("y"),-2);
			$month = date("m");
			$no = str_pad($sq+1,4,"0",STR_PAD_LEFT);

			 $vTransaction['order_number'] = $code.$year.$month.$no;
			// $vTransaction['customer'] = Request::post('customer');
			 $vTransaction['order_date'] = date('Y-m-d');
			 $vTransaction['order_status_id'] = 1;
			 $vTransaction['subtotal'] = Request::post('subtotal');
			 $vTransaction['discount'] = 0;
			 $vTransaction['total'] = Request::post('total');
			 $vTransaction['total_amount'] = Request::post('total');
			 $vTransaction['is_point_of_sales'] = 1;
			 $vTransaction['created_by'] = CRUDBooster::myId();
			 $vTransaction['created_at'] = Carbon::now();
			 $vTransaction['delivery_order'] = 1;
		     $last_id = DB::table('sales_orders')->insertGetId($vTransaction);
			
			 $id = Request::post('id');
			 $name = Request::post('name');
			 $price = Request::post('price');
			 $count = Request::post('count');
			 $total = Request::post('total');

			if(!empty($name)){
				
				for($i = 0; $i < count($name); $i++){
					$productLocation = ProductLocation::find($id[$i]);
					$vDetail = [];
					$vDetail['sales_order_id'] =$last_id;
					$vDetail['product_id'] = $productLocation->product_id;
					// add product location
					$vDetail['product_location_id'] = $id[$i];
					$vDetail['price'] = $price[$i];
					$vDetail['qty'] = $count[$i];
					$vDetail['total'] = ((int)$price[$i] * (int)$count[$i]);
					$vDetail['created_by'] =  CRUDBooster::myId();
					$vDetail['created_at'] = Carbon::now();
					DB::table('sales_order_details')->insert($vDetail);
				}
			}
			if($last_id > 0){
				$data['status'] = true;  
				$data['last_id'] = $last_id;

				$sales = DB::table('sales_orders')->where('id',$last_id)->first();
				event(new SalesEntryEvent($sales));
				 
			}
			else
			{
				$data['status'] = false;  
			}
			
			return response()->json($data);
		}

		public function doPrint(Request $requst){

			$order_id = Request::post('order_id');
			$data = [];
			$orders = DB::table('sales_orders')->where('sales_orders.id', $order_id)
						->select('sales_orders.*','cms_users.name')
						->join('cms_users','sales_orders.created_by','=','cms_users.id')
						->first();

			$items =  DB::table('sales_order_details as t1')
			            ->select('t1.*','t2.name')
						->join('products as t2','t1.product_id','=','t2.id')
						->where('t1.sales_order_id',$order_id)->get();
			
			$labels = DB::table('setting_receipt')->first();
		
			$data['labels'] = $labels;
			$data['transactions'] = $orders;
			$data['detail_transaction']  = $items;		
			
			return response()->json(['success'=>'true','data'=>$data,'view'=>view('prints/print-struk')->with($data)->render()], 200, ['Content-Type' => 'application/json']);
			#return response()->json(['success'=>'true','data'=>$data,'view'=>view('prints/print-struk')->with($data)->render()], 200, ['Content-Type' => 'application/json']);
		}

		public function getPrint($id){

			$order_id = $id;
			$data = [];
			$orders = DB::table('sales_orders')->where('sales_orders.id', $order_id)
						->select('sales_orders.*','cms_users.name')
						->join('cms_users','sales_orders.created_by','=','cms_users.id')
						->first();

			$items =  DB::table('sales_order_details as t1')
			            ->select('t1.*','t2.name')
						->join('products as t2','t1.product_id','=','t2.id')
						->where('t1.sales_order_id',$order_id)->get();
			
			$labels = DB::table('setting_receipt')->first();
		
			$data['labels'] = $labels;
			$data['transactions'] = $orders;
			$data['detail_transaction']  = $items;		
			
			$this->cbView('prints.print-struk',$data);
			#return response()->json(['success'=>'true','data'=>$data,'view'=>view('prints/print-struk')->with($data)->render()], 200, ['Content-Type' => 'application/json']);
		}

		public function getCashier(){
			if(!CRUDBooster::isRead() && $this->global_privilege==FALSE || $this->button_add==FALSE) {    
				CRUDBooster::redirect(CRUDBooster::adminPath(),trans("crudbooster.denied_access"));
			  }
			  
			  $sort_by 		= Request::get('sortby');
			  $sort_type  	= Request::get('sort_type');
		      $filter      	= Request::get('query');
			  
			  $data = [];
			  $data['page_title'] = 'Transaksi Penjualan';

			  $date = date('Y-m-d'); //Carbon::now()->setTimezone('UTC');  
			  $data['current'] = $date;

			  $data = DB::table('products as t1')
			          ->select('t2.id as id','t2.product_id','t1.name','t1.product_price','t2.wh_location_id')
					  ->addSelect('t3.wh_location_name')
					  ->join(DB::raw('(SELECT id, product_id, wh_location_id,qty_onhand FROM product_locations) t2'), function($join) {
								$join->on('t1.id','=','t2.product_id');
								$join->where('t2.wh_location_id',3);
								$join->where('t2.qty_onhand','>',0);
							    $join->orderBy('t2.qty_onhand','desc');
								$join->limit(1);
					  })
					  ->join('wh_locations as t3','t3.id','t2.wh_location_id')
					  ->groupBy('t2.id')
			  		  ->take(20)->get();
						//dd(DB::getQueryLog());
			    $items = $data->map(function($product) {
				return [
				   'id' => $product->id, 
				   'name'=> $product->name,
				   'product_price' => $product->product_price,
				   'wh_location_id' => $product->wh_location_id,
				   'wh_location_name' => $product->wh_location_name,
				   'product_price_format' => 'Rp. '.number_format($product->product_price)	
				];
			 });
			  $data['items'] = $items;
			  $this->cbView('forms.cashier',$data);
		}
		
		public function getPayment($id)
		{
			$data = [];
			$data['sales_order'] = $this->salesOrder->getSalesOrder($id);
			$data['detail_sales'] = $this->salesOrder->getDetailSalesOrder($id);
		//	dd($data);
			$this->cbView('forms/payment',$data);
		}
	
		public function getFormSales(){
			if(!CRUDBooster::isView()) CRUDBooster::redirect(CRUDBooster::adminPath(),trans('crudbooster.denied_access'));
			//Create your own query 
			$data = [];
			$data['Neraca'] ='Laporan Penjualan';
	
			$this->cbView('forms.sales_new',$data);
		}

		public function getDetail($id){
			$data = [];
			$data['sales_order'] = $this->salesOrder->getSalesOrder($id);
			$data['detail_sales'] = $this->salesOrder->getDetailSalesOrder($id);
			
			$this->cbView('forms/sales_detail',$data);
		}
		public function getDelivery($id){
			$data = [];
			$detailSales =  $this->salesOrder->getDetailSalesOrder($id);
			$data['sales_order'] = $this->salesOrder->getSalesOrder($id);
			$data['detail_sales'] = $detailSales;

			foreach($detailSales as $item){
				
				$this->productRepository = $item->product_id;
			}

			$this->cbView('forms/delivery_order',$data);
		}

		public function postPayment(){
	
			$request = Request::all();

			$amountDue = filter_var($request['val_amount_due'], FILTER_SANITIZE_NUMBER_INT);
			$totalAmount = filter_var($request['total_amount'], FILTER_SANITIZE_NUMBER_INT);
			$newAmountDue = (int)$amountDue - (int)$totalAmount;
			if($totalAmount > $amountDue){
				CRUDBooster::redirect($_SERVER['HTTP_REFERER'],"Jumlah Pembayaran melebihi nominal sisa","info");
			}
			
			$payload = [
				'id' => $request['order_id'],
				'amount_due' => $newAmountDue,
				'total_amount' => filter_var($request['total_amount'], FILTER_SANITIZE_NUMBER_INT),
			];

			$this->salesOrder->updatePayment((object)$payload);

			CRUDBooster::redirect($_SERVER['HTTP_REFERER'], 'Pembayaran Berhasil', 'success'); 
		}
		public function postKirim(){
			
			$request = Request::all();
			$data = [];
			
			$payload = [
				'id' => $request['sales_order_id'],
				'delivery_order' => 1,
				'notes' => $request['acknowledge_notes']
			];

			$this->salesOrder->updateDeliveryOrder((object)$payload);

			$salesOrder =  $this->salesOrder->getSalesOrder($request['sales_order_id']);
			$detailSales =  $this->salesOrder->getDetailSalesOrder($request['sales_order_id']);
			$data['sales_order'] = $salesOrder;
			$data['detail_sales'] =$detailSales;

			$dataJournal = [
				'id' => $salesOrder->id,
				'order_number' => $salesOrder->order_number,
				'order_date' => $salesOrder->order_date,
				'total_amount' => $salesOrder->total_amount,
				'subtotal' => $salesOrder->subtotal,
				'expedition_cost' => $salesOrder->expedition_cost,
				'module' => 'delivery',
			];

			// TODO: QTY -
			$this->productRepository->updateSalesStokLocation($salesOrder->id);

			$this->journalTransaction->purchaseJournalEntry((object)$dataJournal,0);

			$this->cbView('forms/delivery_order',$data);

		}
		public function postCetakpenjualan(){
		
			$customer = Request::get('customer_list');
			$category = Request::get('category_list');
			$brand = Request::get('brand_list');
			$item = Request::get('item_list');
			$start_date = Request::get('start_date');	
			$end_date = Request::get('end_date');
			
			$data = [];

			$sales = DB::table('sales_orders as t1')
						->select('t1.*','t2.name', 't3.name as expedition','t5.name as product_name','t6.name as category_name','t7.name as brand_name','t10.name as vendor_name')
						->leftJoin('customers as t2','t1.customer_id','=','t2.id')
						->join('sales_order_details as t4','t1.id','=','t4.sales_order_id')
						->join('products as t5','t4.product_id','t5.id')
						->join('product_categories as t6','t6.id','t5.category_id')
						->join('product_brands as t7','t5.brand_id','t7.id')
						->leftJoin('product_locations as t8','t4.product_id','t8.product_id')
						->leftJoin('goods_receipt as t9','t9.id','t8.good_receipt_id')
						->leftJoin('vendors as t10','t10.id','t9.vendor_id')
						->leftJoin('expeditions as t3','t1.expedition_id','=','t3.id');
						
			$sales = $sales->when($customer, function($sales) use ($customer){
				return $sales->whereIn('t2.id',$customer);
			});
			$sales = $sales->when($category, function($sales) use ($category){
				return $sales->whereIn('t6.id',$category);
			});
			$sales = $sales->when($brand, function($sales) use ($brand){
				return $sales->whereIn('t7.id',$brand);
			});
			$sales = $sales->when($item, function($sales) use ($item){
				return $sales->whereIn('t5.id',$item);
			});
			#var_dump($sales->get()); die;
			if(isset($start_date) && isset($end_date)){
				$sales = $sales->whereRaw("DATE_FORMAT(t1.order_date, '%Y-%m-%d') >= '" . $start_date . "' AND DATE_FORMAT(t1.order_date, '%Y-%m-%d') <= '" . $end_date . "'");
			}
			$sales = $sales->get();
		
			$data['page_title'] = 'Laporan Penjualan Barang';

			$datas = Array();
			$no=1;
			if($sales) {
				foreach($sales as $item){
					$data_raw = array(
						$no,
						$item->order_number,
						$item->name,
						$item->order_date,
						$item->vendor_name,
						$item->category_name,
						$item->brand_name,
						$item->product_name,
						$item->expedition,
						$item->subtotal,
						$item->discount,
						$item->expedition_cost,
						$item->total,
						$item->total_amount,
						$item->amount_due
					);
					array_push($datas,$data_raw);
					$no++;
				}
			}
			Excel::create("Laporan Penjualan Barang", function($excel) use($datas) {
				$excel->sheet('Penjualan Barang', function($sheet) use($datas) {
					$judul=['Laporan Penjualan Barang'];
					$sheet->appendRow($judul);
					$sheet->row($sheet->getHighestRow(), function ($row) {
						$row->setFontSize(14);
						$row->setFontWeight('bold');
					});
					$sheet->mergeCells('A1:N1');
					
					// Columns
					$labels = ['No','No. Order','Pelanggan','Tgl Order','Supplier','Kategori','Brand','Item','Expedisi','Sub Total', 'Discount','Biaya Expedisi','Total','Pelunasan','Sisa'];

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
		public function postCetakpenjualanPDF()
		{
		
			$data['tgl_data']=date('d-M-Y',strtotime($_POST['tgl_awal']) )." s/d ". date('d-M-Y',strtotime($_POST['tgl_akhir']));

			$data['sales'] = DB::table('sales_orders as t1')
									->select('t1.*','t2.name', 't3.name as expedition')
									->leftJoin('customers as t2','t1.customer_id','=','t2.id')
									->leftJoin('expeditions as t3','t1.expedition_id','=','t3.id')
									->get();

			$this->cbView('prints.sales',$data);
		}
		public function getStatus(){
			if(!CRUDBooster::isRead() && $this->global_privilege==FALSE || $this->button_edit==FALSE) {    
				CRUDBooster::redirect(CRUDBooster::adminPath(),trans("crudbooster.denied_access"));
			  }

			  $data = [];
			  $data['page_title'] = 'Detail Data';
			  $data['data'] = [
				'item_incoming' => 100,
				'item_outgoing' => 100
			  ];
			 // echo '<pre>'; print($data['data']['item_incoming']); echo '<pre>'; exit;
			  $this->cbView('dashboards.statistic',$data);
		}
	} 