<?php
namespace App\Repositories;

use App\Models\{
    Product,
    ProductLocation,
    StockOpnameDetail,
    StockOpname,

};

use DB;
use CRUDBooster;
use Carbon\Carbon;

interface IStockOpname {
    public function updateActualStock($stockId);
}

class StockOpnameRepository implements IStockOpname {

    public function updateActualStock($stockId)
    {
        $opname = StockOpname::findOrFail($stockId);

        $opnameDetail = StockOpnameDetail::select(
                DB::raw('sum(qty_onhand) as total_system'),
                DB::raw('sum(qty_actual) as total_actual'),
                DB::raw('sum(qty_onhand - qty_actual) as total_difference')
        )->where('stock_opname_id',$stockId)->first();
        
      
         $opname->total_onhand = $opnameDetail->total_system;
         $opname->total_actual = $opnameDetail->total_actual;
         $opname->total_difference = $opnameDetail->total_difference;
         $opname->save();
        
         foreach($opname->details as $item){
           
            $prodLocation = ProductLocation::findOrFail($item->product_location_id);
            $prodLocation->qty_onhand = $item->qty_actual;
            $prodLocation->product_price = $item->adjust_cost;
            $prodLocation->updated_by =  CRUDBooster::myId() ?? 1;
            $prodLocation->save();
            
            // TOTAL
            #$totalWhStock = $prodLocation->sum('qty_onhand'); 

            #die($totalWhStock); exit;
            // PRODUCT WHERE PRODUCT / WL_LOCATION
            
         }

         // update barang
         #exit;
        # 1update total on stokopname
        # update product by product location
    }
}