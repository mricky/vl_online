<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;
	use App\Repositories\{
		ProductRepository,
		PurchaseOrderRepository
	};

	class AdminPurchaseOrderReturnController extends \crocodicstudio\crudbooster\controllers\CBController {

		private $purchaseOrder;
		private $productRepository;
		public function __construct(ProductRepository $productRepository,PurchaseOrderRepository $purchaseOrder) 
        {
       		 $this->productRepository = $productRepository;
			 $this->purchaseOrder = $purchaseOrder;
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
			$this->table = "purchase_order_return";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			#$this->col[] = ["label"=>"Purchase Order Id","name"=>"purchase_order_id","join"=>"purchase_orders,id"];
			$this->col[] = ["label"=>"No Retur","name"=>"return_order_number"];
			$this->col[] = ["label"=>"No Pembelian","name"=>"purchase_order_number"];
			$this->col[] = ["label"=>"Supplier","name"=>"vendor_id","join"=>"vendors,name"];
			$this->col[] = ["label"=>"Tgl Retur","name"=>"retrun_order_date"];
			$this->col[] = ["label"=>"Keterangan","name"=>"description"];
			#$this->col[] = ["label"=>"Echange Rate","name"=>"echange_rate"];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			#$this->form[] = ['label'=>'Supplier','name'=>'supplier','type'=>'select','validation'=>'required|min:1|max:255','width'=>'col-sm-5','datatable'=>'vendors,name'];
			$this->form[] = ['label'=>'No Faktur','name'=>'purchase_order_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-5','datatable'=>'purchase_orders,order_number'];
			#$columns[] = ['label'=>'Lokasi Produk','name'=>'product_location_id','type'=>'select','required'=>true,'width'=>'col-sm-5','datatable'=>'view_product_location,product_location','parent_select'=>'product_id'];
			#$this->form[] = ['label'=>'Purchase Number','name'=>'purchase_order_number','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			#$this->form[] = ['label'=>'Supplier','name'=>'vendor_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'vendors,id'];
			#$this->form[] = ['label'=>'Retur No','name'=>'return_order_number','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Tanggal Retur','name'=>'retrun_order_date','type'=>'date','validation'=>'required|date','width'=>'col-sm-5'];
			#$this->form[] = ['label'=>'Currency Id','name'=>'currency_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'currency,id'];
			#$this->form[] = ['label'=>'Echange Rate','name'=>'echange_rate','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			
			$columns = [];
			#$columns[] = ['label'=>'Produk','name'=>'product_id','type'=>'select','required'=>true,'width'=>'col-sm-5','datatable'=>'view_product,product_name'];
			$columns[] = ['label'=>'Lokasi & Produk','name'=>'product_location_id','type'=>'select','required'=>true,'width'=>'col-sm-5','datatable'=>'view_product_purchases,product_name'];
			$columns[] = ["label"=>"Invoice Qty","name"=>"invoice_qty",'type'=>'number',"readonly"=>true];
			$columns[] = ["label"=>"Harga","name"=>"price",'type'=>'number'];
			$columns[] = ["label"=>"Retur Qty","name"=>"return_qty",'type'=>'number'];
			$columns[] = ["label"=>"Subtotal","name"=>"subtotal",'type'=>'number',"readonly"=>true,'formula'=>"[return_qty] * [price]"];
			
			$this->form[] = ['label'=>'Orders Detail Return','name'=>'purchase_order_detail_return','type'=>'child','columns'=>$columns,'width'=>'col-sm-1','table'=>'purchase_order_detail_return','foreign_key'=>'return_order_id'];
			
			$this->form[] = ['label'=>'Subtotal','name'=>'subtotal','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-5'];
			// $this->form[] = ['label'=>'Discount','name'=>'discount','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-5'];
			$this->form[] = ['label'=>'Total','name'=>'total','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-5'];
			$this->form[] = ['label'=>'Total Amount','name'=>'total_amount','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-5'];
			$this->form[] = ['label'=>'Description','name'=>'description','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-5'];
			// $this->form[] = ['label'=>'Total Qty Request','name'=>'total_qty_request','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			// $this->form[] = ['label'=>'Total Qty In','name'=>'total_qty_in','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			// $this->form[] = ['label'=>'Total Qty Difference','name'=>'total_qty_difference','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			// $this->form[] = ['label'=>'Amount Due','name'=>'amount_due','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			// $this->form[] = ['label'=>'Created By','name'=>'created_by','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			# END FORM DO NOT REMOVE THIS LINE

			# OLD START FORM
			//$this->form = [];
			//$this->form[] = ["label"=>"Purchase Order Id","name"=>"purchase_order_id","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"purchase_order,id"];
			//$this->form[] = ["label"=>"Purchase Order Number","name"=>"purchase_order_number","type"=>"text","required"=>TRUE,"validation"=>"required|min:1|max:255"];
			//$this->form[] = ["label"=>"Vendor Id","name"=>"vendor_id","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"vendor,id"];
			//$this->form[] = ["label"=>"Return Order Number","name"=>"return_order_number","type"=>"text","required"=>TRUE,"validation"=>"required|min:1|max:255"];
			//$this->form[] = ["label"=>"Retrun Order Date","name"=>"retrun_order_date","type"=>"date","required"=>TRUE,"validation"=>"required|date"];
			//$this->form[] = ["label"=>"Currency Id","name"=>"currency_id","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"currency,id"];
			//$this->form[] = ["label"=>"Echange Rate","name"=>"echange_rate","type"=>"number","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"Subtotal","name"=>"subtotal","type"=>"number","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"Discount","name"=>"discount","type"=>"number","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"Total","name"=>"total","type"=>"number","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"Total Amount","name"=>"total_amount","type"=>"number","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"Description","name"=>"description","type"=>"text","required"=>TRUE,"validation"=>"required|min:1|max:255"];
			//$this->form[] = ["label"=>"Total Qty Request","name"=>"total_qty_request","type"=>"number","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"Total Qty In","name"=>"total_qty_in","type"=>"number","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"Total Qty Difference","name"=>"total_qty_difference","type"=>"number","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"Amount Due","name"=>"amount_due","type"=>"number","required"=>TRUE,"validation"=>"required|integer|min:0"];
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
	        $this->index_statistic = array();



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
							var total = 0;
							var totalAmount = 0;

							$('#table-ordersdetailreturn tbody .subtotal').each(function(){
								var sub = parseInt($(this).text());
								subTotal += sub;
								
							});
		
							$('#subtotal').val(subTotal);
							$('#total').val(subTotal);
						

					},500);
			    });
				console.log('run total2');
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
			$this->load_js[] = asset("js/purchase_return.js");
	        
	        
	        
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
			if (!Request::get('retrun_order_date')){
				CRUDBooster::redirect(CRUDBooster::mainpath("add"),"Silahkan Isi Tanggal Retur Order","info");
			}

			$code = 'PO-RET';
			$purchase = DB::table('purchase_orders')->where('id',$postdata['purchase_order_id'])->first();

			$supplier = DB::table('vendors')->where('id',$purchase->vendor_id)->first()->code;
		    $sq = DB::table('purchase_orders')->max('id'); 
			$year = substr(date("y"),-2);
			$month = date("m");
			$no = str_pad($sq+1,4,"0",STR_PAD_LEFT);
			$postdata['purchase_order_number'] = $purchase->order_number;
			$postdata['return_order_number'] = $code.$supplier.$year.$month.$no;
			$postdata['vendor_id'] = $purchase->vendor_id;
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
			$returnOrderDetail = DB::table('purchase_order_detail_return')->where('return_order_id',$id)->get();

			$this->productRepository->syncProductItemReturnPurchase($returnOrderDetail);

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
			DB::table('purchase_order_detail_return')->where('return_order_id',$id)->delete();
	    }



	    //By the way, you can still create your own method in here... :) 
		public function getPrint($id){
			if(!CRUDBooster::isRead() && $this->global_privilege==FALSE || $this->button_add==FALSE) {    
				CRUDBooster::redirect(CRUDBooster::adminPath(),trans("crudbooster.denied_access"));
			  }
			
			$data = [];
			$data['page_title'] = 'Retur Order';
			// $test =  $this->purchaseOrder->getPurchaseOrderReturn($id);
			// dd($test);
			$data['purchase_order'] = $this->purchaseOrder->getPurchaseOrderReturn($id);
		
			$data['po_detail'] =  $this->purchaseOrder->getDetailPurchaseOrderReturn($id);

		
			$data['print'] = (object)[
				'print_at' => date('Y-m-d H:i:s'),
				'print_by' => CRUDBooster::me()
			];
	
			$this->cbView('prints.purchase_order_return',$data);

		}

	}