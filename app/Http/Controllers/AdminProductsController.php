<?php namespace App\Http\Controllers;

use App\Repositories\ProductRepository;
use App\Models\{
	Product,
	ProductLocation
};
use Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use CRUDBooster;

class AdminProductsController extends \crocodicstudio\crudbooster\controllers\CBController {

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
			$this->button_add = true;
			$this->button_edit = true;
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
			#$this->col[] = ["label"=>"Supplier","name"=>"vendor_id","join"=>"vendors,name"];
			$this->col[] = ["label"=>"Kode","name"=>"code"];
			$this->col[] = ["label"=>"Nama","name"=>"name"];
			#$this->col[] = ["label"=>"Supplier","name"=>"vendor_id","join"=>"vendors,name"];
			$this->col[] = ["label"=>"Kategori","name"=>"category_id","join"=>"product_categories,name"];
			$this->col[] = ["label"=>"Brand","name"=>"brand_id","join"=>"product_brands,name"];
			$this->col[] = ["label"=>"Biaya","name"=>"product_cost"];
			$this->col[] = ["label"=>"Harga","name"=>"product_price","callback_php"=>'number_format($row->product_price)'];
			$this->col[] = ["label"=>"Ket","name"=>"description"];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Nama','name'=>'name','type'=>'text','validation'=>'required|string|min:3|max:70','width'=>'col-sm-10'];
			#$this->form[] = ['label'=>'Supplier','name'=>'vendor_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'vendors,name'];
			$this->form[] = ['label'=>'Kategori','name'=>'category_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'product_categories,name'];
			$this->form[] = ['label'=>'Brand','name'=>'brand_id','type'=>'select2','validation'=>'nullable|integer|min:0','width'=>'col-sm-10','datatable'=>'product_brands,name'];
			$this->form[] = ['label'=>'Biaya','name'=>'product_cost','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Harga','name'=>'product_price','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Jumlah','name'=>'qty_onhand','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Jumlah','name'=>'qty_onhand','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Jumlah Alokasi','name'=>'qty_allocated','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Jumlah Terkirim','name'=>'qty_shipped','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Keterangan','name'=>'description','type'=>'textarea','validation'=>'nullable|string|min:3|max:5000','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Track Lot No','name'=>'is_track_lot_number','type'=>'radio','dataenum'=>'0|No;1|Yes','width'=>'col-sm-10'];
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
			$this->sub_module[] = ['label'=>'Photo','path'=>'product_photos','parent_columns'=>'code,name','foreign_key'=>'product_id','button_color'=>'success','button_icon'=>'fa fa-image'] ;



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
	       // $this->index_statistic = array();
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

			// $payload = [
			// 	'product_id' => $product->id,
			// 	'code' -> $product->code,
			// ]
			// $product_item DB::table('item_products')=

			$this->product->updateStokByProductEntry($id);

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

		public function syncInternalStock(){
			$this->product->syncInternalStock();
		}

        public function findProductByLocation(Request $request){
            $locationId = $request->locationId;
            $productLocationId = $request->productLocationId;

            $product = DB::table('product_locations')
                            //->selectRaw('coalesce(SUM(qty_onhand),0) as totalProduct, coalesce(SUM(product_price),0) as cost, AVG(product_price) as average,product_price as price')
                            ->select('qty_onhand','product_price')
							->where('id',$productLocationId)->first();
            $response = [];

            if($product){
                $response = [
					'lot' => $product,
                    'totalProduct' => $product->qty_onhand,
                    'cost' => $product->product_price,
                    

                ];
            }
            return response()->json($response);
        }
		public function findProductItemPurchase($purchaseId){
			$data = $this->product->findProductItemPurchase($purchaseId);

			return response()->json($data);
		}

		public function findProductLocationByID($id){

			$data = ProductLocation::where('id',$id)->first();
			return response()->json($data);
		}
		public function findProductLocationItem(Request $request){
			$q = $request->input('q');
			$whLocationId = $request->input('whLocationId');
			$ids = $q;
			

			$data = $this->product->findProductLocationItem($ids,$whLocationId);

			return response()->json($data);
		}
		public function findProductItem(Request $request){
			$q = $request->input('q');
			$term = trim($q);

			$brand = $this->product->findProductItem($term);
			return response()->json($brand);
		}

		public function findProductCategory(Request $request){

			$q = $request->input('q');
			$term = trim($q);
			$category = $this->product->findProductCategory($term);

			return response()->json($category);
		}
		public function findProductBrand(Request $request){
			$q = $request->input('q');
			$term = trim($q);
			$brand = $this->product->findProductBrand($term);
			return response()->json($brand);
		}

		public function updateTotalStockAllLocation($id){
			$update = $this->product->updateTotalStockAllLocation($id);
		}
		public function getItems(Request $requst){

			$sort_by 		= Request::get('sortby');
			$sort_type  	= Request::get('sort_type');
			$filter      	= Request::get('query');
			$category      	= Request::get('category');

			$query = str_replace(" ", "%", $query);

			$data = DB::table('products as t1')
			          ->select('t2.id as id','t2.product_id','t1.name','t1.category_id','t1.product_price','t2.wh_location_id')
					  ->addSelect('t3.wh_location_name','t4.name as caregory_name')
					  ->join(DB::raw('(SELECT id, product_id, wh_location_id,qty_onhand FROM product_locations) t2'), function($join) {
								$join->on('t1.id','=','t2.product_id');
								$join->where('t2.wh_location_id',3);
								$join->where('t2.qty_onhand','>',0);
							    $join->orderBy('t2.qty_onhand','desc');

					  })
					  ->join('wh_locations as t3','t3.id','t2.wh_location_id')
					  ->join('product_categories as t4','t4.id','t1.category_id')
					  ->when($filter, function($query) use ($filter){
									return $query->where('t1.name','like','%'.$filter.'%');
								 })
					  ->when($category, function($query) use ($category){
							if($category != 'all'){
								return $query->where('t4.id',$category);
							}
							else {
								return $query;
							}
					   })
					  ->groupBy('t2.id')->get();

			$items = $data->map(function($product) {
				return [
				   'id' => $product->id,
				   'name'=> $product->name,
				   'category_id' => $product->category_id,
				   'category_name' => $product->category_name,
				   'product_price' => $product->product_price,
				   'wh_location_id' => $product->wh_location_id,
				   'wh_location_name' => $product->wh_location_name,
				   'product_price_format' => 'Rp. '.number_format($product->product_price)
				];
			 });

			$data = [
				'data' => $items
			];
			return response()->json($data);


		}
	    //By the way, you can still create your own method in here... :)
	}
