<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\Api\ClientController;
use Illuminate\Support\Facades\Route;

Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function () {
    Route::post('login', [AuthController::class, 'login']);
    Route::post('logout', [AuthController::class, 'logout']);
    Route::post('refresh', [AuthController::class, 'refresh']);
    Route::post('me', [AuthController::class, 'me']);
});

Route::post('/clients', [ClientController::class, 'store']);
Route::get('/clients', [ClientController::class, 'index']);
Route::get('/clients/{id}', [ClientController::class, 'show']);
Route::delete('/clients/{id}', [ClientController::class, 'destroy']);
Route::patch('/clients/{id}', [ClientController::class, 'update']);
