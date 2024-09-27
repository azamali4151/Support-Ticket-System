<?php

namespace App\Http\Controllers\task_report;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Session;
use App\Models\TaskReportModel;
use DB;
use Auth;
use Mail;
use Symfony\Component\Console\Input\Input;

class TaskReportController extends Controller
{
  
    public function taskReportIndex()
    {
        $header = array(
            'pageTitle' => 'Task Report',
            'tableTitle' => ''
        );

        $results = DB::table('task_report as tr')
        ->leftJoin('priority as p','p.id','=','tr.task_priority_id')
        ->select('tr.*','p.name as task_priority')
        ->orderBy('tr.task_id','desc')
        ->get();

        return view('task_report.index',compact('header','results'));
    }

    public function editTask($id)
    {
        $header = array(
            'pageTitle' => 'Task Report',
            'tableTitle' => 'Task Report List'
        );
        
        $result = DB::table('task_report')->select('*')->where('task_id',$id)->first();

        return view('task_report.update', compact('header', 'result'));

    }
   
    public function update(Request $request)
    {
        TaskReportModel::updateTaskAssign($request);
        Session::flash('success', 'Data Updated successfully!');
        return redirect()->route('taskAssignIndex');
    }
    
    public function updateTask(Request $request)
    {
        TaskReportModel::updateTask($request);
        Session::flash('success', 'Data Updated successfully!');
        return redirect()->route('taskReportIndex');
    }
   
}
