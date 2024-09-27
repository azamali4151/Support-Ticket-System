<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;
use Auth;
use Mail;

class TaskReportModel extends Model
{
    use HasFactory;
    protected $table = 'task_report';
    protected $primaryKey = 'task_id';
   
    public static function updateTask($request){

        $id = $request->task_id;

        if($id && DB::table('task_report')->where('task_id', $id)->first()){
            $taskData = array(
                "task_title"           => $request->task_title,
                "task_desc"            => $request->task_desc,
                "task_complete"        => $request->task_complete,
                "fdate_change_reason"  => !empty($request->fdate_change_reason)?$request->fdate_change_reason:"",
                "assign_date"          => date('Y-m-d',strtotime($request->assign_date)),
                "forecast_date"        => date('Y-m-d',strtotime($request->forecast_date)),
                "active_status"        => $request->active_status,
                "updated_by"           => Auth::user()->id,
                "updated_at"           => date('Y-m-d H:i:s'),
            );
        
            DB::beginTransaction();
            try {
                DB::table('task_report')
                    ->where('task_id', $id)
                    ->update($taskData);

                if($request->task_complete =='100'){
                    $ticketId = DB::table('task_report')->select('ticket_id')->where('task_id',$id)->first();
                    if(!empty($ticketId->ticket_id)){
                        $updateTicketStatus = array(
                            'ticket_status'=>'3',
                            "task_complete"        => $request->task_complete,
                            'resolution'=>$request->task_resolution
                        );
                        DB::table('tickets')
                            ->where('id', $ticketId->ticket_id)
                            ->update($updateTicketStatus);
                    }
                }

                DB::commit();
            } catch (\Throwable $e) {
                DB::rollback();
                throw $e;
            }

        }

    }

}