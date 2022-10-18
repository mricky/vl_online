<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;
	use App\Repositories\JournalTransactionRepository;
	use App\Repositories\{
		SalesOrderRepository,
		ProductRepository
	};
	use Maatwebsite\Excel\Facades\Excel;
	use Illuminate\Support\Str;
	class AdminSalesOrdersController extends \crocodicstudio\crudbooster\controllers\CBController {

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
			$this->button_add = true;
			$this->button_edit = true;
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
			$this->col[] = ["label"=>"Pelanggan","name"=>"customer_id","join"=>"customers,name"];
			$this->col[] = ["label"=>"No Order","name"=>"order_number"];
			$this->col[] = ["label"=>"Tgl Order","name"=>"order_date"];
			$this->col[] = ["label"=>"Expedisi","name"=>"expedition_id","join"=>"expeditions,name"];
			$this->col[] = ["label"=>"Subtotal","name"=>"subtotal","callback_php"=>'number_format($row->subtotal)'];
			$this->col[] = ["label"=>"Discount","name"=>"discount","callback_php"=>'number_format($row->discount)'];
			$this->col[] = ["label"=>"Biaya Expedisi","name"=>"expedition_cost","callback_php"=>'number_format($row->expedition_cost)'];
			$this->col[] = ["label"=>"Total","name"=>"total","callback_php"=>'number_format($row->total)'];
			$this->col[] = ["label"=>"Bayar","name"=>"total_amount","callback_php"=>'number_format($row->total_amount)'];
			$this->col[] = ["label"=>"Sisa","name"=>"amount_due","callback_php"=>'number_format($row->amount_due)'];
			$this->col[] = ["label"=>"Notes","name"=>"notes"];
			$this->col[] = ["label"=>"Status","name"=>"delivery_order","callback_php"=>'($row->delivery_order==0)?"<span class=\"label label-default\">PROSES</span>":"<span class=\"label label-danger\">DELIVERY</span>"'];
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
		
			$this->addaction[] = [
				'label' => 'Kirim',
				'icon'=>'fa fa-success',
				'color'=>'success',
				'url'=>CRUDBooster::mainpath('delivery').'/[id]','title'=>'Cetak','target'=>'_blank',
				'showIf'=>"[delivery_order]==0"];

			$this->addaction[] = ['label'=>'Faktur','icon'=>'fa fa-print','color'=>'primary','url'=>CRUDBooster::mainpath('print').'/[id]','title'=>'Cetak','target'=>'_blank'];
			$this->addaction[] = [
				'label' => 'Bayar',
				'icon'=>'fa fa-money',
				'color'=>'success',
				'url'=>CRUDBooster::mainpath('payment').'/[id]','title'=>'Cetak','target'=>'_blank',
				'showIf'=>"[amount_due]!=0"
			];
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
		public function getPayment($id)
		{
			$data = [];
			$data['sales_order'] = $this->salesOrder->getSalesOrder($id);
			$data['detail_sales'] = $this->salesOrder->getDetailSalesOrder($id);
		//	dd($data);
			$this->cbView('forms/payment',$data);
		}
		public function getPrint($id){
			if(!CRUDBooster::isRead() && $this->global_privilege==FALSE || $this->button_add==FALSE) {    
				CRUDBooster::redirect(CRUDBooster::adminPath(),trans("crudbooster.denied_access"));
			  }

			$data = [];
			$data['page_title'] = 'Sales Order';

			$data['sales_order'] = $this->salesOrder->getSalesOrder($id);
		
			$data['sales_detail'] =  $this->salesOrder->getDetailSalesOrder($id);

			//
			$data['print'] = (object)[
				'print_at' => date('Y-m-d H:i:s'),
				'print_by' => CRUDBooster::me()
			];
			//dd($data);
			$this->cbView('prints.sales_order',$data);

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
			$data['sales_order'] = $this->salesOrder->getSalesOrder($id);
			$data['detail_sales'] = $this->salesOrder->getDetailSalesOrder($id);
			
			$this->cbView('forms/delivery_order',$data);
		}

		public function postPayment(){
			// TODO: Payment next with journal transaction
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
						->select('t1.*','t2.name', 't3.name as expedition','t5.name as product_name','t6.name as category_name','t7.name as brand_name')
						->leftJoin('customers as t2','t1.customer_id','=','t2.id')
						->join('sales_order_details as t4','t1.id','=','t4.sales_order_id')
						->join('products as t5','t4.product_id','t5.id')
						->join('product_categories as t6','t6.id','t5.category_id')
						->join('product_brands as t7','t5.brand_id','t7.id')
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
			if(isset($start_date) )
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
					$labels = ['No','No. Order','Pelanggan','Tgl Order','Kategori','Brand','Item','Expedisi','Sub Total', 'Discount','Biaya Expedisi','Total','Pelunasan','Sisa'];

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