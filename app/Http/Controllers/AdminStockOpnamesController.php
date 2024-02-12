<?php namespace App\Http\Controllers;

use App\Models\StockOpnameDetail;
use Session;
	use Request;
	use DB;
	use CRUDBooster;
	use App\Repositories\{
		StockOpnameRepository,
		ProductRepository
	};
	class AdminStockOpnamesController extends \crocodicstudio\crudbooster\controllers\CBController {



		private $opnameRepositoy;
		private $productRepository;

		public function __construct(StockOpnameRepository $opnameRepositoy,ProductRepository $productRepository)
        {
       		 $this->opnameRepositoy = $opnameRepositoy;
			 $this->productRepository = $productRepository;

        }
		public function cbInit() {

			# START CONFIGURATION DO NOT REMOVE THIS LINE
			$this->title_field = "opname_number";
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
			$this->table = "stock_opnames";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Kode","name"=>"opname_number"];
			$this->col[] = ["label"=>"Tgl Opname","name"=>"opname_date"];
			$this->col[] = ["label"=>"Total System","name"=>"total_onhand"];
			$this->col[] = ["label"=>"Total Aktual","name"=>"total_actual"];
			$this->col[] = ["label"=>"Total Selisih","name"=>"total_difference"];
			$this->col[] = ["label"=>"Document","name"=>"document"];
			$this->col[] = ["label"=>"Alasan","name"=>"opname_type_id","join"=>"stock_opname_type,name"];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Tgl Opname','name'=>'opname_date','type'=>'date','validation'=>'required|date','width'=>'col-sm-5'];
			$this->form[] = ['label'=>'Lokasi','name'=>'wh_location_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-5','datatable'=>'wh_locations,wh_location_name'];
			#$this->form[] = ['label'=>'Produk','name'=>'product_filters','type'=>'select2multi','width'=>'col-sm-5','datatable'=>'products,name'];
			$this->form[] = ['label'=>'Dokumen','name'=>'document','type'=>'upload','validation'=>'nullable|min:1|max:255','width'=>'col-sm-5'];
			$this->form[] = ['label'=>'Alasan','name'=>'opname_type_id','type'=>'select','validation'=>'required|integer|min:0','width'=>'col-sm-5','datatable'=>'stock_opname_type,name'];
            $this->form[]  = ['label'=>'Akun Biaya','name'=>'account_cost','type'=>'select','validation'=>'required|integer|min:0','width'=>'col-sm-5','datatable'=>'chart_of_accounts,account','datatable_where'=>'id IN (17,32,33,34)'];
            $columns = [];
			$columns[] = ['label'=>'Produk','name'=>'product_location_id','type'=>'select','validation'=>'required|integer|min:0','width'=>'col-sm-5','datatable'=>'products,name'];
			$columns[] = ["label"=>"Origin Qty","name"=>"qty_onhand",'type'=>'number','readonly'=>true];
			$columns[] = ["label"=>"Ajusted Qty","name"=>"qty_actual",'type'=>'number'];
			$columns[] = ["label"=>"Sisa",'required'=>true,"name"=>"qty_difference",'type'=>'number','type'=>'number','formula'=>"[qty_onhand] - [qty_actual]", 'readonly'=>true];
			$columns[] = ["label"=>"Harga Beli (Avg)","name"=>"adjust_cost",'type'=>'number','readonly'=>true];
            $columns[] = ["label"=>"Total","name"=>"total",'type'=>'text','readonly'=>true,'formula'=>'[qty_actual]*[adjust_cost]'];

			# END FORM DO NOT REMOVE THIS LINE
            #$columns[] = ["label"=>"Harga Jual","name"=>"adjust_price",'type'=>'number'];

			$this->form[] = ['label'=>'Barang','name'=>'stock_opname_details','type'=>'child','columns'=>$columns,'width'=>'col-sm-1','table'=>'stock_opname_details','foreign_key'=>'stock_opname_id'];

			# END FORM DO NOT REMOVE THIS LINE

			# OLD START FORM
			//$this->form = [];
			//$this->form[] = ['label'=>'Tgl Opname','name'=>'opname_date','type'=>'date','validation'=>'required|date','width'=>'col-sm-5'];
			//$this->form[] = ['label'=>'Alasan','name'=>'opname_type_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-5','datatable'=>'stock_opname_type,name'];
			//$this->form[] = ['label'=>'Dokumen','name'=>'document','type'=>'filemanager','validation'=>'required|min:1|max:255','width'=>'col-sm-5'];
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



	        /*
	        | ----------------------------------------------------------------------
	        | Add javascript at body
	        | ----------------------------------------------------------------------
	        | javascript code in the variable
	        | $this->script_js = "function() { ... }";
	        |
	        */
	        $this->script_js = " $(function() {

                let locationId = 1; // default wh location
                let productId = 0;

                document.getElementById('wh_location_id').onchange = function(e){
					const select = e.target;
					locationId = document.getElementById('wh_location_id').value;


				}

                // TODO:
				document.getElementById('barangproduct_location_id').onchange = function(e){
					const select = e.target;
					productId = document.getElementById('barangproduct_location_id').value;

                    checkProductLocation(locationId,productId);
				}

                function checkProductLocation(location,productId) {
                    if(productId != 0)
                    {
                        $.ajax({
                            type: \"POST\",
                            url: '/find-product-by-location',
                            data: {
                                'locationId' : location,
                                'productId' : productId
                            },
                            success: function(data) {
                                if(data){
                                    let cost = data.cost;
                                    let originQty = data.totalProduct;

                                    $('#barangqty_onhand').val(originQty);
                                    $('#barangadjust_cost').val(cost);
                                }
                            }
                        });
                    }
                }

                document.getElementById('barangqty_actual').onchange = function(e){
					let  select = e.target;
                    let origin = document.getElementById('barangqty_onhand').value;
					let adjusted = document.getElementById('barangqty_actual').value;

                    let difference = origin - adjusted;

                    if(difference < 0){

                        $('#barangadjust_cost').prop('readonly', false);
                    } else {
                        $('#barangadjust_cost').prop('readonly', true);
                    }
				}

			})";


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
			#$this->load_js[] = asset("js/stock_opname.js");



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

			if (!Request::get('opname_date')){
				CRUDBooster::redirect(CRUDBooster::mainpath("add"),"Silahkan Isi Tanggal Opname","info");
			}

			$code = 'OP-';

			$sq = DB::table('stock_opnames')->max('id');
			$year = substr(date("y"),-2);
			$month = date("m");
			$no = str_pad($sq+1,4,"0",STR_PAD_LEFT);
			$postdata['opname_number'] = $code.$supplier.$year.$month.$no;
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
			$this->opnameRepositoy->updateActualStock($id);

			$opnameDetail = StockOpnameDetail::where('stock_opname_id',$id)
									->join('product_locations','product_locations.id','product_location_id')
									->join('products','products.id','product_locations.product_id')
									->get();

		   foreach($opnameDetail as $item){
				$this->productRepository->updateTotalStockAllLocation($item['product_id']);
		   }

           // Journal
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
			$this->opnameRepositoy->updateActualStock($id);

			$opnameDetail = StockOpnameDetail::where('stock_opname_id',$id)
									->join('product_locations','product_locations.id','product_location_id')
									->join('products','products.id','product_locations.product_id')
									->get();

		   foreach($opnameDetail as $item){
				$this->productRepository->updateTotalStockAllLocation($item['product_id']);
		   }
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
