<?php

namespace App\Jobs;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;
use Illuminate\Support\Facades\Mail;
use DB;
class SendMailJob implements ShouldQueue
{
    use Queueable;
    public $request;
    public $ticketId;

    /**
     * Create a new job instance.
     */
    public function __construct($request, $ticketId)
    {
        $this->request = $request;
        $this->ticketId = $ticketId;
    }

    static function sendMail($ticketId){

        $results = DB::table('tickets')->select('*')->where('id',$ticketId)->first();

        if($results->ticket_status =='4'){
            $userMail = DB::table('users')->select('email')->where('id',$results->created_by)->first();
            $data['results']= $results;
            $data['title'] = 'Closed Ticket';
            $data['form_email'] = 'azamaliphp@gmail.com';
            $data['support_user_mail'] = $userMail->email;
            $data['form_name'] = 'Ticketing System';
    
            $sent = Mail::send('emails.ticket_closed', $data, function ($m) use ($data) {
                $m->from($data['form_email'], $data['form_name']);
                $m->to($data['support_user_mail']);
                $m->subject($data['title']);
            });
        }else{

            $data['results']= $results;
            $data['title'] = 'Support Ticket';
            $data['form_email'] = 'azamaliphp@gmail.com';
            $data['admin_mail'] = 'azamalibd808@gmail.com';
            $data['form_name'] = 'Ticketing System';
    
            $sent = Mail::send('emails.support_user_mail', $data, function ($m) use ($data) {
                $m->from($data['form_email'], $data['form_name']);
                $m->to($data['admin_mail']);
                $m->subject($data['title']);
            });
        }
       
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $ticketId =  $this->ticketId;
        $this::sendMail($ticketId);
    }
}
