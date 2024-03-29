<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });
# Batch Syncronize
Route::get('/sync-purchase-order/','AdminPurchaseOrderDetails49Controller@syncPurchaseItemInfo');
Route::get('/sync-sales-order/{id}','AdminSalesOrdersController@syncSalesDelivery');

#POINT OF SALES
Route::post('/doPrint','AdminSalesOrders47Controller@doPrint');
Route::post('/save-cashier','AdminSalesOrders47Controller@saveCashier');
Route::get('/fetchItems/filter','AdminProductsController@getItems');

Route::get('/update-total-qty/{productId}','AdminProductsController@updateTotalStockAllLocation');
Route::get('/sync-purchase-item','AdminGoodsReceiptController@syncPurchaseItemQty');
Route::get('/testItemDiferrence/{id}','AdminGoodsReceiptController@getDifferenceItem');
Route::get('/find-vendor','AdminVendorsController@findVendor');
Route::get('/find-customer','AdminCustomersController@findCustomer');
Route::get('/searchItemLinePO/{po_id}','AdminGoodsReceiptController@searchItemLinePO');
Route::get('/syncInternalStock','AdminProductsController@syncInternalStock');

# Products
Route::get('/find-product-location/{id}','AdminProductsController@findProductLocationByID');
Route::get('/find-product-location-item-purchase/{purchaseId}','AdminProductsController@findProductItemPurchase');
Route::get('/find-product-location-item','AdminProductsController@findProductLocationItem');
Route::get('/find-product-item','AdminProductsController@findProductItem');
Route::get('/find-product-category','AdminProductsController@findProductCategory');
Route::get('/find-product-brand','AdminProductsController@findProductBrand');
Route::post('/find-product-by-location','AdminProductsController@findProductByLocation');
#Dashboard
Route::get('/charts/penjualan','DashboardController@indexPenjualan');
Route::get('/charts/pembelian','DashboardController@indexPembelian');
Route::get('/charts/penerimaan','DashboardController@indexPenerimaan');
Route::get('/chart/fast-moving-items','DashboardController@indexItemFastMoving');
Route::get('/widget/total-items','DashboardController@totalItems');
