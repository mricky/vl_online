<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;
    use App\Repositories\PurchaseOrderRepository;
	use App\Repositories\JournalTransactionRepository;
	class AdminPurchaseOrdersController extends \crocodicstudio\crudbooster\controllers\CBController {

		private $purchaseOrder;
		private $journalTransaction;

		public function __construct(PurchaseOrderRepository $purchaseOrder,JournalTransactionRepository $journalTransaction) 
        {
       		 $this->purchaseOrder = $purchaseOrder;
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
			$this->table = "purchase_orders";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Supplier","name"=>"vendor_id","join"=>"vendors,name"];
			$this->col[] = ["label"=>"No Order","name"=>"order_number"];
			$this->col[] = ["label"=>"Tgl Order","name"=>"order_date"];
			//$this->col[] = ["label"=>"Tg Pengiriman","name"=>"delivery_date"];
			$this->col[] = ["label"=>"Subtotal","name"=>"subtotal","callback_php"=>'number_format($row->subtotal)'];
			$this->col[] = ["label"=>"Discount","name"=>"discount","callback_php"=>'number_format($row->discount)'];
			//$this->col[] = ["label"=>"Total","name"=>"total","callback_php"=>'number_format($row->total)'];
			$this->col[] = ["label"=>"Total Bayar","name"=>"total_amount","callback_php"=>'number_format($row->total_amount)'];
			$this->col[] = ["label"=>"Total Hutang","name"=>"amount_due","callback_php"=>'number_format($row->amount_due)'];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Supplier','name'=>'vendor_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-5','datatable'=>'vendors,name'];
			$this->form[] = ['label'=>'Tgl Order','name'=>'order_date','type'=>'date','validation'=>'required|date','width'=>'col-sm-5'];
			//$this->form[] = ['label'=>'Tgl Kirim','name'=>'delivery_date','type'=>'date','validation'=>'required|date','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Keterangan','name'=>'description','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-5'];
	
			$columns = [];
			$columns[] = ['label'=>'Product','name'=>'product_id','type'=>'datamodal'
						,'validation'=>'required|min:1|max:255'
						,'width'=>'col-sm-2'
						,'datamodal_table'=>'view_list_products'
						,'datamodal_columns'=>'code,name,category_name,brand_name,qty_onhand'
						,'datamodal_size'=>'large','datamodal_columns_alias'=>'SKU,Nama,Kategori,Brand, Qty'
						,'datamodal_select_to'=>'product_price:price,qty:qty'];
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

			$data = [
				'id' => $purchase->id,
				'order_number' => $purchase->order_number,
				'order_date' => $purchase->order_date,
				'total_amount' => $purchase->total_amount,
				'module' => 'purchase',
			];
		
			$this->journalTransaction->purchaseJournalEntry((object)$data,0); // automatic journal

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
			$purchase = DB::table('purchase_orders')->where('id',$id)->first();

			$data = [
				'id' => $purchase->id,
				'order_number' => $purchase->order_number,
				'total_amount' => $purchase->total_amount,
				'module' => 'purchase',
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
			$data['Neraca'] ='Laporan Pembelian';
	
			$this->cbView('forms.purchase',$data);
		}

		public function postCetakpembelian()
		{
			$data['tgl_data']=date('d-M-Y',strtotime($_POST['tgl_awal']) )." s/d ". date('d-M-Y',strtotime($_POST['tgl_akhir']));

			$data['purchase_orders'] = DB::table('purchase_orders as t1')
													->select('t1.*','t2.name')
													->leftJoin('vendors as t2','t1.vendor_id','=','t2.id')
													->get();

			$this->cbView('prints.purchase',$data);
		}


	}