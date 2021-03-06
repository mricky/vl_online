<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;
    use App\Repositories\ProductRepository;
	use App\Repositories\JournalTransactionRepository;

	class AdminGoodsReceiptController extends \crocodicstudio\crudbooster\controllers\CBController {

	    private $productRepository;

		public function __construct(ProductRepository $productRepository,JournalTransactionRepository $journalTransaction) 
        {
       		 $this->productRepository = $productRepository;
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
			$this->table = "goods_receipt";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Kode","name"=>"code"];
			$this->col[] = ["label"=>"No PO","name"=>"purchase_order_id","join"=>"purchase_orders,order_number"];
			$this->col[] = ["label"=>"Supplier","name"=>"vendor_id","join"=>"vendors,name"];
			$this->col[] = ["label"=>"Tgl Penerimaan","name"=>"receipt_date"];
			//$this->col[] = ["label"=>"No PO Supplier","name"=>"po_vendor"];
			$this->col[] = ["label"=>"Keterangan","name"=>"description"];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Supplier','name'=>'vendor_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-5','datatable'=>'vendors,name'];
			$this->form[] = ['label'=>'Tgl Penerimaan','name'=>'receipt_date','type'=>'date','validation'=>'required|date','width'=>'col-sm-5'];
			$this->form[] = ['label'=>'PO','name'=>'purchase_order_id','type'=>'datamodal'
						,'validation'=>'required|min:1|max:255'
						,'width'=>'col-sm-5'
						,'datamodal_table'=>'view_orders'
						,'datamodal_columns'=>'vendor_name,order_number,order_date,description'
						,'datamodal_size'=>'large','datamodal_columns_alias'=>'Supplier,Order No,Tgl Order, Keterangan'
						,'datamodal_select_to'=>'id:purchase_order_id'
						,'datamodal_where' => ''];

		
			//$this->form[] = ['label'=>'PO','name'=>'purchase_order_id','type'=>'select','width'=>'col-sm-4','datatable'=>'purchase_orders,order_number,vendor_id,description','datatable_format'=>'order_number,\' - \',description','parent_select'=>'vendor_id'];
			
			$columns = [];
			$columns[] = ['label'=>'Product','name'=>'product_id','type'=>'select','validation'=>'required|integer|min:0','width'=>'col-sm-5','datatable'=>'products,name'];
			$columns[] = ["label"=>"Barang Masuk","name"=>"qty_in",'type'=>'number'];
			$columns[] = ["label"=>"Harga","name"=>"price",'type'=>'number'];
			$columns[] = ["label"=>"Simpan di Supplier","name"=>"is_store_vendor_location",'type'=>'radio','dataenum'=>'0|No;1|Yes','width'=>'col-sm-5'];
			$columns[] = ["label"=>"Lot No","name"=>"lot_number",'type'=>'text','readonly'=>true];

			$this->form[] = ['label'=>'Detail Penerimaan','name'=>'good_receipt_details','type'=>'child','columns'=>$columns,'width'=>'col-sm-1','table'=>'goods_receipt_details','foreign_key'=>'good_receipt_id'];
		
			$this->form[] = ['label'=>'Description','name'=>'description','type'=>'text','validation'=>'nullable','width'=>'col-sm-10'];
			# END FORM DO NOT REMOVE THIS LINE

			# OLD START FORM
			//$this->form = [];
			//$this->form[] = ["label"=>"Code","name"=>"code","type"=>"text","required"=>TRUE,"validation"=>"required|min:1|max:255"];
			//$this->form[] = ["label"=>"Vendor Id","name"=>"vendor_id","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"vendor,id"];
			//$this->form[] = ["label"=>"Purchase Order Id","name"=>"purchase_order_id","type"=>"select2","required"=>TRUE,"validation"=>"required|min:1|max:255","datatable"=>"purchase_order,id"];
			//$this->form[] = ["label"=>"Po Vendor","name"=>"po_vendor","type"=>"text","required"=>TRUE,"validation"=>"required|min:1|max:255"];
			//$this->form[] = ["label"=>"Delivery Date","name"=>"delivery_date","type"=>"date","required"=>TRUE,"validation"=>"required|date"];
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
	        $this->addaction[] = ['label'=>'Print PO','icon'=>'fa fa-print','color'=>'primary','url'=>CRUDBooster::mainpath('print').'/[id]','title'=>'Cetak','target'=>'_blank'];



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



	        /*
	        | ---------------------------------------------------------------------- 
	        | Add javascript at body 
	        | ---------------------------------------------------------------------- 
	        | javascript code in the variable 
	        | $this->script_js = "function() { ... }";
	        |
	        */
	        $this->script_js = "";


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
			$this->load_js[] = asset("js/good_receive.js");
	        
	        
	        
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
			
			$code = 'GR-';
			$supplier = DB::table('vendors')->where('id',$postdata['vendor_id'])->first()->code;
		    $po = DB::table('purchase_orders')->where('id',$postdata['purchase_order_id'])->first();
			$sq = DB::table('goods_receipt')->max('id'); 
			$year = substr(date("y"),-2);
			$month = date("m");
			$no = str_pad($sq+1,4,"0",STR_PAD_LEFT);
			$postdata['code'] = $code.$supplier.$year.$month.$no;
			$postdata['vendor_id'] = $po->vendor_id;
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

			$receive = DB::table('goods_receipt')->where('id',$id)->first();
			$purchase =  DB::table('purchase_orders')->where('id',$receive->purchase_order_id)->first();
			$data = [
				'id' => $receive->id,
				'order_number' => $receive->code,
				'order_date' => $receive->receipt_date,
				'total_amount' => $purchase->total_amount,
				'module' => 'receive',
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
			$receive = DB::table('goods_receipt')->where('id',$id)->first();
			$purchase =  DB::table('purchase_orders')->where('id',$receive->purchase_order_id)->first();
			$data = [
				'id' => $receive->id,
				'order_number' => $receive->code,
				'total_amount' => $purchase->total_amount,
				'module' => 'receive',
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



	    //By the way, you can still create your own method in here... :) 
		public function searchItemLinePO($poId)
		{
			
			
			$data = $this->productRepository->getItemLinePO($poId);

			
			return response()->json($data);


		}

		public function getPrint($id){
			dd($this->form());
		}

		public function getFormStok(){
			if(!CRUDBooster::isView()) CRUDBooster::redirect(CRUDBooster::adminPath(),trans('crudbooster.denied_access'));
			//Create your own query 
			$data = [];
			$data['Neraca'] ='Laporan Stok';
	
			$this->cbView('forms.stok',$data);
		}

		public function postCetakstok()
		{
			$data['products'] = DB::table('products')->get();

			$this->cbView('prints.stok',$data);
		}

		public function postCetakiot()
		{
			$data['products'] = DB::table('goods_receipt_details as t1')
									->select('t1.*','t2.code', 't2.name')
									->leftJoin('products as t2','t1.product_id','=','t2.id')
									//->leftJoin('goods_receipt as t3','t1.goods_receipt_id','=','t3.id')
									->get();

			$this->cbView('prints.stok-iot',$data);
		}
	}