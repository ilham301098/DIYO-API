<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\InventoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\SalesController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/



Route::middleware('api_key')->group(function() {

    Route::get('/inventories', [InventoryController::class, 'list']);
    Route::get('/products', [ProductController::class, 'list']);
    Route::get('/sales', [SalesController::class, 'list']);
    Route::get('/sales/{sales_id}', [SalesController::class, 'detail']);

});

