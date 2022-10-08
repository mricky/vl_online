<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;
	use Carbon\Carbon;
	use App\Repositories\{
		GoodReceiptRepository
	};
	class AdminGoodsReceiptDetails43Controller extends \crocodicstudio\crudbooster\controllers\CBController {

	
		private $goodReceiptRepository;

		public function __construct(GoodReceiptRepository $goodReceiptRepository) 
        {
			 $this->goodReceiptRepository = $goodReceiptRepository;
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
			$this->button_delete = false;
			$this->button_detail = true;
			$this->button_show = true;
			$this->button_filter = true;
			$this->button_import = false;
			$this->button_export = true;
			$this->table = "goods_receipt_details";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"No Penerimaan","name"=>"good_receipt_id","join"=>"goods_receipt,code"];
			$this->col[] = ["label"=>"Tgl Terima","name"=>"good_receipt_id","join"=>"goods_receipt,receipt_date"];
			$this->col[] = ["label"=>"Barang","name"=>"product_id","join"=>"products,name"];
			$this->col[] = ["label"=>"Jumlah Pesan","name"=>"qty_demand"];
			$this->col[] = ["label"=>"Jumlah Terima","name"=>"qty_in"];
			$this->col[] = ["label"=>"Selisih","name"=>"qty_diferrence"];
			$this->col[] = ["label"=>"Gudang","name"=>"wh_location_id","join"=>"wh_locations,wh_location_name"];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'No Penerimaan','name'=>'good_receipt_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'goods_receipt,code'];
			$this->form[] = ['label'=>'Barang','name'=>'product_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'products,name'];
			$this->form[] = ['label'=>'Jumlah Pesan','name'=>'qty_demand','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Jumlah Terima','name'=>'qty_in','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Selisih','name'=>'qty_diferrence','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Gudang','name'=>'wh_location_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			# END FORM DO NOT REMOVE THIS LINE

			# OLD START FORM
			//$this->form = [];
			//$this->form[] = ["label"=>"Good Receipt Id","name"=>"good_receipt_id","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"good_receipt,id"];
			//$this->form[] = ["label"=>"Product Id","name"=>"product_id","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"product,id"];
			//$this->form[] = ["label"=>"Lot Number","name"=>"lot_number","type"=>"text","required"=>TRUE,"validation"=>"required|min:1|max:255"];
			//$this->form[] = ["label"=>"Qty Demand","name"=>"qty_demand","type"=>"number","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"Qty In","name"=>"qty_in","type"=>"number","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"Qty Diferrence","name"=>"qty_diferrence","type"=>"number","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"Wh Location Id","name"=>"wh_location_id","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"wh_location,id"];
			//$this->form[] = ["label"=>"Price","name"=>"price","type"=>"money","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"Is Store Vendor Location","name"=>"is_store_vendor_location","type"=>"radio","required"=>TRUE,"validation"=>"required|integer","dataenum"=>"Array"];
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
	        $this->addaction = array();


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
	        $this->index_statistic = array();
			$this->index_statistic[] = ['label'=>'Barang Terima / Hari','url'=>'goods_receipt_details43?filter=incoming-day','count'=>$this->goodReceiptRepository->getTotalItemIncoming('day'),'icon'=>'fa fa-check','color'=>'danger'];
			$this->index_statistic[] = ['label'=>'Barang Terima / Minggu','url'=>'goods_receipt_details43?filter=incoming-week','count'=>$this->goodReceiptRepository->getTotalItemIncoming('week'),'icon'=>'fa fa-check','color'=>'danger'];
			$this->index_statistic[] = ['label'=>'Barang Terima / Bulan','url'=>'goods_receipt_details43?filter=incoming-month','count'=>$this->goodReceiptRepository->getTotalItemIncoming('month'),'icon'=>'fa fa-check','color'=>'danger'];
			$this->index_statistic[] = ['label'=>'Barang Terima / Tahun','url'=>'goods_receipt_details43?filter=incoming-year','count'=>$this->goodReceiptRepository->getTotalItemIncoming('year'),'icon'=>'fa fa-check','color'=>'danger'];

	        /*
	        | ---------------------------------------------------------------------- 
	        | Add javascript at body 
	        | ---------------------------------------------------------------------- 
	        | javascript code in the variable 
	        | $this->script_js = "function() { ... }";
	        |
	        */
	        $this->script_js = NULL;


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
	        $this->load_js = array();
	        
	        
	        
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
	        #$m =  Carbon::now()->format('Y');
			#incoming-day
			#incoming-week
			#incoming-month
			#incoming-year
					//$query->join('goods_receipt','goods_receipt_details.good_receipt_id','=','goods_receipt.id');
		

			if(Request::get('filter') == 'incoming-day'){
				$query->whereDate('goods_receipt.receipt_date','=',Carbon::now()->format('Y-m-d'));
			} 
			if(Request::get('filter') == 'incoming-week'){
				$query->whereBetween('goods_receipt.receipt_date', [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()]);
			} 
			if(Request::get('filter') == 'incoming-month'){
				$query->whereMonth('goods_receipt.receipt_date','=', Carbon::now()->format('m'));
			}
			if(Request::get('filter') == 'incoming-year'){
				$query->whereYear('goods_receipt.receipt_date','=', Carbon::now()->format('Y'));
			}
			$query->where('goods_receipt.status_id',2);
			// if(Request::get('filter') == 'omset-year'){
				
			// } 
			// if(Request::get('filter') == 'omset-month'){
				
			// 	$query->whereMonth('invoices.invoice_date','=',$m);
			// } 
			// if(Request::get('filter') == 'invoice-paid'){
			// 	$query->whereMonth('invoices.invoice_date','=',$m);
			// 	$query->whereRaw('(SELECT COUNT(*) FROM account_receive WHERE invoice_id = invoices.id) != 0');

			// } 
			// if(Request::get('filter') == 'invoice-unpaid'){

			// 	$query->whereMonth('invoices.invoice_date','=',$m);
			// 	$query->whereRaw('(SELECT coalesce(sum(account_receive.amount_paid),0) FROM account_receive where invoice_id = invoices.id) < (SELECT coalesce(sum(invoice_items.total),0) FROM invoice_items where invoice_id = invoices.id)');
			
			// } 
			 
			// $query->where('invoices.location_id','=',CRUDBooster::myLocation());
			// $query->where('invoices.service_id','=',6);
			// $query->where('reservation_type',1);  
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



	    //By the way, you can still create your own method in here... :) 


	}