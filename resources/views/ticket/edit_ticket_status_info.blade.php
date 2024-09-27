@section('content')
    @php $actionUrl=url('/updateTicketStatusInfo'); @endphp
    <script>$('form').parsley();</script>
    <?php ini_set('memory_limit', -1) ?>
    <div class="flash-message"></div>
    <div class="x_content">
        <form id="ClassRoutineForm" data-parsley-validate="" role="form" method="post" action="{{$actionUrl}}"
              class="form-label-left" enctype="multipart/form-data" autocomplete="off">
            @csrf
            <div class="field item form-group">
                <label class="col-form-label col-md-3 col-sm-3  label-align">Status*</label>
                <div class="col-md-6 col-sm-6">
                    <select class="form-control select2" name="ticket_status" required id="status">
                        <option value="">--select--</option>
                        @foreach($requesStatus as $value)
                        <option value="{{$value->id}}" @if($ticketInfo->ticket_status == $value->id) selected @endif>{{$value->name}}</option>
                        @endforeach
                    </select>
                </div>
            </div>

            <div class="field item form-group">
                <label class="col-form-label col-md-3 col-sm-3  label-align">Request Type*</label>
                <div class="col-md-6 col-sm-6">
                    <select class="form-control select2" name="request_type_id" id="request_type_id" required>
                        <option value="">--select--</option>
                        @foreach($requestType as $value)
                        <option value="{{$value->id}}" @if($ticketInfo->request_type_id == $value->id) selected @endif>{{$value->name}}</option>
                        @endforeach
                    </select>
                </div>
            </div>

            <div class="field item form-group">
                <label class="col-form-label col-md-3 col-sm-3  label-align">Priority*</label>
                <div class="col-md-6 col-sm-6">
                    <select class="form-control select2" name="priority_id" id="" required>
                        <option value="">--select--</option>
                        @foreach($priority as $value)
                        <option value="{{$value->id}}" @if($ticketInfo->priority_id == $value->id) selected @endif>{{$value->name}}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="field item form-group">
                <label class="col-form-label col-md-3 col-sm-3  label-align">Request Mode*</label>
                <div class="col-md-6 col-sm-6">
                    <select class="form-control select2" name="request_mode_id" id="" required>
                        <option value="">--select--</option>
                        @foreach($requestMode as $value)
                        <option value="{{$value->id}}" @if($ticketInfo->request_mode_id == $value->id) selected @endif>{{$value->name}}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="field item form-group">
                <label class="col-form-label col-md-3 col-sm-3  label-align">Remarks</label>
                <div class="col-md-6 col-sm-6">
                    <input type="text" name="remarks" value="{{$ticketInfo->remarks}}" class="form-control">
                </div>
            </div>

            <div class="clearfix"></div>
            <input type="hidden" value="{{$ticketInfo->id}}" name="ticket_id">

            <div class="form-group">
                <div class="col-md-6 offset-md-3">
                    <button type='reset' class="btn btn-success">Reset</button>
                    <button type="submit" class="btn btn-primary" id="btnSubmit">Submit</button>
                </div>
            </div>

        </form>
    </div>

    <script type="text/javascript">
        $('.select2').select2({
            dropdownParent: $('.modal .modal-content')
        });
    </script>

    
