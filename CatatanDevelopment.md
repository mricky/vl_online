# Purchase Order
- Receive Date -> No Time  Delivery Data


# Receive Barang
Penerimaan Barang di generate saat order status
1 to Process

---------------
Status
1. Process, / Ready
2. Done

Activity 
- RFQ
- Purchase Order (Confirm Order)
- Print RFQ
- Receive Product - to Process
  Demand, Done 
  Pilihan WH/Stock
  Jika Selisih
  - Buat Back Order / No Back order
  - Print Delivery Slip
  - Save Done + on Hand

- Back Order Of (No Receive)
  Source Document





good_receive_details
- add demand qty -> dari po
-
- Dampak Ke stok
- Dampak Ke Akunting


# Default Warehouse

product_locations
- product
- good_receive_id
- wh_location_id
- qty_onhand
- created_by
- created_at
- updated_by
- updated_at


#CMD
SHOW TRIGGERS
DROP TRIGGER IF EXISTS product_stock_insert;
DROP TRIGGER IF EXISTS product_stock_delete; 

#CURL API
Update Stok
http://vl_online.test/syncInternalStock
http://vl_online.test/find-product-brand?q=AMINA
http://vl_online.test/find-product-category?q=AMINA
# SALES
Product
Product Lokasi

# Debug
echo '<pre>'; print(); echo '<pre>'; exit;

# Fix View
DROP VIEW IF EXISTS `view_product_location`;
CREATE VIEW `view_product_location` AS select `product_locations`.`id` AS `id`,`products`.`name` AS `name`,`product_locations`.`product_id` AS `product_id`,`product_locations`.`wh_location_id` AS `wh_location_id`,`wh_locations`.`wh_location_name`,`product_locations`.`qty_onhand`,`vendors`.`name` as `vendor_name`, 
IF(`product_locations`.`good_receipt_id` IS NOT NULL, concat('Supplier : ',`vendors`.`name`,' Lokasi : ',convert(`wh_locations`.`wh_location_name` using utf8mb4),' Jumlah : ',`product_locations`.`qty_onhand`),
concat('Supplier : No Receive, Lokasi : ',convert(`wh_locations`.`wh_location_name` using utf8mb4),' Jumlah : ',`product_locations`.`qty_onhand`))  AS `product_location`
FROM ((((`product_locations` join `products` on((`products`.`id` = `product_locations`.`product_id`))) join `wh_locations` on((`wh_locations`.`id` = `product_locations`.`wh_location_id`))) left join `goods_receipt` on((`goods_receipt`.`id` = `product_locations`.`good_receipt_id`))) left join `vendors` on((`goods_receipt`.`vendor_id` = `vendors`.`id`))) ;

# Fix Library 
## Issue Dropdown parent select
CBController.php
 public function getDataTable()
    {
        $table = Request::get('table');
        $label = Request::get('label');
        $datatableWhere = urldecode(Request::get('datatable_where'));
        $foreign_key_name = Request::get('fk_name');
        $foreign_key_value = Request::get('fk_value');
        
        $foreign_key_value = preg_replace('/\D/', '', $foreign_key_value);

        if ($table && $label && $foreign_key_name && $foreign_key_value) {
            $query = DB::table($table);
            // if ($datatableWhere) {
            //     $query->whereRaw($datatableWhere);
            // }
            $query->select('id as select_value', $label.' as select_label');
            $query->where($foreign_key_name,$foreign_key_value);
            $query->orderby($label, 'asc');
       
            return response()->json($query->get());
        } else {
            return response()->json([]);
        }
    }
## Issue Unah Label ke Link Url 
vendor/crocodicstudio/crudbooster/src/views/default/index.php
      <div id='box-statistic' class='row'>
            @foreach($index_statistic as $stat)
                <div class="{{ ($stat['width'])?:'col-sm-3' }}">
                    <div class="small-box bg-{{ $stat['color']?:'red' }}">
                        <div class="inner">
                            <h3>{{ $stat['count'] }}</h3>
                            <a href={{ $stat['url'] }}>{{ $stat['label'] }}</a>
                        </div>
                        <div class="icon">
                            <i class="{{ $stat['icon'] }}"></i>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
## Issue filter between advance search
use Illuminate\Support\Carbon;
   $value[0]=Carbon::parse($value[0]);
   $value[1]=Carbon::parse($value[1]);
   $result->whereBetween($key, $value);
## Menambahkan select2multi CBCrudbooster

# Trigger Total Pesan, Qty In, Leave Over di Purchase Order

# Sinkronisasi Data Existing

# Purchase Order
  ## add
  ## edit
  ## delete
# Good Receipt

# ISSUE minus di penerimaan di server 
Purchase
   $this->goodReceipt->automaticReceiptEntry($event->purchase->id);
   $this->goodReceipt->syncPurchaseItemQty($event->purchase->id);
   $this->purchaseOrder->updateDetailPurchaseOrder($event->purchase->id);
backorderReceiptEntry
updateStokLocation
syncPurchaseItemQty


# Flow
Product
- simpan product dengan qty 0 (updateStokByProductEntry), no purchase_order, n good_receip_id -> ok
- simpan product dengan qty 1
- post post condition harus masuk ke product location wh/location (ok)

Purchase
- Beli Barang qty 20
-- Otomatis masuk ke vendor 20 -> with purchase_order_id, no good_receive, no product_price
-- Kondisi Good receive id = null
-- Terima Barang Request 10, terima 5 kondisi ?

Clear data
truncate purchase_orders;
truncate purchase_order_details;

truncate goods_receipt;
truncate goods_receipt_details;

truncate sales_orders;
truncate sales_order_details;

truncate journal_transactions;
truncate journal_details;

truncate stock_opnames;
truncate stock_opname_details;

truncate product_locations;


update table_neraca set debit=0, credit=0, ending_balance=0;

update products set product_price=0, qty_onhand=0;
