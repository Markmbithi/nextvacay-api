<?php

use App\Http\Controllers\Auth\LoginController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\UserController;

Route::get('/dashboard',[DashboardController::class,'index'])->name('dashboard');

Route::get('/register',[RegisterController::class,'index'])->name('register');
Route::post('/register',[RegisterController::class,'store'])->name('register');

Route::get('/profile',[UserController::class,'viewProfile'])->name('profile');
Route::post('/update-profile',[UserController::class,'updateProfile'])->name('update-profile');

Route::get('/login',[LoginController::class,'index'])->name('login');
Route::post('/login',[LoginController::class,'login'])->name('login');
Route::get('/logout',[LoginController::class,'logout'])->name('logout');

Route::get('/loginsuccess', [LoginController::class,'loginsuccess'])->name('loginsuccess');
Route::get('verify-login',[LoginController::class,'verifyLogin'])->name('verify-login');

Route::get('/loginfail', [LoginController::class,'loginfail'])->name('loginfail');

Route::get('/update',[UserController::class,'index'])->name('update');
Route::post('/update',[UserController::class,'update'])->name('update');
