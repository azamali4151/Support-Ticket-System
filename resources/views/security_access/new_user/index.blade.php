@extends('layouts.master') @section('content') 
<style>
    ul li.active,
    a.active {
        color: #3fbbc0;
    }

</style>
<div class="" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>{{$header['pageTitle']}}</h3>
            </div>
            <div class="title_right">
                <div class="item form-group">
                    <div class="col-md-3 col-sm-3 offset-md-9">
                        <button type="button" class="btn btn-primary btn-sm dynamicModal" pageTitle="Create New User"
                            pageLink="{{url('/createUser')}}" data-modal-size="modal-xl" data-toggle="tooltip"
                            data-placement="top" title="Create User">
                            Create User
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-lg-12">
                <div class="x_panel">
                    <div class="x_title">
                      <h2>{{$header['tableTitle']}} </h2> 

                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content" id="searchResultUser">
                         <div class="row">
                            <div class="col-sm-12">
                                <div class="card-box table-responsive">
                                    <table id="datatable"
                                        class="table table-striped table-bordered custom-table-border dataTable no-footer"
                                        role="grid" aria-describedby="datatable_info">
                                        <thead style="background-color: #0b58a2; color: white">
                                            <tr>
                                                <th class="center">#</th>
                                                <th class="center">Name</th>
                                                <th class="center">User name</th>
                                                <th class="center">Email</th>
                                                <th class="center">Status</th>
                                                <th class="center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($users as $key=> $user)
                                            <tr>
                                                <td>{{$key+1}}</td>
                                                <td>{{$user->name}}</td>
                                                <td style="color:blue">{{$user->email}}</td>
                                                <td>{{$user->email}}</td>
                                                <td>
                                                    @if($user->active_status == 1)
                                                    <label>
                                                        <span type="" class="btn btn-primary btn-sm">Active</span>
                                                    </label>
                                                    @else
                                                    <label>
                                                        <span type="" class="btn btn-warning btn-sm">Inactive</span>
                                                    </label>

                                                    @endif
                                                </td>
                                                <td class="text-center">
                                                        <button type="button" class="btn btn-info btn-sm dynamicModal"
                                                            pageTitle="Update User"
                                                            pageLink="{{url('/updateUser/'.$user->id)}}"
                                                            data-modal-size="modal-xl" data-toggle="tooltip"
                                                            data-placement="top" title="Update User">
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
