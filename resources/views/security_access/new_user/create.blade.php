@section('content') 
@php $actionUrl=url('/storeUser'); @endphp
<script>
    $('form').parsley();

</script>
<?php ini_set('memory_limit', -1) ?>
<div class="flash-message"></div>
<div class="x_content">
    <div class="col-lg-12 col-md-12 col-sm-12">
        <form id="" data-parsley-validate="" role="form" method="post" action="{{$actionUrl}}" class="form-label-left"
            enctype="multipart/form-data" autocomplete="off">
            <input type="hidden" name="_token" id="_token" value="{{ csrf_token() }}" />
            <div class="col-lg-6 col-md-6 col-sm-6">
               
                <div class="field item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">User Group
                        <span class="required input-field-required-sign">*</span>
                    </label>
                    <div class="col-lg-9 col-md-9 col-sm-9">
                        <select class="form-control" name="group_name" id="groupName" required>
                            <option value="">--select--</option>
                            <option value="1">Admin</option>
                            <option value="2">Support User</option>
                            <option value="3">Employee</option>
                        </select>
                    </div>
                </div>
                <div class="field item form-group">
                    <label class="col-form-label col-md-3 col-sm-3 label-align">Employee
                        <span class="required input-field-required-sign"></span>
                    </label>
                    <div class="col-lg-9 col-md-9 col-sm-9">
                        <select class="form-control" name="employee_id" id="empId">
                            <option value="">--select--</option>
                            @foreach($employees as $emp)
                            <option value="{{$emp->id}}">{{$emp->name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="field item form-group">
                    <label class="col-form-label col-md-3 col-sm-3  label-align">Full Name
                        <span class="required input-field-required-sign">*</span>
                    </label>
                    <div class="col-lg-9 col-md-9 col-sm-9">
                        <input class="form-control input-field-required-sign" name="user_name" id="user_name"
                            placeholder="" required />
                    </div>
                </div>
                <div class="field item form-group">
                    <label class="col-form-label col-md-3 col-sm-3  label-align">Contact No.
                        <span class="required input-field-required-sign">*</span>
                    </label>
                    <div class="col-lg-9 col-md-9 col-sm-9">
                        <input type="number" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control input-field-required-sign" name="contact_no" id="contact_no"
                            placeholder="" required />
                    </div>
                </div>
            </div>

            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="field item form-group">
                    <label class="col-form-label col-md-3 col-sm-3  label-align">User Name
                        <span class="required input-field-required-sign">*</span>
                    </label>
                    <div class="col-lg-9 col-md-9 col-sm-9">
                        <input class="form-control input-field-required-sign" name="email" id="login_name"
                            placeholder="" required />
                    </div>
                </div>
                <div class="field item form-group">
                    <label class="col-form-label col-md-3 col-sm-3  label-align">Password
                        <span class="required input-field-required-sign">*</span>
                    </label>
                    <div class="col-lg-9 col-md-9 col-sm-9">
                        <input type="password" class="form-control input-field-required-sign" name="password"
                            id="password" placeholder="" required />
                    </div>
                </div>
                <div class="field item form-group">
                    <label class="col-form-label col-md-3 col-sm-3  label-align">Active Status
                        <span class="required  input-field-required-sign">*</span>
                    </label>
                    <div class="col-lg-9 col-md-9 col-sm-9">
                        <select class="form-control" name="status">
                            <option value="1"> Active</option>
                            <option value="0">Inactive</option>
                        </select>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="form-group">
                    <div class="col-md-6 offset-md-3">
                        <button type='reset' class="btn btn-success">Reset</button>
                        <button type="submit" id='saveBtnStudentInfo' class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

