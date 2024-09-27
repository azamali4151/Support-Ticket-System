<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ticket\TicketController;
use App\Http\Controllers\security_access\ModuleManageController;
use App\Http\Controllers\task_report\TaskReportController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('auth.login');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    // user create
    Route::get('/userIndex', [ModuleManageController::class, 'userIndex'])->name('userIndex');
    Route::get('/createUser', [ModuleManageController::class, 'createUser'])->name('createUser');
    Route::post('/storeUser', [ModuleManageController::class, 'store'])->name('store');
    Route::match(array('get','post'),'/updateUser/{userId}', [ModuleManageController::class, 'updateUser'])->name('updateUser');

    // ticket route start here 
    Route::get('/ticket', [TicketController::class, 'index'])->name('ticket');
    Route::get('/createTicket', [TicketController::class, 'create'])->name('createTicket');
    Route::post('/storeTicket', [TicketController::class, 'store'])->name('storeTicket');
    Route::get('/updateTicketAssign/{id}', [TicketController::class, 'edit'])->name('updateTicketAssign');
    Route::post('/editTicketInfo', [TicketController::class, 'editTicketInfo'])->name('editTicketInfo');
    Route::post('/updateTicketBasicInfo', [TicketController::class, 'updateBasicInfo'])->name('updateTicketBasicInfo');
    Route::post('/editStatusInfo', [TicketController::class, 'editStatusInfo'])->name('editStatusInfo');
    Route::post('/updateTicketStatusInfo', [TicketController::class, 'updateStatusInfo'])->name('updateTicketStatusInfo');
    Route::post('/editAssignInfo', [TicketController::class, 'editAssignInfo'])->name('editAssignInfo');
    Route::post('/updateTicketAssignInfo', [TicketController::class, 'updateAssignInfo'])->name('updateTicketAssignInfo');

    // task report 
    Route::get('/taskReportIndex', [TaskReportController::class, 'taskReportIndex'])->name('taskReportIndex');
    Route::get('/updateTask/{id}', [TaskReportController::class, 'editTask'])->name('updateTask');
    Route::post('/updateTaskInfo', [TaskReportController::class, 'updateTask'])->name('updateTaskInfo');
});

require __DIR__.'/auth.php';
