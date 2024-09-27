<?php

namespace App\Http\Controllers\ticket;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use DB;
use Session;
use Auth;
use App\Models\TicketModel;
use Illuminate\Support\Facades\Mail;
use App\Jobs\SendMailJob;

class TicketController extends Controller
{
    public function index(){
        $header = array(
            'pageTitle' => 'Ticket',
            'tableTitle' => ''
        );

        $userId = Auth::user()->id;
        $userGroup = Auth::user()->user_group;

        $results = DB::table('tickets as tkt')
        ->leftJoin('priority as p','tkt.priority_id','=','p.id')
        ->leftJoin('request_status as s','tkt.ticket_status','=','s.id')
        ->leftJoin('users as u','tkt.created_by','=','u.id')
        ->select('tkt.ticket_no','tkt.ticket_title','p.name as ticket_piority','u.name as request_by',
        'tkt.assign_date','tkt.forecast_date','s.name as ticket_status','tkt.id','tkt.employee_id','tkt.task_complete')
        ->where('tkt.active_status',1);
        if($userGroup !='1'){
            $results->where('tkt.created_by',$userId);
        }

        $results = $results->orderBy('tkt.id','desc');
        $results = $results->get();

        return view('ticket.index',compact('header','results'));
    }

    public function create(Request $request){
        $header = array(
            'pageTitle' => 'Ticket',
            'tableTitle' => 'Ticket List'
        );

        $requestType = DB::table('request_type')->select('id','name')->where('active_status',1)->get();
        $priority =  DB::table('priority')->select('id','name')->where('active_status',1)->get();
        $requestMode =DB::table('request_mode')->select('id','name')->where('active_status',1)->get();

        return view('ticket.create', compact('header',  'requestType', 'priority', 'requestMode'));
    }

    public function store(Request $request){

        $ticketId =  TicketModel::createTicket($request);

        if( empty($request->file('ticket_attachment'))){
            dispatch(new SendMailJob((object)$request->all(),$ticketId));
        }
        
        Session::flash('success', 'Data Saved successfully!');
        return redirect()->route('ticket');
    }

    public function edit($id)
    {
        $header = array(
            'pageTitle' => 'Ticket',
            'tableTitle' => 'Ticket List'
        );
       
        $result = DB::table('tickets as tkt')
            ->select('tkt.*')
            ->where('id',$id)
            ->first();

        return view('ticket.update', compact('header', 'result'));

    }
    public  function editTicketInfo(Request $request){
        $ticketId = $request->ticketId;

        if(!empty($ticketId)){
            $ticketInfo = DB::table('tickets')
                ->select('*')
                ->where('id',$ticketId)
                ->first();

        return view('ticket.edit_ticket_basic_info', compact('ticketInfo'));

        }
    }

    public function updateBasicInfo(Request $request)
    {
        TicketModel::updateBasicInfo($request);
        Session::flash('success', 'Data Updated successfully!');
        return redirect()->route('ticket');
    }

    public  function editStatusInfo(Request $request){
        $ticketId = $request->ticketId;

        if(!empty($ticketId)){
            $ticketInfo = DB::table('tickets')
                ->select('*')
                ->where('id',$ticketId)
                ->first();

            $requestType = DB::table('request_type')->select('id','name')->where('active_status',1)->get();
            $priority =  DB::table('priority')->select('id','name')->where('active_status',1)->get();
            $requestMode =DB::table('request_mode')->select('id','name')->where('active_status',1)->get();
            $requesStatus =DB::table('request_status')->select('id','name')->where('active_status',1)->get();

            return view('ticket.edit_ticket_status_info', compact('ticketInfo','requestType','priority','requestMode','requesStatus'));
        }
    }

    public function updateStatusInfo(Request $request)
    {
        TicketModel::updateStatusInfo($request);

        if($request->ticket_status =='4'){

            $ticketId = $request->ticket_id;
            dispatch(new SendMailJob((object)$request->all(),$ticketId));
        }
        
        Session::flash('success', 'Data Updated successfully!');
        return redirect()->route('ticket');
    }

    public  function editAssignInfo(Request $request){
        $ticketId = $request->ticketId;

        if(!empty($ticketId)){
            
            $result = DB::table('tickets as tkt')
                ->select('tkt.employee_id','tkt.id','tkt.forecast_date')
                ->where('id',$ticketId)
                ->first();

            $employees = DB::table('employees')->select('id','name')->where('active_status',1)->get();

            return view('ticket.edit_ticket_assign_info', compact('result','employees'));

        }
    }

    public function updateAssignInfo(Request $request)
    {
        TicketModel::updateAssignInfo($request);
       
        Session::flash('success', 'Data Updated successfully!');
        return redirect()->route('ticket');
    }
}
