<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MainController;
use App\Http\Controllers\Auth\LoginRegisterController;

/*Route::get('/', function () {
    return view('welcome');
});*/
Route::get('/', [MainController::class, 'main'])->name('public_announcement');
//Route::get('/login', [MainController::class, 'main']);
Route::post('/getAllAnnouncement', [MainController::class, 'allanouncement']);

Route::controller(LoginRegisterController::class)->group(function() {
    //Route::get('/register', 'register')->name('register');
    Route::post('/store', 'store')->name('store');
    //Route::get('/login', 'login')->name('login');
    Route::post('/authenticate', 'authenticate')->name('authenticate');
    Route::get('/dashboard', 'dashboard')->name('dashboard');
    Route::post('/logout', 'logout')->name('logout');
});

//Route::middleware(CheckAuthMiddleware::class)->group(function () {
//    Route::get('/myAnnouncementList', [MainController::class, 'myannouncement'])->name('myannouncement');
//});
Route::post('/myAnnouncementList', [MainController::class, 'myannouncement'])->name('myannouncement');
Route::post('/saveMyAnnouncement', [MainController::class, 'saveannouncement'])->name('saveannouncement');
Route::post('/updateMyAnnouncement', [MainController::class, 'updateannouncement'])->name('updateannouncement');
Route::post('/deleteMyAnnouncement', [MainController::class, 'deleteannouncement'])->name('deleteannouncement');
Route::post('/editMyAnnouncement', [MainController::class, 'editannouncement'])->name('editannouncement');
