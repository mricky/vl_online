<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;
	use App\Repositories\JournalTransactionRepository;
	use App\Repositories\SalesOrderRepository;
	class AdminSalesOrdersController extends \crocodicstudio\crudbooster\controllers\CBController {

		private $journalTransaction;
		private $salesOrder;
		public function __construct(SalesOrderRepository $salesOrder,JournalTransactionRepository $journalTransaction) 
        {
			 $this->salesOrder = $salesOrder;
			 $this->journalTransaction = $journalTransaction;
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
			//$columns[] = ['label'=>'Product','name'=>'product_id','type'=>'select','validation'=>'required|integer|min:0','width'=>'col-sm-5','datatable'=>'products,name'];
			$columns[] = ['label'=>'Product','name'=>'product_id','type'=>'datamodal'
							,'validation'=>'required|min:1|max:255'
							,'width'=>'col-sm-2'
							,'datamodal_table'=>'view_list_product_sales'
							,'datamodal_columns'=>'name,category_name,brand_name,product_price,qty_onhand,lot_number'
							,'datamodal_size'=>'large','datamodal_columns_alias'=>'Name, Kategori, Brand, Harga, Stok, Lot Number'
							,'datamodal_select_to'=>'product_price:price,lot_number:lot_number'];
			// sample more than 1
			//$columns[] = ['label'=>'Product Lot','name'=>'product_item_id','type'=>'select','validation'=>'required|integer|min:0','width'=>'col-sm-5','datatable'=>'product_items,lot_number','parent_select'=>'product_id','datatable_where'=>'lot_number is not null'];
			$columns[] = ["label"=>"Harga","name"=>"price",'type'=>'number','readonly'=>true];
			$columns[] = ["label"=>"Qty","name"=>"qty",'type'=>'number'];
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

			$data = [
				'id' => $sales->id,
				'order_number' => $sales->order_number,
				'order_date' => $sales->order_date,
				'total_amount' => $total,
				'module' => 'sales',
			];
		
			$this->journalTransaction->purchaseJournalEntry((object)$data,0);
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
	
			$this->cbView('forms.sales',$data);
		}

		public function getDelivery($id){
			$data = [];
			$data['sales_order'] = $this->salesOrder->getSalesOrder($id);
			$data['detail_sales'] = $this->salesOrder->getDetailSalesOrder($id);
			
			$this->cbView('forms/delivery_order',$data);
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

			$this->journalTransaction->purchaseJournalEntry((object)$dataJournal,0);

			$this->cbView('forms/delivery_order',$data);

		}

		public function postCetakpenjualan()
		{
			$data['tgl_data']=date('d-M-Y',strtotime($_POST['tgl_awal']) )." s/d ". date('d-M-Y',strtotime($_POST['tgl_akhir']));

			$data['sales'] = DB::table('sales_orders as t1')
									->select('t1.*','t2.name', 't3.name as expedition')
									->leftJoin('customers as t2','t1.customer_id','=','t2.id')
									->leftJoin('expeditions as t3','t1.expedition_id','=','t3.id')
									->get();

			$this->cbView('prints.sales',$data);
		}
	} 