<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;
use Auth;

class TicketModel extends Model
{
    use HasFactory;
    protected $table = 'tickets';
    protected $primaryKey = 'id';

    /**
     * This method use for save class routine
     * @param Request $request
     *
     */
    public static function createTicket($request){
        $maxTicketNo = DB::table('tickets')->max('id')+1;
        $ticketNo = date('ymd').'#'.$maxTicketNo;
        

        $ticketData = array(
            "ticket_no"          =>  $ticketNo,
            "ticket_title"       => $request->ticket_title,
            "ticket_desc"        => $request->ticket_desc,
            'priority_id'        => $request->priority_id,
            'request_type_id'    => $request->request_type_id,
            'request_mode_id'    => $request->request_mode_id,
            'ticket_status'      => '1',
            "support_user_id"    => Auth::user()->id,
            "created_by"         => Auth::user()->id,
            "created_at"         => date('Y-m-d H:i:s'),
            "ticket_create_date"        => date('Y-m-d'),
        );

        DB::beginTransaction();
        try {
            $ticketId = DB::table('tickets')->insertGetId($ticketData);
            DB::commit();

            // ticket attachment store
            if($request->file('ticket_attachment')){
                $files = $request->file('ticket_attachment');
                foreach ($files as $file) {
                    
                    $name = $ticketId.'-'.$file->getClientOriginalName();
                    $exten = $file->getClientOriginalExtension();
                    if($exten == "docx" || $exten == "xlsx" || $exten == "doc" || $exten == "pdf" || $exten == "bmp" || $exten == "zip" ){
                        $file->move(public_path() . '/uploads/ticket_image/', $name);
                    }else{
                        $file->move(public_path() . '/uploads/ticket_image/', $name);
                    }

                    // Save the filename to the database

                    $ticketAttachData = array(
                        "ticket_id"    => $ticketId,
                        "ticket_attachment"      => '/uploads/ticket_image/'.$name,
                        "created_by"        => Auth::user()->id,
                        "created_at"        => date('Y-m-d H:i:s'),
                    );
                    $data = DB::table('ticket_attachment')->insert($ticketAttachData);

                }
            }

            return $ticketId;
        } catch (\Throwable $e) {
            DB::rollback();
            throw $e;
            exit;
        }
    }
    
    public static function updateBasicInfo($request){
        $id = $request->ticket_id;

        if($id && DB::table('tickets')->where('id', $id)->first()){

            $ticketData = array(
                "ticket_title"        => $request->ticket_title,
                "ticket_desc"        => $request->ticket_desc,
                "updated_by"        => Auth::user()->id,
                "updated_at"        => date('Y-m-d H:i:s'),
            );

            DB::beginTransaction();
            try {
                DB::table('tickets')
                    ->where('id', $id)
                    ->update($ticketData);

                DB::commit();
            } catch (\Throwable $e) {
                DB::rollback();
                throw $e;
            }
        }
    }
   
    public static function updateStatusInfo($request){
        $id = $request->ticket_id;

        if($id && DB::table('tickets')->where('id', $id)->first()){
            $ticketData = array(
                "ticket_status"          => $request->ticket_status,
                "request_type_id"          => $request->request_type_id,
                "priority_id"        => $request->priority_id,
                "request_mode_id"        => $request->request_mode_id,
                "remarks"        => $request->remarks,
                "updated_by"        => Auth::user()->id,
                "updated_at"        => date('Y-m-d H:i:s'),
            );

            DB::beginTransaction();
            try {
                DB::table('tickets')
                    ->where('id', $id)
                    ->update($ticketData);

                DB::commit();
            } catch (\Throwable $e) {
                DB::rollback();
                throw $e;
            }
        }
    }
    public static function updateAssignInfo($request){
        $id = $request->ticket_id;

        if($id && DB::table('tickets')->where('id', $id)->first()){
            $ticketData = array(
                "employee_id"          => $request->employee_id,
                "ticket_status"          => '2',
                'forecast_date'       => date('Y-m-d',strtotime($request->forecast_date)),
                "assign_date"         => date('Y-m-d H:i:s'),
                "updated_by"        => Auth::user()->id,
                "updated_at"        => date('Y-m-d H:i:s'),
            );

            DB::beginTransaction();
            try {
                DB::table('tickets')
                    ->where('id', $id)
                    ->update($ticketData);

                $checkAssingInfo = DB::table('task_report')->select('*')->where('ticket_id',$id)->first();
                if(empty($checkAssingInfo)){
                    $ticktInfo = DB::table('tickets')->where('id', $id)->first();
                    
                    $taskData = array(
                        "task_title"          => $ticktInfo->ticket_title,
                        "task_desc"           => $ticktInfo->ticket_desc,
                        "employee_id"         => $request->employee_id,
                        "assign_by"           => Auth::user()->id,
                        "assign_person_name"  => Auth::user()->name,
                        "assign_date"         => date('Y-m-d'),
                        "task_create_date"    => date('Y-m-d'),
                        'forecast_date'       => date('Y-m-d',strtotime($request->forecast_date)),
                        'task_priority_id'    => $ticktInfo->priority_id,
                        'ticket_id'           => $id,
                        'ticket_no'           => $ticktInfo->ticket_no,
                        'active_status'       => 1,
                        "created_by"          => Auth::user()->id,
                        "created_at"          => date('Y-m-d H:i:s'),
                    );
                    $data = DB::table('task_report')->insert($taskData);
                }

                DB::commit();
            } catch (\Throwable $e) {
                DB::rollback();
                throw $e;
            }

        }

    }

}
