<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/register', [AuthController::class,'register']);

Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::get('/profile', function(Request $request) {
        return auth()->user();
    });
    Route::get('/update', [UserController::class, 'update'])->name('update');
    Route::post('/logout', [AuthController::class, 'logout']);
});

Route::group(['middleware'=>['guest']], function () {
    Route::get('login', [AuthController::class, 'login'])->name('login');
    Route::get('verify-login',[AuthController::class,'verifyLogin'])->name('verify-login');
});
