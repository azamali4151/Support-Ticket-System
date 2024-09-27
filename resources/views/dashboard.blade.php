@extends('layouts.master')
@section('content')
<style>
   ul li.active,
   a.active {
   color: #3fbbc0;
   }
</style>
<style>
   .p-5 {
   padding: 2rem!important;
   }
   .font-strong{
   font-weight: 600 !important;
   font-size: 2rem;
   color: white;
   }
   .m-b-5 {
   margin-bottom: 5px!important;
   padding-left: 10px;
   }
   small {
   font-size: 85%;
   padding-left: 10px;
   }
   .bg-success {
   background-color: #2ecc71!important;
   }
   .bg-info{background-color:#23b7e5!important}
   .bg-warning{background-color:#f39c12!important}
   .bg-danger{background-color:#e74c3c!important}
   .widget-stat-icon {
   position: absolute;
   top: 9px !important;
   right: 9px !important;
   width: 60px;
   height: 92% !important;
   line-height: 100px;
   text-align: center;
   font-size: 30px;
   background-color: rgba(0,0,0,.1);
   }
   .widget-stat-icon{position:absolute;top:0;right:0;width:60px;height:100%;line-height:100px;text-align:center;font-size:30px;background-color:rgba(0,0,0,.1)}
   .color-white {
   color: #fff!important;
   }
</style>
<div class="" role="main" >
   <div class="row">
      @if(Auth::user()->user_group =='1' || Auth::user()->user_group =='2')
      @php 
      $condition = '';
      if(Auth::user()->user_group =='2'){
      $userId = Auth::user()->id;
      $condition .= " and created_by = '$userId' ";
      }
      $openTicket = DB::selectOne("select count(id) open_ticket from tickets where active_status = 1 and ticket_status = 1 $condition ");
      $WorkingPorgress = DB::selectOne("select count(id) working_progress from tickets where active_status = 1 and ticket_status = 2 $condition ");
      $resolvedTicket = DB::selectOne("select count(id) resolved_ticket from tickets where active_status = 1 and ticket_status = 3 $condition ");
      $closedTicket = DB::selectOne("select count(id) closed_ticket from tickets where active_status = 1 and ticket_status = 4 $condition ");
      @endphp
      <div class="col-lg-3 col-md-6">
         <a href="#">
            <div class="ibox bg-warning color-white widget-stat">
               <div class="ibox-body">
                  <h2 class="m-b-5 font-strong">{{$openTicket->open_ticket}}</h2>
                  <div class="m-b-5">Open</div>
                  <i class="fa fa-folder-open widget-stat-icon"></i>
                  <div><i class="fa fa-leve-up m-r-5"></i></div>
               </div>
            </div>
         </a>
      </div>
      <div class="col-lg-3 col-md-6">
         <a href="#">
            <div class="ibox bg-info color-white widget-stat">
               <div class="ibox-body">
                  <h2 class="m-b-5 font-strong">{{$WorkingPorgress->working_progress}}</h2>
                  <div class="m-b-5">Working Progress</div>
                  <i class="fa fa-circle-o-notch widget-stat-icon"></i>
                  <div><i class="fa fa-leve-up m-r-5"></i></div>
               </div>
            </div>
         </a>
      </div>
      <div class="col-lg-3 col-md-6">
         <a href="#">
            <div class="ibox bg-success color-white widget-stat">
               <div class="ibox-body">
                  <h2 class="m-b-5 font-strong">{{$resolvedTicket->resolved_ticket}}</h2>
                  <div class="m-b-5">Resolved </div>
                  <i class="fa fa-check-circle widget-stat-icon"></i>
                  <div><i class="fa fa-leve-up m-r-5"></i></div>
               </div>
            </div>
         </a>
      </div>
      <div class="col-lg-3 col-md-6">
         <a href="#">
            <div class="ibox bg-danger color-white widget-stat">
               <div class="ibox-body">
                  <h2 class="m-b-5 font-strong">{{$closedTicket->closed_ticket}}</h2>
                  <div class="m-b-5">Closed</div>
                  <i class="fa fa-thumbs-up widget-stat-icon"></i>
                  <div><i class="fa fa-leve-down m-r-5"></i><small></small></div>
               </div>
            </div>
         </a>
      </div>
   </div>
   @endif
</div>
@endsection