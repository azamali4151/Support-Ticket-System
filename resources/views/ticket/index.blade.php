@extends('layouts.master')
@section('content')
<style>
   ul li.active,
   a.active {
   color: #3fbbc0;
   }
   table.dataTable tbody tr.even{
   background-color:#EBEDEF;
   }
   table.dataTable tbody tr.odd{
   background-color:#D0ECE7;
   } 
   table.dataTable tbody tr:hover{
   background-color: lightblue;
   }
   table.dataTable tbody tr:hover{
   transform: translateY(-7px);
   transition: transform 0.3s ease;
   box-shadow: 0 8px 6px -6px black;
   }
</style>
<div class="" role="main">
   <div class="">
      <div class="page-title">
         <div class="title_left">
            <h5>{{$header['pageTitle']}} </h5>
         </div>
         @if(Auth::user()->user_group =='2')
         <div class="title_right">
            <div class="item form-group">
               <div class="col-md-3 col-sm-3 offset-md-9">
                  <button type="button" class="btn btn-sm btn-primary dynamicModal" pageTitle="Add Ticket"
                     pageLink="{{URL::route('createTicket')}}" data-toggle="tooltip" data-placement="left"
                     title="Add Ticket" data-target=".bs-example-modal-lg" data-modal-size="modal-lg">Add
                  New</button>
               </div>
            </div>
         </div>
         @endif
      </div>
      <div class="clearfix"></div>
      <div class="row">
         <div class="col-md-12 col-sm-12 col-lg-12">
            <div class="x_panel">
               <div class="x_content" style="">
                  <div class="row">
                     <div class="col-sm-12">
                        <div class="card-box table-responsive searchResult">
                           <table id="datatable" class="table table-striped table-bordered dataTable "
                              role="grid" aria-describedby="data-table-info" width="100%">
                              <thead style="background-color: #0b58a2; color: white">
                                 <tr>
                                    <th>Sl</th>
                                    <th>Ticket No</th>
                                    <th>Title</th>
                                    <th>Priority</th>
                                    @if(Auth::user()->user_group == '1')
                                    <th>Request By</th>
                                    @endif
                                    <th>Assign To</th>
                                    <th>Assign Date</th>
                                    <th>Forecast Date</th>
                                    <th>Ticket Status</th>
                                    <th>Task %</th>
                                    <th>Action</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 @foreach($results as $key=> $result)
                                 <tr>
                                    <td>{{$key+1}}</td>
                                    <td>{{$result->ticket_no}}</td>
                                    <td>{{$result->ticket_title}}</td>
                                    <td>{{$result->ticket_piority}}</td>
                                    @if(Auth::user()->user_group == '1')
                                    <td>{{$result->request_by}}</td>
                                    @endif
                                    <td>
                                       @php 
                                       if($result->employee_id){
                                       $assignEmp = DB::table('employees')->select('name')->where('id',$result->employee_id)->first();
                                       echo $assignEmp->name;
                                       }
                                       @endphp
                                    </td>
                                    <td>@if($result->assign_date){{date('d-M-Y',strtotime($result->assign_date))}} @endif</td>
                                    <td>@if($result->forecast_date){{date('d-M-Y',strtotime($result->forecast_date))}}@endif</td>
                                    <td>{{$result->ticket_status}}</td>
                                    <td>{{$result->task_complete}}</td>
                                    <td>
                                       <button type="button" class="btn btn-info btn-sm dynamicModal"
                                          pageTitle="Update Ticket Assign"
                                          pageLink="{{url('/updateTicketAssign/'.$result->id)}}"
                                          data-modal-size="modal-lg" data-toggle="tooltip"
                                          data-placement="top" title="Update Ticket Assign">
                                       <i class="glyphicon glyphicon-edit"></i>
                                       </button>
                                    </td>
                                 </tr>
                                 @endforeach
                              </tbody>
                           </table>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(document).ready(function() {
   var logoDir = '';
   var orgName ='';
   var tableName = $('.table').attr('title');
   $('.dataTable').dataTable( {
       dom: 'Blfrtip',
       buttons: [
       ],
       fixedColumns: {
       left: 1,
       right: 1
       },
       fixedHeader: {
           header: true,
           footer: true
       },
       scrollCollapse: true,
       scrollX: true,
       scrollY: 400
       });
   } );
   
</script>
<script>
   $(document).ready(function(){
       $('.select2').select2();
   });
   
</script>
<script>
   $(document).on('click','.modalClass',function(){
      var modal_size = $(this).attr('data-modal-size');
      if ( modal_size!=='' && typeof modal_size !== typeof undefined && modal_size !== false ) {
      $("#modalSize").addClass(modal_size);
    }
    else{
      $("#modalSize").addClass('modal-lg');
   
       }
   
     var pageTitle = $(this).attr('pageTitle');
     var pageLink = $(this).attr('pageLink');
     $('.modal .modal-title').html(pageTitle)
     $('.modal .modal-body').html("Content loading please wait......")
     $('.modal').modal("show");
     $('.modal .modal-body').load(pageLink)
    })
   
</script>
@endsection