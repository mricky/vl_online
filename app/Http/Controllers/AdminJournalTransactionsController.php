<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;

	class AdminJournalTransactionsController extends \crocodicstudio\crudbooster\controllers\CBController {

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
			$this->button_export = true;
			$this->table = "journal_transactions";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Tgl Transaksi","name"=>"transaction_date"];
            #$this->col[] = ["label"=>"Jenis","name"=>"transaction_type","join"=>"transaction_types,name"];
			$this->col[] = ["label"=>"No Transaksi","name"=>"transaction_number"];
			$this->col[] = ["label"=>"Ref No","name"=>"ref_no"];
			$this->col[] = ["label"=>"Debit","name"=>"total_debit"];
			$this->col[] = ["label"=>"Kredit","name"=>"total_credit"];
			$this->col[] = ["label"=>"Memo","name"=>"memo"];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Tgl Transaksi','name'=>'transaction_date','type'=>'date','validation'=>'required|date','width'=>'col-sm-5'];
			$this->form[] = ['label'=>'Ref No','name'=>'ref_no','type'=>'text','validation'=>'nullable|min:1|max:255','width'=>'col-sm-5'];
			// $this->form[] = [
			// 	'label'=>'Akun','name'=>'account_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-5','datatable'=>'chart_of_accounts,account,id','datatable_format' => 'code,\' - \',account'
			// ];
			// $this->form[] = [
			// 	'label'=>'Akun','name'=>'account_reverse_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-5','datatable'=>'chart_of_accounts,account,id','datatable_format' => 'code,\' - \',account'
			// ];
			$columns = [];

			$columns[] = ['label'=>'Akun','name'=>'account_id','type'=>'select','validation'=>'required|integer|min:0','width'=>'col-sm-5','datatable'=>'chart_of_accounts,account,id'];
			$columns[] = ["label"=>"Debit","name"=>"debit",'type'=>'number'];
			$columns[] = ["label"=>"Kredit","name"=>"credit",'type'=>'number'];

			$this->form[] = ['label'=>'Detail Jurnal','name'=>'journal_details','type'=>'child','columns'=>$columns,'width'=>'col-sm-1','table'=>'journal_details','foreign_key'=>'journal_id'];


			$this->form[] = ['label'=>'Total Debit','name'=>'total_debit','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-5'];
			$this->form[] = ['label'=>'Total Kredit','name'=>'total_credit','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-5'];

			$this->form[] = ['label'=>'Memo','name'=>'memo','type'=>'text','validation'=>'nullable|min:1|max:255','width'=>'col-sm-5'];
			# END FORM DO NOT REMOVE THIS LINE

			# OLD START FORM
			//$this->form = [];
			//$this->form[] = ["label"=>"Transaction Type Id","name"=>"transaction_type_id","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"transaction_type,id"];
			//$this->form[] = ["label"=>"Transaction Date","name"=>"transaction_date","type"=>"date","required"=>TRUE,"validation"=>"required|date"];
			//$this->form[] = ["label"=>"Transaction Number","name"=>"transaction_number","type"=>"text","required"=>TRUE,"validation"=>"required|min:1|max:255"];
			//$this->form[] = ["label"=>"Entry No","name"=>"entry_no","type"=>"number","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"Ref No","name"=>"ref_no","type"=>"text","required"=>TRUE,"validation"=>"required|min:1|max:255"];
			//$this->form[] = ["label"=>"Account Id","name"=>"account_id","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"account,id"];
			//$this->form[] = ["label"=>"D K","name"=>"d_k","type"=>"text","required"=>TRUE,"validation"=>"required|min:1|max:255"];
			//$this->form[] = ["label"=>"Account Reverse Id","name"=>"account_reverse_id","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"account_reverse,id"];
			//$this->form[] = ["label"=>"Total","name"=>"total","type"=>"number","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"Memo","name"=>"memo","type"=>"text","required"=>TRUE,"validation"=>"required|min:1|max:255"];
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



	        /*
	        | ----------------------------------------------------------------------
	        | Add javascript at body
	        | ----------------------------------------------------------------------
	        | javascript code in the variable
	        | $this->script_js = "function() { ... }";
	        |
	        */
	        $this->script_js =  "
			$(function(){
				setInterval(function(){
						var totalDebit = 0;
						var totalKredit = 0;

						$('#table-detailjurnal tbody .debit').each(function(){
							var debit = parseInt($(this).text());
							totalDebit += debit;

						});

						$('#table-detailjurnal tbody .credit').each(function(){
							var kredit = parseInt($(this).text());
							totalKredit += kredit;

						});

						$('#total_debit').val(totalDebit);
						$('#total_credit').val(totalKredit);
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
			$query->where('transaction_type', 7);
            #$query->groupBy('transaction_type');
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

			if($postdata['total_debit'] != $postdata['total_credit']){
				CRUDBooster::redirect(CRUDBooster::mainpath('add'),"Total Debit Kredit tidak balance","warning");
			}
            $transactionType =  DB::table('transaction_types')->where('code','07')->first();

		    $sq = DB::table('journal_transactions')->max('id');

			$year = substr(date("y"),-2);
			$month = date("m");
			$no = str_pad($sq+1,4,"0",STR_PAD_LEFT);
            $postdata['transaction_type'] = $transactionType->id;
			$postdata['entry_no'] = $no;
			$postdata['transaction_date'] = now();
			$postdata['transaction_number'] = 'GL-'.$year.$month.'-'.$no;
			$postdata['memo'] = 'Jurnal Manual';
            $postdata['is_manual'] = 1;
            $postdata['transaction_type'] = 7;
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
			DB::table('journal_details')->where('journal_id',$id)->delete();
	    }



	    //By the way, you can still create your own method in here... :)


	}
