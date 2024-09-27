@extends('layouts.master')

@section('content')
<style>
    ul li.active,
    a.active {
        color: #3fbbc0;
    }

    tr:nth-child(even) tr {background: #ffffff !important;}

</style>
<div class="" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h5>{{$header['pageTitle']}} </h5>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-lg-12">
                <div class="x_panel">
                    <div class="x_title" style="border:none;">
                        <h2>{{$header['tableTitle']}} </h2>
                    </div>
                    <div class="x_content">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card-box table-responsive">
                                <table id="datatable"
                                        class="table table-striped table-bordered custom-table-border dataTable no-footer"
                                        role="grid" aria-describedby="datatable_info">
                                        <thead style="background-color: #0b58a2; color: white">
                                            <tr>
                                                <th class="center">#</th>
                                                <th class="center">Task Title</th>
                                                <th class="center">Task Description</th>
                                                <th class="center">Ticket No</th>
                                                <th class="center">Assign By</th>
                                                <th class="center">Forecast Date</th>
                                                <th class="center">Piority</th>
                                                <th class="center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($results as $key=> $result)
                                            <tr>
                                                <td>{{$key+1}}</td>
                                                <td>{{$result->task_title}}</td>
                                                <td>{{$result->task_desc}}</td>
                                                <td>{{$result->ticket_no}}</td>
                                                <td>{{$result->assign_person_name}}</td>
                                                <td>{{$result->forecast_date}}</td>
                                                <td>{{$result->task_priority}}</td>
                                                <td class="text-center">
                                                        <button type="button" class="btn btn-info btn-sm dynamicModal"
                                                            pageTitle="Update Task"
                                                            pageLink="{{url('/updateTask/'.$result->task_id)}}"
                                                            data-modal-size="modal-xl" data-toggle="tooltip"
                                                            data-placement="top" title="Update Task">
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
   
@endsection
