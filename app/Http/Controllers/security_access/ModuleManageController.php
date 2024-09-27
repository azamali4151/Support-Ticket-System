<?php

namespace App\Http\Controllers\security_access;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Auth;
use DB;
use Session;

class ModuleManageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
  

    public function userIndex()
    {
        $header = array(
            'pageTitle' => 'Create user',
            'tableTitle' => 'All user List',
        );
        $users = DB::table('users')
       ->select('*')
        ->orderBy('id', 'asc')
        ->get();

        return view('security_access.new_user.index',compact('header','users'));
    }
    

    public function updateUser(Request $request, $userId){
       if($_POST){
        $userData = array(
            "user_group"=> $request->group_name,
            "contact_no"=> $request->contact_no,
            "name"=> $request->user_name,
            "email"=> $request->email,
            "employee_id"=> $request->employee_id,
            "active_status"=> $request->status,
            "updated_by"          => Auth::user()->id,
            "updated_at"          => date('Y-m-d H:i:s'),
        );
        DB::beginTransaction();
        try {
            DB::table('users')
                ->where('id', $userId)
                ->update($userData);

            DB::commit();
            
        } catch (\Throwable $e) {
            DB::rollback();
            throw $e;
        }
        Session::flash('success', 'Data Updated successfully!');
        return redirect()->route('userIndex');
       }else{
        $employees = DB::table('employees')->select('id','name')->where('active_status',1)->get();
        $userInfo = DB::table('users')->find($userId);
        return view('security_access.new_user.edit_user',compact('userInfo','employees'));
       }
    }
    
    public function store(Request $request)
    {
        if (User::where('email', $request->email)->exists()) {
            Session::flash('error', 'User name already exists please try another!');
            return redirect()->route('userIndex');

        }else{
            
            $userData = array(
                "user_group"=> $request->group_name,
                "contact_no"=> $request->contact_no,
                "name"=> $request->user_name,
                "email"=> $request->email,
                "password"=>bcrypt(request('password')),
                "employee_id"=> $request->employee_id,
                "active_status"=> $request->status,
            );

            DB::beginTransaction();
            try {
                DB::table('users')
                    ->insert($userData);
    
                DB::commit();
                
            } catch (\Throwable $e) {
                DB::rollback();
                throw $e;
            }

            Session::flash('success', 'Data Saved successfully!');
            return redirect()->route('userIndex');
        }

    }

    public function createUser()
    {
        $employees = DB::table('employees')->select('id','name')->where('active_status',1)->get();
        return view('security_access.new_user.create',compact('employees'));
    }
}
