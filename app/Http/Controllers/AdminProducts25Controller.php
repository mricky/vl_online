<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;
	use App\Repositories\ProductRepository;
	use App\Models\{
		Product,
		ProductLocation
	};
	class AdminProducts25Controller extends \crocodicstudio\crudbooster\controllers\CBController {

		private $product;
		public function __construct(ProductRepository $product)
        {
			 $this->product = $product;

        }

	    public function cbInit() {

			# START CONFIGURATION DO NOT REMOVE THIS LINE
			$this->title_field = "name";
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
			$this->table = "products";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Track Lot No","name"=>"is_track_lot_number","callback_php"=>'($row->is_track_lot_number==1)?"<span class=\"label label-success\">YES</span>":"<span class=\"label label-danger\">NO</span>"'];
			$this->col[] = ["label"=>"SKU","name"=>"code"];
			$this->col[] = ["label"=>"Nama","name"=>"name"];
			$this->col[] = ["label"=>"Kategori","name"=>"category_id","join"=>"product_categories,name"];
			$this->col[] = ["label"=>"Brand","name"=>"brand_id","join"=>"product_brands,name"];
			#$this->col[] = ["label"=>"Biaya","name"=>"product_cost","callback_php"=>'number_format($row->product_cost)'];
			#$this->col[] = ["label"=>"Harga","name"=>"product_price","callback_php"=>'number_format($row->product_price)'];
			$this->col[] = ["label"=>"Total Stok","name"=>"(SELECT COALESCE(SUM(product_locations.qty_onhand),0) FROM product_locations JOIN wh_locations on wh_locations.id = product_locations.wh_location_id  where product_id = products.id and wh_locations.wh_location_name = 'WH/Stock') + (SELECT COALESCE(SUM(product_locations.qty_onhand),0) FROM product_locations JOIN wh_locations on wh_locations.id = product_locations.wh_location_id  where product_id = products.id and wh_locations.wh_location_name = 'Partner Location/Vendor')  as qty_onhand"];
			$this->col[] = ["label"=>"Stok Vendor","name"=>"(SELECT COALESCE(SUM(product_locations.qty_onhand),0) FROM product_locations JOIN wh_locations on wh_locations.id = product_locations.wh_location_id  where product_id = products.id and wh_locations.wh_location_name = 'Partner Location/Vendor') as qty_vendor"];
			$this->col[] = ["label"=>"Stok Internal","name"=>"(SELECT COALESCE(SUM(product_locations.qty_onhand),0) FROM product_locations JOIN wh_locations on wh_locations.id = product_locations.wh_location_id  where product_id = products.id and wh_locations.wh_location_name = 'WH/Stock') as qty_internal"];
			//$this->col[] = ["label"=>"Penyimpanan","name"=>"is_store_vendor_location","callback_php"=>'($row->is_store_vendor_location==0)?"<span class=\"label label-default\">Internal</span>":"<span class=\"label label-danger\">Vendor</span>"'];
			$this->col[] = ["label"=>"Diubah Oleh","name"=>"updated_by","join"=>"cms_users,name"];
			// $this->col[] = ["label"=>"Qty Received","name"=>"qty_received"];
			// $this->col[] = ["label"=>"Qty Shipped","name"=>"qty_shipped"];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Nama','name'=>'name','type'=>'text','validation'=>'required|string|min:3|max:70','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Kategori','name'=>'category_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'product_categories,name'];
			$this->form[] = ['label'=>'Brand','name'=>'brand_id','type'=>'select2','validation'=>'nullable|integer|min:0','width'=>'col-sm-10','datatable'=>'product_brands,name'];
			#$this->form[] = ['label'=>'Biaya','readonly'=>'true','name'=>'product_cost','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			#$this->form[] = ['label'=>'Harga','readonly'=>'true','name'=>'product_price','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Jumlah','readonly'=>'true','name'=>'qty_onhand','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Jumlah Alokasi','name'=>'qty_allocated','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Jumlah Terkirim','name'=>'qty_shipped','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Keterangan','name'=>'description','type'=>'textarea','validation'=>'nullable|string|min:3|max:5000','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Track Lot No','name'=>'is_track_lot_number','type'=>'radio','dataenum'=>'0|No;1|Yes','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Penyimpanan','name'=>'is_store_vendor_location','type'=>'radio','dataenum'=>'0|Internal;1|Vendor','width'=>'col-sm-10'];
			# END FORM DO NOT REMOVE THIS LINE

			# OLD START FORM
			//$this->form = [];
			//$this->form[] = ['label'=>'Nama','name'=>'name','type'=>'text','validation'=>'required|string|min:3|max:70','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Supplier','name'=>'vendor_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'vendors,name'];
			//$this->form[] = ['label'=>'Kategori','name'=>'category_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'vendors,name'];
			//$this->form[] = ['label'=>'Brand','name'=>'brand_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'product_categories,name'];
			//$this->form[] = ['label'=>'Biaya','name'=>'product_cost','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Harga','name'=>'product_price','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Jumlah','name'=>'qty_onhand','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Jumlah Alokasi','name'=>'qty_allocated','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Jumlah Terkirim','name'=>'qty_shipped','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Keterangan','name'=>'description','type'=>'textarea','validation'=>'nullable|string|min:5|max:5000','width'=>'col-sm-10'];
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
			$this->sub_module[] = ['label'=>'Lokasi','path'=>'product_locations','parent_columns'=>'code,name','foreign_key'=>'product_id','button_color'=>'warning','button_icon'=>'fa fa-database'] ;
			$this->sub_module[] = ['label'=>'Photo','path'=>'product_photos','parent_columns'=>'code,name','foreign_key'=>'product_id','button_color'=>'success','button_icon'=>'fa fa-image'] ;

			//$this->sub_module[] = ['label'=>'Lot No','path'=>'product_items','parent_columns'=>'code,name','foreign_key'=>'product_id','button_color'=>'warning','button_icon'=>'fa fa-file'] ;


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
			$this->index_statistic[] = ['label'=>'Total Item','count'=>$this->product->getTotalItem(),'icon'=>'fa fa-file-text','color'=>'warning'];
			$this->index_statistic[] = ['label'=>'Total Category','count'=>number_format($this->product->getTotalCategory()),'icon'=>'fa fa-file-text','color'=>'danger'];
			$this->index_statistic[] = ['label'=>'Total Brand','count'=>number_format($this->product->getTotalBrand()),'icon'=>'fa fa-file-text','color'=>'danger'];




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
			$sq = DB::table('products')->max('id');

			$category = DB::table('product_categories')->where('id',$postdata['category_id'])->first()->name;
			$brand = DB::table('product_brands')->where('id',$postdata['brand_id'])->first()->name;

			$categoryCode = strtoupper(substr($category,0,3));
			$brandCode = strtoupper(substr($brand,0,3));
			$no = $sq+1;
			$postdata['code'] = $categoryCode.'-'.$brandCode.'-'.$no;

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
			// $product = DB::table('products')->where('id',$id)->first();
			// $payload = [
			// 	'product_id' => $product->id,
			// 	'code' -> $product->code,
			// ]
			// $product_item DB::table('item_products')=
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

			DB::table('products')->where('id',$id)->update([
				'updated_at' => now(),
				'updated_by' => CRUDBooster::myId()
			]);

			$product = Product::find($id);
			ProductLocation::where('product_id',$id)
											->where('wh_location_id',1)
											->whereNull('good_receipt_id')->update([
												'qty_onhand' => $product->qty_onhand
											]);

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
