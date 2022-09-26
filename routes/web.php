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
Route::get('/find-customer','AdminCustomersController@findCustomer');
Route::get('/searchItemLinePO/{po_id}','AdminGoodsReceiptController@searchItemLinePO');
Route::get('/syncInternalStock','AdminProductsController@syncInternalStock');
Route::get('/find-product-item','AdminProductsController@findProductItem');
Route::get('/find-product-category','AdminProductsController@findProductCategory');
Route::get('/find-product-brand','AdminProductsController@findProductBrand');